class BranchNode implements Cloneable{
  public int[] position;
  public double angle;
  public int Numnext = 4;
  BranchNode[] alpha;
  Boolean end = true;
  int draft = 25;
  
  
  public BranchNode(int[] position, double angle){
    this.position = position;
    this.angle = angle;
    alpha  = new BranchNode[Numnext];
  }
  
  public BranchNode(int[] position, double angle, BranchNode[] ap){
    this.position = position;
    this.angle = angle;
    alpha  = ap;
  }
  
  public BranchNode[] gennextpoints(){
    end = false;
    double angles = (angle + (Math.PI/2))%(Math.PI*2);
    double angled = Math.PI/(Numnext+1);
    if(Math.random() > .9){
      for(int i =0; i < Numnext; i++){
        double anglef = angles + ((i+1)*angled);
        int[] beta = {position[0] + (int)(draft*Math.cos(anglef)),position[1] + (int)(draft*Math.sin(anglef))};
        if(Math.random() > 0.7) alpha[i] = new BranchNode(beta,anglef - Math.PI);
        else alpha[i] = new BranchNode(position,angle);
      }
    }else{
      int[] castor = {position[0] + (int)(draft*Math.cos((angle + (Math.PI))%(Math.PI*2))),position[1] + (int)(draft*Math.sin((angle + (Math.PI))%(Math.PI*2)))};
      for(int j =0; j < alpha.length; j++){
        alpha[j] = new BranchNode(castor,angle);
      }
    }
    return alpha;
  }
  
  public int[] rpos(){
    return position;
  }
  
  public int rpx(){
    return position[0];
  }
  
  public int rpy(){
    return position[1];
  }
  
  public int[][] branch(){
    int[][] aleph = new int[Numnext][2];
    for(int i=0; i < Numnext; i++){
      aleph[i] = alpha[i].rpos();
    }
    return aleph;
  }
  
  public void print(){
    for(int i =0; i < alpha.length; i++){
      if(alpha[i] != null){
        //System.out.println(position[0]+" "+position[1]+" "+alpha[i].rpx()+" "+alpha[i].rpy());
        line(position[0],position[1],alpha[i].rpx(),alpha[i].rpy());
        alpha[i].print();
      }
    }
  }
  
  @Override
  public BranchNode clone(){
    return new BranchNode(position,angle, alpha);
  }
}
