class Tile{
  public PVector position;
  public PVector[] points;
  public int type;
  public Tile[] neighbors;
  public Cell[] sections;
  public float scale;
  public ArrayList<Cell> pile;
  public int holding;
  
  
  public Tile(int a, PVector b,float s, ArrayList<Cell> global){
    position = b.mult(s*2);
    type = a;
    neighbors = new Tile[4];
    sections = new Cell[4];
    scale = s;
    pile = global;
    holding = 0;
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
  
  public void setNeighbors(Tile[] a){
    neighbors = a;
  }
  
  public void generateCells(){
    for(int i= 0; i <4 ; i++){
      if(sections[i] == null) sections[i] = neighbors[i].pass(i);
    }
  }
  
  public Cell pass(int a){
    int beta = (a+2)%4;
    if(sections[beta] == null){
      PVector offset;
      switch(beta){
        case 0:
          offset= new PVector(0,-scale);
        break;
        case 1:
          offset= new PVector(-scale,0);
        break;
        case 2:
          offset= new PVector(0,scale);
        break;
        case 3:
          offset= new PVector(-scale,0);
        break;
        default:
          offset= new PVector(0,0);
      }
      sections[beta] = new Cell(new PVector(position.x + offset.x,position.y + offset.y));//.add(offset));
      pile.add(sections[beta]);
      //System.out.println(position  + "<--" + position.add(offset));
    }
    return sections[beta];
  }
  
  public void genConnections(){
    switch(type){
      case 0:
        for(int i =0; i<4;i++){
          sections[i].addConnection(sections[(i+1)%4]);
          sections[i].addConnection(sections[(i+3)%4]);
        }
      break;
      case 1:
        sections[0].addConnection(sections[1]); sections[0].addConnection(sections[3]);
        sections[1].addConnection(sections[0]); sections[1].addConnection(sections[2]); sections[1].addConnection(sections[3]);
        sections[2].addConnection(sections[1]); sections[2].addConnection(sections[3]);
        sections[3].addConnection(sections[0]); sections[3].addConnection(sections[1]); sections[3].addConnection(sections[2]);
     break;
     case 2:
        sections[0].addConnection(sections[1]); sections[0].addConnection(sections[2]); sections[0].addConnection(sections[3]);
        sections[1].addConnection(sections[0]); sections[1].addConnection(sections[2]);
        sections[2].addConnection(sections[0]); sections[2].addConnection(sections[1]); sections[2].addConnection(sections[3]);
        sections[3].addConnection(sections[0]); sections[3].addConnection(sections[2]);
     break;
     default:
     break;
    }
  }
}
