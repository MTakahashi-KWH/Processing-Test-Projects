import java.util.ArrayList;

class Network{
  ArrayList<Layer> Network = new ArrayList<Layer>();
  float[] output = new float[5];
  
  
  
  public Network(int layers, int input, int output){
    initialize(layers,input,output);
    this.output = new float[output];
  }
  
  public Network(int layers, int input, int output, int layerdepth){
    initialize(layers,input,output, layerdepth);
    this.output = new float[output];
  }
  
  public Network(ArrayList<Layer> a){
    Network = a;
  }
  
  public float[] run(float[] a){
    setInput(a);
    passthrough();
    extractOutput();
    return output;
  }
  
  public ArrayList<Layer> passUpNetwork(){
    return Network;
  }
  
  public void initialize(int a, int b, int c){
    Network.add(new Layer(0,b));
    for(int i=1; i< (a-1); i++){
      Network.add(new Layer( i , ((int)(Math.random()*5+4)) ));
    }
    Network.add(new Layer(4,c));
    for(int j =0; j< (Network.size()-1); j++){
      Network.get(j).gendaughters(Network.get(j+1).getSize());
    }
  }
  
  public void initialize(int a, int b, int c, int d){
    Network.add(new Layer(0,b));
    for(int i=1; i< (a-1); i++){
      Network.add(new Layer( i , d ));
    }
    Network.add(new Layer(4,c));
    for(int j =0; j< (Network.size()-1); j++){
      Network.get(j).gendaughters(Network.get(j+1).getSize());
    }
  }
  
  public void setInput(float[] input){
    ArrayList<Neuron> alpha = Network.get(0).passUp();
    for(int i =0; i< input.length; i++){
      alpha.get(i).calcVal(input[i]);
    }
  }
  
  public void passthrough(){
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
   
  public void extractOutput(){
    ArrayList<Neuron> alpha = Network.get(Network.size()-1).passUp();
    for(int i =0; i< output.length; i++){
      output[i] = alpha.get(i).getVal();
    }
  }
}
