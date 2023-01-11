import java.util.ArrayList;

ArrayList<BranchNode> tree = new ArrayList<BranchNode>();
ArrayList<BranchNode> cgen = new ArrayList<BranchNode>();
int sizex = 900, sizey = 900;

void setup(){
  size(900,900);
  int[] firstnode = {sizex/3,sizey/2};
  int[] secnode = {2*sizex/3,sizey/2};
  tree.add(new BranchNode(firstnode,Math.PI*(1.0/2.0)));
  tree.add(new BranchNode(secnode,Math.PI*(1.0/2.0)));
  cgen.add(tree.get(0));
  cgen.add(tree.get(1));
  System.out.println("done");
  nextStep();
  nextStep();
}

void draw(){
  background(0);
  stroke(100);
  strokeWeight(3);
  tree.get(0).print();
  tree.get(1).print();
  //System.out.println("done2");
  delay(100);
}

public void nextStep(){
  ArrayList<BranchNode> pgen =  new ArrayList<BranchNode>();
  for(int i = 0; i < cgen.size(); i++){
    pgen.add(cgen.get(i).clone());
  }
  cgen.clear();
  Boolean match = false;
  for(int i = 0; i < pgen.size(); i++){
    BranchNode[] alpha = pgen.get(i).gennextpoints();
    for(int j =0; j< alpha.length; j++){
      //for(int k =0; k < cgen.size(); k++){
      //  if((alpha[j].rpx() == cgen.get(k).rpx()) && (alpha[j].rpy() == cgen.get(k).rpy())&&(Math.random() > 0.1)) match = true;
      //}
      if((match == false) && (Math.random() > 0.3)){
        cgen.add(alpha[j]);
        tree.add(alpha[j]);
      };
    }
  }
}


void keyPressed(){
  switch(key){
    case 'n':
      nextStep();
      break;
    case 'c':
      tree.clear();
      cgen.clear();
      int[] firstnode = {sizex/3,sizey/2};
      int[] secnode = {2*sizex/3,sizey/2};
      tree.add(new BranchNode(firstnode,Math.PI*(1.0/2.0)));
      tree.add(new BranchNode(secnode,Math.PI*(1.0/2.0)));
      cgen.add(tree.get(0));
      cgen.add(tree.get(1));
      System.out.println("done");
      nextStep();
      nextStep();
    default:
      break;
  }
}

//for(int i =0; i< tree.size(); i++){
//    int[][] alpha = tree.get(i).branch();
//    for(int j =0; j < alpha.length; j++){
//      line(tree.get(i).rpx(),tree.get(i).rpy(),alpha[j][0],alpha[j][1]);
//    }
//  }
