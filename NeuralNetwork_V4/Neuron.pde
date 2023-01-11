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
  
  public void inherit(){
    for(int i =0; i< axonweight.length; i++){
      if((Math.random()*5) >3){
        if(Math.random() > .5){
          axonweight[i] += .01;
        }else{
          axonweight[i] -= .01;
        }
      }
    }
  }
  
  public void inherit(int a){
    for(int i =0; i< axonweight.length; i++){
      if((Math.random()*a) >3){
        if(Math.random() > .5){
          axonweight[i] += .01;
        }else{
          axonweight[i] -= .01;
        }
      }
    }
  }
  
  public void iniChildren(int a){
    daughters = new int[a];
    for(int i=0; i< a; i++){
      daughters[i] = i;
    }
    axonweight = new float[a];
    for(int j =0; j < a; j++){
      axonweight[j] = (float)Math.random()/2.75;
    }
  }
  
  
  public void iniChildren(int a, float[] b){
    daughters = new int[a];
    for(int i=0; i< a; i++){
      daughters[i] = i;
    }
    axonweight = new float[a];
    for(int j =0; j < b.length; j++){
      axonweight[j] = b[j];
    }
    for(int k =0; k<(a-b.length); k++){
      axonweight[k+b.length] = (float)Math.random()/2.75;
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
