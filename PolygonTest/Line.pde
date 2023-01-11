class Line{
  Float[] vecdata;
  public Line(PVector a, PVector b){
    vecdata = a.sub(b).array();
  }
  
}
