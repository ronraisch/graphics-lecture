class Segment{
  PVector start,end,startVel,endVel,parent,totalForce;
  float len,angle,aVel,aAcc;
  Segment(float len_,PVector parent_){
    len=len_;
    angle=PI/2;
    aAcc=g*sin(angle);
    aVel=0;
    parent=parent_;
    start=new PVector(parent.x,parent.y);
    end= new PVector();
    calcEnd();
    totalForce=new PVector();
    startVel=new PVector();
    endVel = new PVector();
  }
  void setStart(float x, float y){
    start=new PVector(x,y);
  }
  void calcEnd(){
    float dx=len*sin(angle);
    float dy=len*cos(angle);
    end.set(start.x+dx,start.y+dy);
  }
  void calcAngle(){
    PVector diff=PVector.sub(end,start);
    angle+=aVel;
    aVel+=aAcc;
    aVel*=0.999;
    aAcc=-g*sin(angle);
    //print(end+"\n");
  }
  void applyForce(PVector force){
    endVel.add(force);
    //print(endVel+"\n");
  }
  void calcForce(){
    totalForce.set(-g*sin(angle),g-g*cos(angle));
    //totalForce.y*=-1;
    //print(totalForce+"\n");
  }
  void update(){
    //print(aVel+"\n");
    calcForce();
    applyForce(totalForce);
    
    
    end.add(endVel);
    calcEnd();
    calcAngle();
    
  }
  void show(){
    line(start.x,start.y,end.x,end.y);
  }
}