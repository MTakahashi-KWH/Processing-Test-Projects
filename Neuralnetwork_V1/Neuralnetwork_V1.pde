import java.util.ArrayList;
ArrayList<networkobj> alpha = new ArrayList<networkobj>();
networkobj aleph =new networkobj(5,5,3);
double[][][] twofall = alpha.get(0).getaxon();
double[] input = {1.0,0.5,1.0,0.5,1.0};
double[] noutput = new double[5];

void setup(){
 size(900,900); 
}

void draw(){
  //input[3] = mouseX/900;
  //input[4] = mouseY/900;
  noutput = aleph.passthroughnet(input);
  for(int i =0; i< noutput.length; i++){
    fill((int)noutput[i] *12);
    rect(10*i,0,10,10);
  }
  
}
