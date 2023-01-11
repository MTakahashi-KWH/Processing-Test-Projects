import java.util.ArrayList();
import java.util.Scanner;


Scanner oj;

void setup(){
  size(900,900);
  background(0);
  stroke(127);
  ArrayList<DynamicPoint> points = new ArrayList<DynamicPoint>();
  ArrayList<DynamicLine> lines = new ArrayList<DynamicLine>();
  UpdateThread alpha = new UpdateThread(lines);
  alpha.start();
  oj = new Scanner(System.in);
}

void draw(){
  //while(true){
    if(oj.hasNextLine()){
      actions(oj.NextLine());
    }  
  //}
}

void addpoint(int x, int y){
  points.add(new DynamicPoint(x,y));
}

void addline(int pointS, int pointE){
  lines.add(new DynamicLine(pointS, pointE));
}

void displaypoints(){
  for(int i=0; i< points.size(); i++){
    System.out.println(i + " : " + points.get(i).getpos('x') + "," + points.get(i).getpos('y'));
  }
}

void displaylines(){
  for(int i=0; i< points.size(); i++){
    System.out.println(lines.get(i).data());
  }
}

void actions(String input){
  String[] alpha = input.split(" ");
  if(alpha[0].equals("addpoint")){
    addpoint(integer.parseInt(alpha[1]),integer.parseInt(alpha[2]));
  }else if(alpha[0].equals("addline")){
    addline(points.get(integer.parseInt(alpha[1])),points.get(integer.parseInt(alpha[2])));
  }else if(alpha[0].equals("disP")){
    displaypoints();
  }else if(alpha[0].equals("disL")){
    displaylines();
  }
}
