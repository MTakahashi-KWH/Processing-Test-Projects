class Cell{
  public PVector position;
  public PVector tenure;
  public ArrayList<Cell> connections;
  public float radius;
  
  public Cell(PVector pos){
    position = pos;
    connections = new ArrayList<Cell>();
    tenure= pos;
    radius = 10.0;
  }
  
  void addConnection(Cell a){
    connections.add(a);
  }
  
  void averagePos(){
    PVector average = new PVector(0.0,0.0);
    float scale = 0;
    for(int i=0; i< connections.size(); i++){
      int val = connections.get(i).connections.size();
      float multiplier = val == 4 ? 1 : val == 5 ? .9 : .8 ;
      //System.out.println(multiplier);
      average.add(new PVector(connections.get(i).position.x,connections.get(i).position.y).mult(multiplier));
      scale += multiplier;
    }
    average.div(scale);
    //System.out.println(position.dist(average.div(scale)));
    if(position.dist(average) < 10){
      position = average;
    }
  }
  void radialSize(){
    float rad =0;
    for(int i =0; i < connections.size(); i++){
      rad+= connections.get(i).position.dist(position);
    }
    radius= min(rad/(connections.size()*4),5);
  }
  
  void plot(){
    switch(connections.size()){
      case 4:
        fill(127,0,0);
      break;
      case 5:
        fill(0,127,0);
      break;
      case 6:
        fill(0,0,127);
      break;
      default:
        fill(127);
    }
    square(tenure.x,tenure.y,20);
  }
  
  void cplot(){
    switch(connections.size()){
      case 4:
        fill(127,0,0);
      break;
      case 5:
        fill(0,127,0);
      break;
      case 6:
        fill(0,0,127);
      break;
      default:
        fill(127);
    }
    //circle(position.x,position.y, radius*7);
    //fill(250/radius);
    //if(radius*1.5 < tenure.dist(position)) fill(64,128.0/log(tenure.dist(position)+.1),8*tenure.dist(position),128);
    //else fill(128.0/log(tenure.dist(position)+.1),64);
    //System.out.println(tenure.dist(position)+ ":" + radius);
    circle(position.x,position.y, radius*6);
  }
}
