import java.util.ArrayList;
import java.util.Arrays;
class Network{
    ArrayList<DAarray> layersA = new ArrayList<DAarray>();
    int[][] neureact;
  
  public Network(int inputl,int ninteriorlayers, int outputl){
    neureact = new int[ninteriorlayers+ 1][];
    layersA.add(new DAarray(inputl,outputl));
    for(int i =0; i < ninteriorlayers; i++){
      layersA.add(new DAarray(layersA.get(i).outputSize(),outputl));
      neureact[i] = new int[layersA.get(i).outputSize()];
      for(int j=0; j< neureact[i].length; j++){
        neureact[i][j] = 0;
      }
    }
  }
  
  public float[] run(float[] input){
    float[] alpha = input;
    for(int i =0; i< layersA.size(); i++){
      float[] ubtemp = layersA.get(i).passthrough(alpha);
      alpha = new float[ubtemp.length];
      for(int j = 0; j< ubtemp.length; j++){
        System.out.print(ubtemp.length + "" + neureact[i].length);
        System.out.print(Arrays.toString(neureact) + "\t" + Arrays.toString(ubtemp) + "\n");
        alpha[j] = activate(ubtemp[j],neureact[i][j]);
      }
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
