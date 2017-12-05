class Particle{
  PVector pos,vel,acc;
  float r,mass,q;
  boolean arrived=false;
  boolean show=true;
  float initialX,initialY;
  color col=color(150,200,150);
  Particle(float x,float y, float r_,float mass_,float q_){
    pos=new PVector(x,y);
    initialX=x;
    initialY=y;
    vel=new PVector(0,0);
    acc=new PVector(0,0);
    r=r_;mass=mass_;q=q_;
  }
  void update(){
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }
  void applyForce(PVector force){
    acc.add(force);
  }
  void show(){
    if (arrived && show){
      //fill(col);
      stroke(col);
      point(initialX,initialY);
      show=false;
    }
  }
}