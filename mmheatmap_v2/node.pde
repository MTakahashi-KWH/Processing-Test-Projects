public class node{
  private short[] pos= new short[2];
  private int distance;
  
  
  public node(int a, int b, int c){
    pos[0] = (short)a;
    pos[1] = (short)b;
    distance = c;
  }
  
  public int getdist(){
   return distance; 
  }
  
  public short xpos(){
   return pos[0]; 
  }
  
  public short ypos(){
   return pos[1]; 
  }
  
  public short[] getpos(){
   return pos; 
  }
  
  public void setdist(int a){
    distance = a;
  }
  
}
