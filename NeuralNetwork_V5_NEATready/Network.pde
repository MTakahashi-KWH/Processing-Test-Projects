import java.util.ArrayList;
public class Network implements Cloneable{
  public Layer input;
  public ArrayList<Layer> body;
  public Layer output;
  
  public Network(int a, int b, int c){
    input = new Layer(a);
    body = new ArrayList<Layer>();
    for(int i=0; i< b; i++){
      body.add(new Layer((int)(Math.random()*5+1)));
    }
    output = new Layer(c);
  }
  public Network(Layer a, ArrayList<Layer> b, Layer c){
    input = a;
    body = b;
    output = c;
  }
  public void instantiate(){
    if(body.size() > 0){
      input.initialize(body.get(0).data());
      for(int i=0; i< body.size()-1; i++){
        body.get(i).initialize(body.get(i+1).data());
      }
      body.get(body.size()-1).initialize(output.data());
    }else{
      input.initialize(output.data());
    }
  }
  public double[] run(double[] a){
    input.inputvec(a);
    input.activateLayer();
    for(int i=0; i < body.size(); i++){
      body.get(i).activateLayer();
    }
    double[] alpha = output.extract();
    output.activateLayer();
    return alpha;
  }
  
  @Override
  public Network clone(){
    ArrayList<Layer> alpha = new ArrayList<Layer>();
    for(int i =0; i < body.size(); i++){
      alpha.add(body.get(i).clone());
    }
    return new Network(input.clone(), alpha, output.clone());
  }
}
