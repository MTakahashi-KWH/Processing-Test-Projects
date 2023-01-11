class Line{
  float[] vecdata;
  Boolean direction;
  float[] point;
  float m;
  
  public Line(PVector a, PVector b, PVector c){
    vecdata = a.sub(b).array();
    point = a.array();
    m = vecdata[0]/vecdata[1];
    System.out.println("slope is " + m);
    paramfit(c);
  }
  
  void paramfit(PVector a){
    float[] param = a.array();
    direction = functiontest(param[1],param[0]);
    System.out.println("point c is above the line" + direction);
    System.out.println("function is " + m + "*(x-" + point[0] + ") + " + -point[1]);
  }
  
  Boolean functiontest(float h, float x){
    float y = m*(x-point[0]) - point[1];
    //System.out.println("point is above the line" + (y>h));
    return (y<h);
  }
  
  Boolean paramtest(float h, float x){
    return direction == functiontest(h, x);
  }
}
