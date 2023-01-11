import java.util.Arrays;

Network alpha;

void setup(){
  size(900,900);
  alpha  = new Network(4,1,2);
  alpha.instantiate();
}

void draw(){
  background(0);
  double[] input = {((double)mouseX/900.0),((double)mouseY/900.0),.9999,.00001};
  double[] aleph = alpha.run(input);
  fill((int)(aleph[0] *128));
  rect(0,0,30,30);
  fill((int)(aleph[1]*128));
  rect(0,30,30,30);
  System.out.println(Arrays.toString(aleph));
}


void printNetwork(){
  
}
