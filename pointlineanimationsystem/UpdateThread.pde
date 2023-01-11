//import java.io.*;


class UpdateThread implements Runnable{
  ArrayList<DynamicLine> lines;
  UpdateThread( ArrayList<DynamicLine> Lines){
    lines = Lines;
  }
  
  @Override
  public void run(){
    while(true){
      background(0);
      for(int i =0; i< lines.size(); i++){
        lines.get(i).render();
      }
    }
  }
}
