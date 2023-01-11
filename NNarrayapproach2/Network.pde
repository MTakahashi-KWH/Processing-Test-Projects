import java.util.ArrayList;
import java.util.Arrays;
class Network{
    ArrayList<DAarray> layersA = new ArrayList<DAarray>();
    int[][] neureact;
  
  public Network(int inputl,int ninteriorlayers, int outputl){
    neureact = new int[ninteriorlayers+ 1][];
    layersA.add(new DAarray(inputl,outputl));
    neureact[0] = new int[layersA.get(0).outputSize()];
    for(int k=0; k< neureact[0].length; k++){
      neureact[0][k] = 0;
      //System.out.println(neureact[i].length);
    }
    //System.out.println(Arrays.toString(neureact[0]));
    for(int i =0; i < ninteriorlayers; i++){
      layersA.add(new DAarray(layersA.get(i).outputSize(),outputl));
      int[] tmp = new int[layersA.get(i+1).outputSize()];
      //System.out.println(layersA.get(i+1).outputSize());
      neureact[i+1] = tmp;
      for(int j=0; j< neureact[i+1].length; j++){
        neureact[i+1][j] = 0;
        //System.out.println(neureact[i].length);
      }
      //System.out.println(Arrays.toString(neureact[i+1]));
    }
    
  }
  
  public float[] run(float[] input){
    float[] alpha = input;
    for(int i =0; i< layersA.size(); i++){
      //System.out.println(layersA.size());
      alpha = layersA.get(i).passthrough(alpha);
      for(int j = 0; j< alpha.length; j++){
        //System.out.println(alpha.length);
        //System.out.print(alpha.length + "" + neureact[i].length);
        alpha[j] = activate(alpha[j],neureact[i][j]);
      }
      //System.out.print(Arrays.toString(neureact[i]) + "\t" + Arrays.toString(alpha) + "\n");
    }
    return alpha;
  }
  
  public float activate(float a, int b){
    switch(b){
      case 1:
        return 0;
      default:
        return a*1;
    }
  }
  public void evolve(){
    for(int i =0; i< layersA.size(); i++){
      layersA.get(i).mutate();
    }
  }
  
  
}
