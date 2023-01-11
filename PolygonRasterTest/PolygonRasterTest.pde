PVector v1, v2, v3;
int pixelsize;
Line alpha, aleph, gamma;

void setup(){
  size(600,600);
  background(0);
  stroke(255);
  v1 = new PVector(100,100);
  v2 = new PVector(400,100);
  v3 = new PVector(300,300);
  pixelsize = 3;
  alpha = new Line(v2,v3,v1);
  aleph = new Line(v1,v2,v3);
  gamma = new Line(v3,v1,v2);
}


void draw(){
  background(0);
  stroke(255);
  float[] beta = v1.array();
  float[] beta1 = v2.array();
  float[] beta2 = v3.array();
  square(beta[0],beta[1],8);
  square(beta1[0],beta1[1],8);
  square(beta2[0],beta2[1],8);
  for(int i =0; i<(600); i++){
    for(int j=0; j < 600; j++){
      if(alpha.paramtest(i,j)&&aleph.paramtest(i,j)&&gamma.paramtest(i,j)) point(i,j);
      //if(alpha.paramtest(i,j)) point(i,j);
      //if(aleph.paramtest(i,j)) point(i,j);
      //if(gamma.paramtest(i,j)) point(i,j);
      //if(j<i) point(i,j);
    }
  }
}
