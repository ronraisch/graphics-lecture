class Force{
  float theta,r;
  int i,j;
  PVector location;
  Force(int i,int j){
    r=1;
    theta=0;
    location= new PVector(i,j);//top left corner
  }
  void update(){
    r=noise(location.x,location.y,roff);
    //r=1;
    theta=noise(location.x/20,location.y/20,thetaoff)*2*PI;
  }
  void show(){
    pushMatrix();
    translate(location.x*wid,location.y*wid);
    rotate(theta);
    line(0,0,r*wid,0);
    popMatrix();
  }
}