class Tile{
  public PVector position;
  public PVector[] points;
  public int type;
  
  
  public Tile(int a, PVector b,float s){
    position = b.mult(s*2);
    type = a;
    //System.out.println("constructor running");
    switch(type){
      case 0:
        points = new PVector[5];
        points[0] = new PVector(int(position.x),int(position.y));
        points[1] = new PVector(int(position.x-s),int(position.y-s));
        points[2] = new PVector(int(position.x+s),int(position.y-s));
        points[3] = new PVector(int(position.x+s),int(position.y+s));
        points[4] = new PVector(int(position.x-s),int(position.y+s));
      break;
      case 1:
        points = new PVector[6];
        points[0] = new PVector(int(position.x),int(position.y+s*.5));
        points[1] = new PVector(int(position.x),int(position.y-s*.5));
        points[2] = new PVector(int(position.x-s),int(position.y-s));
        points[3] = new PVector(int(position.x+s),int(position.y-s));
        points[4] = new PVector(int(position.x+s),int(position.y+s));
        points[5] = new PVector(int(position.x-s),int(position.y+s));
      break;
      case 2:
        points= new PVector[6];
        points[0] = new PVector(int(position.x+s*.5),int(position.y));
        points[1] = new PVector(int(position.x-s*.5),int(position.y));
        points[2] = new PVector(int(position.x-s),int(position.y+s));
        points[3] = new PVector(int(position.x-s),int(position.y-s));
        points[4] = new PVector(int(position.x+s),int(position.y-s));
        points[5] = new PVector(int(position.x+s),int(position.y+s));
      break;
      default:
        points = new PVector[4];
        points[0] = new PVector(int(position.x+s*0.5),int(position.y+s*.5));
        points[1] = new PVector(int(position.x+s),int(position.y-s));
        points[2] = new PVector(int(position.x+s),int(position.y+s));
        points[3] = new PVector(int(position.x-s),int(position.y+s));
      break;
    }
  }
  
  public void plot(){
    //println(type + "" + points.length);
    switch(type){
      case 1:
      case 2:
         line(points[0].x,points[0].y,points[1].x,points[1].y);
         line(points[0].x,points[0].y,points[4].x,points[4].y);
         line(points[0].x,points[0].y,points[5].x,points[5].y);
         line(points[1].x,points[1].y,points[2].x,points[2].y);
         line(points[1].x,points[1].y,points[3].x,points[3].y);
      break;
      default:
        for(int i=0; i< points.length; i++){ line(points[0].x,points[0].y,points[i].x,points[i].y);}
      break;
    }
  }
}
