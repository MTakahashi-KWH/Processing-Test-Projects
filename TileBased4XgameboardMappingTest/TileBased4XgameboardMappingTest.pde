
Tile[][] board;
ArrayList<Cell> nodes;
int scale;

void setup(){
  size(900,900);
  background(0);
  board = new Tile[20][20];
  int scale= 1*height/(board.length+1);
  nodes = new ArrayList<Cell>();
  
  
  for(int i =0; i< board.length; i++){
    for(int j =0; j< board[0].length; j++){
      board[i][j] = new Tile(int(noise((float)i/3,(float)j/3)*81%3),new PVector(i+1,j+1),scale/2,nodes);
      //System.out.println(noise((float)i,(float)j)*3);
    }
  }
  for(int i =0; i< board.length; i++){
    for(int j =0; j< board[0].length; j++){
      board[i][j].setNeighbors(new Tile[]{
                                        board[i][(j+board[0].length-1)%board[0].length],
                                        board[(i+board.length-1)%board.length][j],
                                        board[i][(j+1)%board[0].length],
                                        board[(i+1)%board.length][j],
                               });
    }
  }
  for(int i =0; i< board.length; i++){
    for(int j =0; j< board[0].length; j++){
      board[i][j].generateCells();
    }
  }
  for(int i =0; i< board.length; i++){
    for(int j =0; j< board[0].length; j++){
      board[i][j].genConnections();
    }
  }
  
  for(int i=0; i< nodes.size(); i++){
    //nodes.get(i).averagePos();
    //nodes.get(i).radialSize();
  }
  System.out.println(nodes.size());
  
  //for(int i=0; i< nodes.size(); i++){
  //  nodes.get(i).averagePos();
  //  //System.out.println(nodes.get(i).position);
  //  //System.out.println(nodes.get(i).connections.size());
  //}
}

void draw(){
  background(0);
  stroke(127);
  square(0,0,scale*2);
  for(int i =0; i< board.length; i++){
    for(int j =0; j< board[0].length; j++){
      board[i][j].plot();
    }
  }
  noStroke();
  for(int i=0; i< nodes.size(); i++){
    nodes.get(i).plot();
    //nodes.get(i).cplot();
  }
  //System.out.println();
  textSize(40);
  stroke(256);
  String s= mouseX + "," + mouseY;
  text(s,40,40 );
}

void keyPressed(){
  if( key == 'n'){
    for(int i=0; i< nodes.size(); i++){
      nodes.get(i).averagePos();
      //nodes.get(i).radialSize();
    }
  for(int i=0; i< nodes.size(); i++){
    //nodes.get(i).averagePos();
    nodes.get(i).radialSize();
  }
  }
}
