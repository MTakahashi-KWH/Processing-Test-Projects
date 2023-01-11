public class DynamicPoint{
  int[] position;
  public DynamicPoint(){
    position = new int[2];
  }
  
  public DynamicPoint(int x, int y){
    this();
    position[0] = x;
    position[1] = y;
  }
  
  public DynamicPoint(int[] currentPos){
    this();
    position = currentPos;
  }
  
  public DynamicPoint(float[] currentPos){
    this();
    position[0] = (int)currentPos[0];
    position[1] = (int)currentPos[1];
    
  }
  
  public DynamicPoint(float x, float y){
    this();
    position[0] = (int)x;
    position[1] = (int)y;
  }
  
  void updatepos(float a, float b){
    position[0] = (int) a;
    position[1] = (int) b;
  }
  
  int getpos(char a){
    if(a== 'x') return position[0];
    return position[1];
  }
}
