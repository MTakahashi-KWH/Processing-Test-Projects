float[][] volume;
particle[] mass;
int w,h;
int increment;

void setup(){
  size(1000,1000);
  volume =new float[1000][1000];
  mass = new particle[3000000];
  w = width/volume.length;
  h=  height/volume[0].length;
  for (int i =0; i< mass.length/4; i++){
    mass[i] = new particle(random(width)/2 +450, random(height));
    //println(mass[i].position);
  }
  for (int i =mass.length/4; i< 2*mass.length/4; i++){
    mass[i] = new particle(random(width)/10 +150, random(height)/10 + 150);
    //println(mass[i].position);
  }
  for (int i =2*mass.length/4; i< mass.length; i++){
    mass[i] = new particle(random(width), random(height));
    //println(mass[i].position);
  }
  increment = 0;
}

void draw(){
  background(0);
  drawVolume();
  //drawMass();
  calcPressure();
  updateParticles();
  //println(increment++);
}

void drawVolume(){
  for(int i=0; i< volume.length; i++){
   for(int j=0; j< volume[i].length; j++){
     stroke((volume[i][j])*4);
     fill((volume[i][j])*4);
     square(i*w, j*h, w);
   }
  }
}

void drawMass(){
  fill(0);
  for(int i =0 ; i< mass.length; i++){
    circle(mass[i].position.x, mass[i].position.y, 10);
  }
}

void calcPressure(){
  volume =new float[width/w][height/h];
  for(int i =0; i< mass.length; i++){
   mass[i].position.x = (mass[i].position.x + width)%width;
   mass[i].position.y = (mass[i].position.y + height)%height;
   int x = (int)mass[i].position.x/w;
   int y = (int)mass[i].position.y/h;
   //System.out.println(i +":" + x + "," + y);
   for(int j = -2; j<3; j++){
     for(int k = -2; k< 3; k++){
       int xl = (x+j+volume.length)%volume.length;
       int yl = (y+k+volume[0].length)%volume[0].length;
       PVector grad = new PVector(j,k);
       volume[xl][yl] += 1.0/(grad.mag()+1);
       //println(1/(grad.mag()+1));
       //println(j + "," + k);
     }
   }
    
  }
  //volume[(int)mouseX/w][(int)mouseY/h]+=900;
}

void updateParticles(){
 for(int i =0; i< mass.length; i++){
   PVector gradient = new PVector(0.0,0.0);
   int x = (int)mass[i].position.x/w;
   int y = (int)mass[i].position.y/h;
   for(int j = -1; j<2; j++){
     for(int k = -1; k< 2; k++){
       int xl = (x+ j+volume.length)%volume.length;
       int yl = (y+ k+volume[0].length)%volume[0].length;
       PVector grad = new PVector(j,k);
       PVector dir = new PVector(j,k).mult(volume[xl][yl]).div(grad.magSq()*9+1);
       gradient.sub( dir);
       //println(dir);
     }
   }
   mass[i].update(gradient.x,gradient.y);
   stroke(mass[i].velocity.mag()*20,gradient.x*120+120,gradient.y*120+120,10);
   fill(mass[i].velocity.mag()*20,gradient.x*120+120,gradient.y*120+120,10);
   square(x*w,y*h, w);
   //println(gradient);
 }
}
