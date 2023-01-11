 class particle{
   PVector position, velocity, bias;
   float weight, mass;
   
   public particle(float x, float y){
     position = new PVector(x,y);
     velocity = new PVector(0,0);      //PVector.random2D();
     bias = new PVector(0,.0500);
     weight = 1;
     mass = 1;
   }
   
   public void update(float gradx, float grady){
     //velocity.mult(0.3);
     velocity.add(new PVector(gradx,grady).div(weight));
     //velocity.add(bias);
     velocity.limit(15);
     position.add(velocity);
     //weight = mass- velocity.mag()/(180*mass);
   }
   
 }
