Segment[] pendulum=new Segment[6];
ArrayList<PVector> vertices;
PVector base;
float g=0.001;
float len=20;
void setup(){
  size(400,400);
  background(255);
  stroke(0);
  noFill();
  vertices=new ArrayList<PVector>();
  base=new PVector(width/2,height/2-100);
  pendulum[0]=new Segment(len,base);
  for (int i=1;i<pendulum.length;i++){
    pendulum[i]=new Segment(len,pendulum[i-1].end);
  }
}
void draw(){
  background(255);
  pendulum[0].setStart(base.x,base.y);
  pendulum[0].update();
  pendulum[0].show();
  for (int i=1;i<pendulum.length;i++){
    pendulum[i].setStart(pendulum[i-1].end.x,pendulum[i-1].end.y);
    pendulum[i].aVel+=pendulum[i-1].aVel;
    pendulum[i].update();
    pendulum[i].aVel-=pendulum[i-1].aVel;
    pendulum[i].show();
  }
  vertices.add(pendulum[pendulum.length-1].end.copy());
  beginShape();
  for (PVector v:vertices){
    vertex(v.x,v.y);
  }
  endShape();
}