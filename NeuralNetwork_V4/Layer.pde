import java.util.ArrayList;
class Layer{
  private int Lnum;
  public ArrayList<Neuron> lyrNrns = new ArrayList<Neuron>();
  
  public Layer(int a, ArrayList<Neuron> b){
    Lnum = a;
    lyrNrns = b;
  }
  
  public Layer(int a,int b){
    Lnum =a;
    for(int i=0; i < b ; i++){
      lyrNrns.add(new Neuron());
    }
  }
  
  public void gendaughters(int a){
    for(int i =0; i < lyrNrns.size(); i++){
      lyrNrns.get(i).iniChildren(a);
    }
  }
  
  public int getSize(){
    return lyrNrns.size();
  }
  
  public ArrayList<Neuron> passUp(){
    return lyrNrns;
  }
  
}
