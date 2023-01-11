//Masashi  Takahashi 2/11/2020
//for anyone reading this code, go check out sebastion lague's youtube video to understand the general logic of a*
//tried to improve logic of next step function and quality of determination of heuristic values

short pixelw =25;
short pixelh =25;
int[][] area = new int[900/pixelw][900/pixelh];
int[][] path = area.clone();                         //for some reason, changing the number of dimensions breaks the pathfinding algorithm
short[][][] parents = new short[900/pixelw][900/pixelh][2];  //created to not break the pathfinding algorithm
int[] startloc =  {area.length/2,area[0].length/2};
int[] location = startloc;                               // placing the path head at the starting location
int[] target = randpoint();        
int randfill = 12;
int m =0;
int c =0;


void setup(){
  size(900,900);
  path[0][0] =1;
  area[0][0] = 1;
  move();
  System.out.println("start" + area.length +"" + area[0].length);
}



void draw(){
  background(0);
  noStroke();
  printPath();
  fill(255);
  rect(startloc[0]*pixelw,startloc[1]*pixelh,pixelw,pixelh);
  if(mousePressed == true){                          // used for painting obstacles
    path[mouseX/pixelw][mouseY/pixelh] = 3;
    
  }
}

void keyTyped(){
  if(key == 'd'){
    move();
  }else if(key == 'c'){
    clearAllReset();
  }else if(key == 'n'){
    startloc = randpoint();
    location = startloc;
  }
  
}

int[] randpoint(){
  int[] alpha = new int[2];
  alpha[0] = (int)(Math.random()*(900/pixelw));
  alpha[1] = (int)(Math.random()*(900/pixelw));
  return alpha;
}

int deterdist(int[] a, int[] b){               //finds the distance between any 2 points
  int alpha = 2*(a[0]-b[0]);
  int aleph = 2*(a[1]-b[1]);
  int tome = 0;
  alpha = (int)Math.pow(alpha,2);
  aleph = (int)Math.pow(aleph,2);
  tome = alpha + aleph;
  if(tome != 0){
    tome = (int)(Math.pow(tome,0.5)*3);    
  }
  return tome;
}

void printPath(){                         
  for(int i =0; i < area.length; i++){
    for(int j =0; j < area[i].length; j++){
      int[] loc ={i,j};
      push();
      fill(area[i][j],130,130);             //deterdist(loc,startloc)
      rect(i*pixelw,j*pixelh,pixelw,pixelh);
      //System.out.println(area[i][j]);
      pop();
    }
  }
  push();
  pop();
}



void move(){  
  for(int i = 0; i <  area.length; i++){
    for(int j = 0; j < area[i].length; j++){
      if(path[i][j] >=0){
        location[0] = i;
        location[1] = j;
        fillNextStep();
      }
    }
  }
}

void fillNextStep(){                               //calculates the heurisitc distance values around the location head
  Boolean testw = (true);                          
  Boolean testh = (true);
  int[] pos =new int[2];
  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      pos[0] = location[0]+i;
      pos[1] = location[1]+j;
      testw = ((pos[0]>=0)&&((pos[0])<(area.length)));
      testh = ((pos[1]>=0)&&((pos[1])<(area[1].length)));
      
      
      if(((testw==true) && (testh==true))&&(path[pos[0]][pos[1]] == 0)){
        area[pos[0]][pos[1]] =  deterdist(location,startloc); //1 + area[location[0]][location[1]];  //+ deterdist(pos,target)
        System.out.println(area[pos[0]][pos[1]] + "+" +1);
        path[pos[0]][pos[1]] = 1;
        //parents[pos[0]][pos[1]][0] = (short)i;       //places direction of parent in storage
        //parents[pos[0]][pos[1]][1] = (short)j;
      }else if((testw==true) && (testh==true)&&(path[pos[0]][pos[1]] == 1)){                                               //looking over already scanned pixels to see if displacement can be reduced
        if((deterdist(pos,location) + deterdist(pos,target) + area[location[0]][location[1]]) < area[pos[0]][pos[1]]){      //testing to see if displacement from start can be reduced by passing through current location pixel 
          area[pos[0]][pos[1]] = 1 + area[location[0]][location[1]];  // + deterdist(pos,target)  //deterdist(pos,location)
          System.out.println(area[pos[0]][pos[1]]);
          //parents[pos[0]][pos[1]][0] = (short)i;       
          //parents[pos[0]][pos[1]][1] = (short)j;
        }
      }
    } 
  }
}







void clearAllReset(){                //method to clear path and area array so program can be run again without restart (needs to be finished)
  for(int i = 0; i < path.length; i++){
    for(int j = 0; j < path[i].length; j++){
      if(path[i][j] != 3){
        path[i][j] = 0;
      }
    }
  }
  
  for(int i = 0; i < area.length; i++){
    for(int j = 0; j < area[i].length; j++){
      area[i][j] = 0;
    }
  }
}

void randfill(){
  for(int i =0; i<path.length; i++){
    for(int j =0; j<path[1].length; j++){
      int a = (int)(Math.random()*randfill);
      int[] alpha = {i,j};
      if((a > (randfill-2))&&(path[i][j] == 0)&&(alpha.equals(startloc) == false)&&(alpha.equals(target) == false)){
        path[i][j] = 3;
      }
    }
  }
}
