class Particle{
  PVector pos,vel;
  float r;
  float minV=-1;
  float maxV=1;
  color col;
  Particle(float x,float y,float r_,color col_){
    col=col_;
    r=r_;
    pos=new PVector(x,y);
    vel=new PVector(random(minV,maxV),random(minV,maxV));
  }
  void update(){
    pos.add(vel);
    if (pos.x>width){
      pos.x%=width;
    }
    else if (pos.x<0){
      pos.x=width;
    }
    if (pos.y>height){
      pos.y%=height;
    }
    else if (pos.y<0){
      pos.y=height;
    }
    vel.set(random(minV,maxV),random(minV,maxV));
  }
  void show(){
    fill(col);
    ellipse(pos.x,pos.y,r,r);
  }
}