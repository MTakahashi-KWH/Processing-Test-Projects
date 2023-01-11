int sizex = 900;
int sizey = 900;
int bsx= 5;
int bsy= 5;
int ux = sizex/bsx;
int uy = sizey/bsy;
short[][] tile = new short[sizex/bsx][sizey/bsy];
float[][] area = new float[sizex/bsx][sizey/bsy];
short[] startloc = {(short)(Math.random()*ux),(short)(Math.random()*uy)};
short[] location = startloc.clone();
ArrayList<node> openpos = new ArrayList<node>();
int time = 45;
int bldgw = 10;
int bldgh = 5;
int rdw = 3;
int rdh = 3;
int hwyw= 5;
int mouseop = -1;


void setup(){
  size(900,900);
  openpos.add(new node(startloc[0],startloc[1],1));
  fillgrid();
  
}

void draw(){
  background(0);
  noStroke();
  printmap();
  fill(0,255,0);
  rect(startloc[0]*bsx,startloc[1]*bsy,bsx,bsy);
  if(mousePressed == true){                          // used for painting obstacles
    if(mouseop == -1){
     tile[mouseX/bsx][mouseY/bsy] = 1;
    }else{
     startloc[0] = (short)(mouseX/bsx);
     startloc[1] = (short)(mouseY/bsy);
     partialReset();
    }
  }
}

void keyTyped(){
  if(key == 'd'){
    calcmap();
  }else if(key == 'c'){
    clearAllReset();
  }else if(key == 'n'){
    startloc[0] = (short)(Math.random()*ux);
    startloc[1] = (short)(Math.random()*uy);
    partialReset();
  }else if(key == 't'){
    fillgrid();
  }else if(key == 'x'){
    partialReset();
  }else if(key == 'z'){
    mouseop*=-1;
  }
  
}

void printmap(){
  for(int i=0; i< area.length; i++){
    for(int j=0; j< area[i].length; j++){
      switch((int)(area[i][j]/ time)){
        case 0:
          if(tile[i][j] == 1){
            fill(255);
            rect(bsx*i,bsy*j,bsx,bsy);
          }else if (area[i][j] > 0){
            fill(150, 20,20);
            rect(bsx*i,bsy*j,bsx,bsy);
          }
          break;
        default:
          break;
      }
      if(tile[i][j] == 4){
        fill(80,80,125,128);
        rect(bsx*i,bsy*j,bsx,bsy);
      }
      if(tile[i][j] == 3){
        fill(80,125,80,128);
        rect(bsx*i,bsy*j,bsx,bsy);
      }
    } 
  }
}

void calcmap(){
  for(int i=0; i< 3; i++){
    System.out.println(openpos.size());
    for(int j =0; j< openpos.size(); j++){
      location = openpos.get(j).getpos();
      //System.out.print(openpos.get(j).getdist() + " ");
      //System.out.print(area[openpos.get(j).xpos()][openpos.get(j).ypos()] + "\n");
      fillNextStep();
    }
  }
}

void fillNextStep(){                            
  Boolean testw = (true);                          
  Boolean testh = (true);
  short[] pos =new short[2];
  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      pos[0] = (short)(location[0]+i);
      pos[1] = (short)(location[1]+j);
      testw = ((pos[0]>=0)&&((pos[0])<(area.length)));
      testh = ((pos[1]>=0)&&((pos[1])<(area[1].length)));
      
      
      if(((testw==true) && (testh==true))&&(tile[pos[0]][pos[1]] != 1)){                                              
        if( (deterdist(pos,location)*tercoe(tile[pos[0]][pos[1]]) + area[location[0]][location[1]]) < area[pos[0]][pos[1]]){      
          area[pos[0]][pos[1]] = deterdist(pos,location)*tercoe(tile[pos[0]][pos[1]]) + area[location[0]][location[1]];  // + deterdist(pos,target)  //deterdist(pos,location)
          //System.out.println(area[pos[0]][pos[1]]);
          //openpos.add(new node(pos[0],pos[1],(int)area[pos[0]][pos[1]]) );
        }else if(area[pos[0]][pos[1]] ==0){
          area[pos[0]][pos[1]] = deterdist(pos,location)*tercoe(tile[pos[0]][pos[1]]) + area[location[0]][location[1]];  //+ deterdist(pos,target)
          //System.out.println(area[pos[0]][pos[1]] + "+" +1);
          //tile[pos[0]][pos[1]] = 2;
          openpos.add(new node(pos[0],pos[1],(int)area[pos[0]][pos[1]]) );
        }
      }
    } 
  }
}

float deterdist(short[] a, short[] b){               //finds the distance between any 2 points
  int alpha = (a[0]-b[0]);
  int aleph = (a[1]-b[1]);
  float tome = 0;
  alpha = (int)Math.pow(alpha,2);
  aleph = (int)Math.pow(aleph,2);
  tome = alpha + aleph;
  if(tome != 0){
    tome = (float)(Math.pow(tome,0.5)*1);    
  }
  return tome;
}

void clearAllReset(){                //method to clear path and area array so program can be run again without restart (needs to be finished)
  for(int i = 0; i < tile.length; i++){
    for(int j = 0; j < tile[i].length; j++){
        tile[i][j] = 0;
    }
  }
  
  for(int i = 0; i < area.length; i++){
    for(int j = 0; j < area[i].length; j++){
      area[i][j] = 0;
    }
  }
  
  openpos.clear();
  openpos.add(new node(startloc[0],startloc[1],1));
}
void partialReset(){                //method to clear path and area array so program can be run again without restart (needs to be finished)
  for(int i = 0; i < area.length; i++){
    for(int j = 0; j < area[i].length; j++){
      area[i][j] = 0;
    }
  }
  
  openpos.clear();
  openpos.add(new node(startloc[0],startloc[1],1));
}

void fillgrid(){
  for(int i =0 ; i < tile.length;i++){
    for(int j =0 ; j < tile[i].length;j++){
        if((i != startloc[0])||(j!=startloc[1])){
          if(((i%(bldgw+rdw)>=rdw)&&(j%(bldgh+rdh)>=rdh))){
             tile[i][j] = 1;
          }else if(((Math.random()*10) <2)&&((i%(bldgw+rdw)>=rdw)||(j%(bldgh+rdh)>=rdh))){
            //tile[i][j] =  1;
          }
          if((i%((bldgw+rdw)*4)<hwyw)||(j%((bldgh+rdh)*4)<hwyw)){
            tile[i][j] =  3;
          }
          if((i%((bldgw+rdw)*8)<hwyw)){
            tile[i][j] =  4;
          }
        }
    } 
  }
}
void fillrand(){
  for(int i =0 ; i < tile.length;i++){
    for(int j =0 ; j < tile[i].length;j++){
        if((i != startloc[0])||(j!=startloc[1])){
          if(((Math.random()*9) < (9))){
            tile[i][j] =  (short)(Math.random()*5);
          }
          if(((Math.random()*7) < (8 - j%6 - i%6))){
            tile[i][j] = 1;
          }
        }
    } 
  }
}

float tercoe(int a){
  switch(a){
    case 2:
      return 1;
    case 3: 
      return .5;
    case 4:
      return .25;
    default:
      return 1;
    
  }
}
