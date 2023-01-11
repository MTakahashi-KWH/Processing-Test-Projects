import java.util.Arrays;
import java.util.ArrayList;


Network alpha = new Network(5,1,6);
float[] input = {0.5,0.5,0.5,0.5,0.5};

void setup(){
  size(900,900);
  background(0);
  alpha.evolve();
  System.out.println(Arrays.toString(alpha.run(input)));
}

void draw(){
  
}

void keyPressed(){
  if(key == 'r'){
    alpha.evolve();
    System.out.println(Arrays.toString(alpha.run(input)));
  }
}
