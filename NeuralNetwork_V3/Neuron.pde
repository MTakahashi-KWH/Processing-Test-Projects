class Neuron{
  private int[] daughters;
  private float[] axonweight;
  private float value = 0;
  
  public Neuron(int[] a){
    daughters= a;
  }
  
  public Neuron(){
  }
  
  public Neuron(int[] a, float[] d){
    daughters= a;
    axonweight = d;
  }
  
  public void setaxons(float[] a){
    axonweight = a;
  }
  
  public void setChildren(int[] a){
    daughters = a;
  }
  
  public void iniChildren(int a){
    daughters = new int[a];
    for(int i=0; i< a; i++){
      daughters[i] = i;
    }
    axonweight = new float[a];
    for(int j =0; j < a; j++){
      axonweight[j] = (float)Math.random()/2;
    }
  }
  
  public float getVal(){
    return value; 
  }
  
  public void zeroVal(){
    value = 0; 
  }
  
  public void calcVal(float a){
    value += (a); 
  }
  
  public int[] passchildren(){
    return daughters;
  } 
  
  public float[] passaxons(){
    return axonweight;
  }
  
}
