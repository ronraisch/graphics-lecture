class Drop{
  float x,y,len,yspeed,z;
  Drop(){
    len=random(4,8);
    yspeed=random(2.5,4.5);
    x=random(0,width);
    y=random(-height,height);
    z=random(0,1);
  }
  void update(){
    y+=yspeed*z;
    yspeed+=g;
    if (y>height){
      y=random(-height,0);
      yspeed=random(1.5,3);
    }
  }
  
  void show(){
    strokeWeight(z);
    line(x,y,x,y+len);
  }
}
