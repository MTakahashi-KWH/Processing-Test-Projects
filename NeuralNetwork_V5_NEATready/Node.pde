import java.util.ArrayList;

public class Node implements Cloneable{
  public double value;
  public ArrayList<Node> daughters;
  public ArrayList<Double> axons;
  public int activationtype = 0;
  
  public Node(){
    value = (double)0.0;
    daughters = new ArrayList<Node>();
    axons = new ArrayList<Double>();
  }
  public Node(ArrayList<Node> a, ArrayList<Double> b){
    value = (double)0.0;
    daughters = (ArrayList<Node>)a.clone();
    axons = (ArrayList<Double>)b;
  }
  public void init(ArrayList<Node> a){
    daughters = (ArrayList<Node>)a.clone();
    axons = new ArrayList<Double>();
    for(int i =0; i< daughters.size();i++){
      axons.add(new Double(Math.random()));
    }
  }
  public double getValue(){
    return value;
  }
  public void insert(Node a){
    daughters.add(a);
    axons.add(new Double(Math.random()));
  }
  public void charge(double a){
    value += a;
  }
  public void activate(){
    for(int i = 0; i< daughters.size(); i++){
      daughters.get(i).charge(value*axons.get(i));
    }
    clearnode();
  }
  public void clearnode(){
    switch(activationtype){
      case 1:
        value = (double)0.0;
        break;
      default:
        value = (double)0.0;
        break;
    }
  }
  public void mutate(){
    for(int i=0 ; i < axons.size(); i++){
      if(Math.random() > 0.9){
        axons.set(i, new Double(axons.get(i)+ Math.random()/10 - .05));
      }
    }
  }
  @Override
  public Node clone(){
    return new Node(daughters, axons);
  }
}
