 class particle{
   PVector position, velocity, bias;
   float weight;
   
   public particle(float x, float y){
     position = new PVector(x,y);
     velocity = new PVector(0,0);      //PVector.random2D();
     bias = new PVector(0,-.324);
     weight = 1;
   }
   
   public void update(float gradx, float grady){
     //velocity.mult(0.999);
     velocity.add(new PVector(gradx,grady).div(weight));
     //velocity.add(bias);
     velocity.limit(60);
     position.add(velocity);
   }
   
 }
