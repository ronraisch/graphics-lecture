class Particle{
  PVector pos,vel,acc,lastPos;
  int h;
  Particle(float x,float y){
    pos=new PVector(x,y);
    lastPos=pos.copy();
    h=0;
    vel=new PVector(0,0);
    acc=new PVector(0,0);
  }
  void update(){
    h+=maxSpeed/2;
    lastPos=pos.copy();
    h%=360;
    Force f=forces[int(pos.x/wid)][int(pos.y/wid)];
    applyForce(polar2cart(f.r,f.theta));
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed);
    acc.mult(0);
    if (pos.x>width){
      pos.x=pos.x%width;
    }
    else if (pos.x<0){
      pos.x=width+pos.x;
    }
    if (pos.y>height){
      pos.y=pos.y%height;
    }
    else if (pos.y<0){
      pos.y=height+pos.y;
    }
  }
  void applyForce(PVector force){
    acc.add(force);
  }
  void show(){
    stroke(h,200,200,3);
    if (distSq(pos.x,pos.y,lastPos.x,lastPos.y)<maxSpeed*maxSpeed*1.2){
      line(pos.x,pos.y,lastPos.x,lastPos.y);
    }    
  }
}