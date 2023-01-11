class Neuron{
  private int[] daughters;
  private float[] axonweight;
  private int layer;
  private float value = 0;
  
  public Neuron(int[] a,int  c){
    daughters= a;
    layer = c;
  }
  
  public Neuron(int[] a, int c, float[] d){
    daughters= a;
    layer = c;
    axonweight = d;
  }
  
  public void setaxons(float[] a){
    axonweight = a;
  }
  
  public float getVal(){
    return value; 
  }
  
  public void zeroVal(){
    value = 0; 
  }
  
  public void calcVal(float[] a){
    for(int i=0; i < a.length; i++){
      value += (a[i]); 
    }
  }
  public int getlayer(){
    return layer;
  }
  
}
