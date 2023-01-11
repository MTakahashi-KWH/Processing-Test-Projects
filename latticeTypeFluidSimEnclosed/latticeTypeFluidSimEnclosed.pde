float[][] volume;
particle[] mass;
int w,h;

void setup(){
  size(1000,1000);
  volume =new float[40][40];
  mass = new particle[8000];
  w = width/volume.length;
  h=  height/volume[0].length;
  //for (int i =0; i< mass.length/4; i++){
  //  mass[i] = new particle(random(width)/10 +450, random(height));
  //  mass[i].mass = 3.0;
  //}
  for (int i =0*mass.length/4; i< 2*mass.length/12; i++){
    mass[i] = new particle(random(width)/10 +150, random(height)/10 + 150);
  }
  for (int i =2*mass.length/12; i< mass.length; i++){
    mass[i] = new particle(random(width), random(height));
  }
  noStroke();
  frameRate(30);
}

void draw(){
  background(0);
  drawVolume();
  //drawMass();
  calcPressure();
  updateParticles();
  
}

void drawVolume(){
  for(int i=0; i< volume.length; i++){
   for(int j=0; j< volume[i].length; j++){
     //stroke(sq(volume[i][j])/18);
     fill(sq(volume[i][j]+4)/5,50);
     //if(volume[i][j]*12 > 120);
     square(i*w, j*h, w*2);
   }
  }
}

void drawMass(){
  fill(0);
  //stroke(255);
  for(int i =0 ; i< mass.length; i++){
    circle(mass[i].position.x, mass[i].position.y, 10);
  }
}

void calcPressure(){
  volume =new float[width/w][height/h];
  for(int i =0; i< volume.length;i++){
    volume[i][0] = 10;
    volume[i][volume[i].length-1] = 10;
  }
  for(int i =0; i< volume[0].length;i++){
    volume[0][i] = 10;
    volume[volume.length-1][i] = 10;
  }
  for(int i =0; i< mass.length; i++){
   if((mass[i].position.x < w)||(mass[i].position.x > width-w)){
     mass[i].position.x = constrain(mass[i].position.x, w/2 , width-w/2);
     mass[i].velocity.x *= -1;
   }
   if((mass[i].position.y < h)||(mass[i].position.y > height-h)){
     mass[i].position.y = constrain(mass[i].position.y, h/2 , height-h/2);
     mass[i].velocity.y *= -1;
   }
   int x = (int)mass[i].position.x/w;
   int y = (int)mass[i].position.y/h;
   for(int j = -1; j<2; j++){
     for(int k = -1; k< 2; k++){
       int xl = (x+j+volume.length)%volume.length;
       int yl = (y+k+volume[0].length)%volume[0].length;
       PVector grad = new PVector(j,k);
       volume[xl][yl] += 1.0/(grad.mag()+1);
     }
   }
    
  }
  //volume[(int)mouseX/w][(int)mouseY/h]+=90;
}

void updateParticles(){
 for(int i =0; i< mass.length; i++){
   PVector gradient = new PVector(0.0,0.0);
   int x = (int)mass[i].position.x/w;
   int y = (int)mass[i].position.y/h;
   for(int j = -1; j<2; j++){
     for(int k = -1; k< 2; k++){
       int xl = constrain(x+ j,0,volume.length-1);
       int yl = constrain(y+ k,0,volume[0].length-1);
       PVector grad = new PVector(j,k);
       PVector dir = new PVector(j,k).mult(volume[xl][yl]).div(grad.magSq()*18+1);
       gradient.sub( dir);
     }
   }
   mass[i].update(gradient.x,gradient.y);
   //stroke(mass[i].velocity.mag()*20,gradient.x*120+120,gradient.y*120+120,10);
   //fill(mass[i].velocity.mag()*20,gradient.x*120+120,gradient.y*120+120,10);
   //fill(mass[i].velocity.mag()*32,128,255-mass[i].velocity.mag()*32,10);
   //stroke(mass[i].velocity.mag()*3,128,mass[i].weight*256,10);
   //square(x*w,y*h, w*2);
 }
}
