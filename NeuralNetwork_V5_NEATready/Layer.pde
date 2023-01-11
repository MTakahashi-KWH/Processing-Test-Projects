import java.util.ArrayList;

public class Layer implements Cloneable{
  public ArrayList<Node> layer;
  
  public Layer(){
    layer = new ArrayList<Node>();
  }
  
  public Layer(ArrayList<Node> a){
    layer = (ArrayList<Node>)a.clone();
  }
  public Layer(int a){
    layer = new ArrayList<Node>();
    for(int i = 0; i< a; i++){
      layer.add(new Node());
    }
  }
  public void activateLayer(){
    for(int i =0; i<layer.size(); i++){
      layer.get(i).activate();
    }
  }
  public void evolve(){
    for(int i =0; i<layer.size(); i++){
      layer.get(i).mutate(); 
    }
  }
  public void inputvec(double[] a){
    for(int i=0; i< a.length; i++){
      layer.get(i).charge(a[i]);
    }
  }
  public double[] extract(){
    double[] alpha = new double[layer.size()];
    for(int i=0; i< layer.size();i++){
      alpha[i] = layer.get(i).getValue();
    }
    return alpha;
  }
  public ArrayList<Node> data(){
    return (ArrayList<Node>)layer.clone();
  }
  public void initialize(ArrayList<Node> a){
    for(int i =0; i< layer.size(); i++){
      layer.get(i).init(a);
    }
  }
  @Override
  public Layer clone(){
    ArrayList<Node> alpha = new ArrayList<Node>();
    for(int i =0; i< layer.size(); i++){
      alpha.add(layer.get(i).clone());
    }
    return new Layer(alpha);
  }
}
