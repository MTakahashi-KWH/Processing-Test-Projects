import java.util.ArrayList;

ArrayList<Neuron> Network = new ArrayList<Neuron>();
float[] input = {1,1,1};


void setup(){
  size(900,900);
  for(int i = 0; i<3; i++){
     for(int j = 0; j < 3; j++){
        int[] dtrs = {(i+1)*3,(i+1)*3+1,(i+1)*3+2};
        Network.add(new Neuron(dtrs,i)); 
     }
  }
  Networkin();
}

void draw(){
  background(0);
  stroke(255);
  for(int i =0; i < 3 ; i++){
    for(int j=0; j < 3; j++){
      fill((int)(255*Network.get(i*3 + j).getVal()));
      System.out.println((int)(125*Network.get(i*3 + j).getVal()));
      rect(i*100,j*100,100,100);
    }
  }
}


void Networkin(){
  for(int i =0; i< Network.size();i ++){
    Network.get(i).zeroVal();
  }
  for(int j=0; j < 3; j++){
    float[] alpha = {input[j]};
    Network.get(j).calcVal(alpha);
  }
}
