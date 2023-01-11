public class DynamicLine{
  DynamicPoint start;
  DynamicPoint end;
  
  public DynamicLine(DynamicPoint b, DynamicPoint f){
    start = b;
    end = f;
  }
  String data(){
    return  "(" + start.getpos('x') + ","+ start.getpos('y') + ") (" + end.getpos('x') + ","+ end.getpos('y') +")";
  }
  
  public void render(){
    line(start.getpos('x'),start.getpos('y'), end.getpos('x'), end.getpos('y'));
  }
}
