class DAarray implements Cloneable{
  float[][] data;
  
  public DAarray(int m, int n){
    data = new float[m][n];
  }
  public DAarray(float[][] parent){
    data = parent;
  }
  public void addOutput(){
    float[][] alpha = new float[data.length][data[0].length +1];
    for(int i =0; i < data.length; i++){
      for(int j=0; j < data[0].length; j++){
        alpha[i][j] = data[i][j];
      }
    }
  }
  
  public void addInput(){
    float[][] alpha = new float[data.length+1][data[0].length ];
    for(int i =0; i < data.length; i++){
      for(int j=0; j < data[0].length; j++){
        alpha[i][j] = data[i][j];
      }
    }
  }
  public float[] passthrough(float[] input){
    float[] alpha = new float[data[0].length];
    for(int i = 0; i< data[0].length; i++){
      for(int j =0; j< data.length; j++){
        alpha[i] += input[j] * data[j][i];
      }
    }
    return alpha;
  }
  
  public void mutate(){
    for(int i =0; i< data.length; i++){
      for(int j=0; j<data[0].length; j++){
        float variance = ((float)Math.random()-0.5)/5;
        data[i][j] = Math.max(data[i][j] + variance, 0);
      }
    }
  }
  public int inputSize(){
    return data.length;
  }
  public int outputSize(){
    return data[0].length;
  }
  
  @Override
  public DAarray clone(){
    DAarray alpha = new DAarray(data);
    return alpha;
  }
}
