class Circle{
  float x,y,r;
  boolean touching;
  Circle(){
    x=random(0,width);
    y=random(0,height);
    r=growingRate;
    touching=false;
  }
  void grow(){
    r+=growingRate;
    if (r>growingRate*20){
      r=growingRate*20;
    }
  }
  boolean checkCircle(Circle c){
    if (dist(x,y,c.x,c.y)<(r+c.r+growingRate)){
      return true;
    }
    else{
      return false;
    }
  }
  boolean edges(){
    return ((x-r)<0 || (x+r)>width || (y+r)>height || (y-r)<0);
  }
  void show(){
    ellipse(x,y,2*r,2*r);
  }
}