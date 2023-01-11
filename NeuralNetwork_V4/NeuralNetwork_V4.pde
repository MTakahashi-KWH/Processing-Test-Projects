import java.util.ArrayList;
ArrayList<Network> generation = new ArrayList<Network>();
float[] input = {.5,.5,.5,.5,.5,1,1,1,1,1,.2,.2};
float[] output = new float[5];


void setup(){
  size(900,900);
  for(int j =0; j< 3; j++){
    generation.add(new Network(12,12,12));
  }
  for(int i=0; i< generation.size(); i++){
    generation.get(i).run(input);
  }
}

void draw(){
  background(0);
  noStroke();
  for(int k =0; k< generation.size(); k++){
    ArrayList<Layer> aleph = generation.get(k).passUpNetwork();
    for(int i =0; i< aleph.size(); i++){
      ArrayList<Neuron> alpha = aleph.get(i).passUp();
      int placement = 300/(alpha.size()+2);
      for(int j =0 ; j< alpha.size(); j++){
        fill(alpha.get(j).getVal()*128);
        rect(i*20,(j+1)*placement +k*300,20,20);
      }
    }
  }
}
