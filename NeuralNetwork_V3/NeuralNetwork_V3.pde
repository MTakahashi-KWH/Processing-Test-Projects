import java.util.ArrayList;
ArrayList<Layer> Network = new ArrayList<Layer>();
float[] input = {.5,.5,.5,.5,.5};
float[] output = new float[5];


void setup(){
  size(900,900);
  initialize();
  setInput();
  passthrough();
  extractOutput();
}

void draw(){
  background(0);
  noStroke();
  for(int i =0; i< Network.size(); i++){
    ArrayList<Neuron> alpha = Network.get(i).passUp();
    for(int j =0 ; j< alpha.size(); j++){
      fill(alpha.get(j).getVal()*64);
      rect(i*100,j*100,100,100);
    }
  }
}

void initialize(){
  Network.add(new Layer(0,5));
  for(int i=1; i< 8; i++){
    Network.add(new Layer( i , ((int)(Math.random()*5+4)) ));
  }
  Network.add(new Layer(4,5));
  for(int j =0; j< (Network.size()-1); j++){
    Network.get(j).gendaughters(Network.get(j+1).getSize());
  }
}

void setInput(){
  ArrayList<Neuron> alpha = Network.get(0).passUp();
  for(int i =0; i< input.length; i++){
    alpha.get(i).calcVal(input[i]);
  }
}

void passthrough(){
 for(int i =0; i < (Network.size()-1); i++){
   ArrayList<Neuron> alpha = Network.get(i).passUp();
   ArrayList<Neuron> aleph = Network.get(i+1).passUp();
   for(int j =0; j< alpha.size(); j++){
     int[] beta = alpha.get(j).passchildren();
     float[] castor = alpha.get(j).passaxons();
     float val = alpha.get(j).getVal();
     for(int k =0; k< beta.length; k++){
       aleph.get(beta[k]).calcVal(castor[k] * val);
     }
   }
 }
}
 
void extractOutput(){
  ArrayList<Neuron> alpha = Network.get(Network.size()-1).passUp();
  for(int i =0; i< output.length; i++){
    output[i] = alpha.get(i).getVal();
  }
}
