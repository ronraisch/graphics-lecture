class Atractor{
  PVector center;
  float r,q,mass;
  color col;
  Atractor(float x,float y,float r_,color col_,float q_,float mass_){
    center =new PVector(x,y);
    r=r_;
    q=q_;
    mass=mass_;
    col=col_;
  }
  PVector calcForce(Particle p){
    float d=distSq(p.pos.x,p.pos.y,center.x,center.y);
    PVector force=PVector.sub(center,p.pos);
    if (d>=rLimit){
      force.mult(k*q*p.q/d);
    }
    else {
      if (!p.arrived){
        p.col=col;
        p.arrived=true;
      }
      force.set(0,0);
    }
    return force;
  }
  void show(){
    fill(col);
    ellipse(center.x,center.y,2*r,2*r);
  }
}