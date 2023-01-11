
Tile[][] map;

void setup(){
  size(900,900);
  int h =30;
  map = new Tile[h][h];
  int scale = height/(map.length-2);
  for(int i = 0; i< map.length; i++){
    for(int j = 0; j< map[i].length; j++){
      map[i][j] = new Tile(int(random(3)),new PVector(i,j),scale/2);
    }
  }
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(3);
  for(int i = 0; i< map.length; i++){
    for(int j = 0; j< map[i].length; j++){
      map[i][j].plot();
    }
  }
}
