ArrayList<Circle> circles;
float growingRate=0.2;
int circlesPerFrame=50;
int total=0;
int safe=0;
String s="";
float size=130;
PImage img;
boolean drawing=false;
int changeSize=0;
int enterN=0;
void setup(){
  circles=new ArrayList<Circle>();
  size(900,600);
  img=createImage(width,height,RGB);
  //fullScreen();
  textAlign(CENTER);
  textSize(size);
  fill(255);
  stroke(255);
  strokeWeight(1);
}
void draw(){
  if (drawing){
    total=0;
    safe=0;
    background(0);
    while (total<circlesPerFrame && safe<1000){
      safe++;
      Circle newCircle=new Circle();
      for (Circle c:circles){
        if (c.checkCircle(newCircle)){
          newCircle.touching=true;
          break;
        }
      }
      color col=img.pixels[int(newCircle.x)+int(newCircle.y)*width];
      float bright=red(col)+green(col)+blue(col);
      if (!newCircle.touching && bright>500){
        circles.add(newCircle);
        total++;
      }
    }
    for (Circle c1:circles){
      if (c1.edges()){
        c1.touching=true;
      }
      for (Circle c2:circles){
        if (c2.x!=c1.x && c2.x!=c1.x){
          if (c2.checkCircle(c1)){
            c1.touching=true;
            c2.touching=true;
          }
        }
      }
    }
    //text("framerate:"+frameRate,20,height-20);
    for (Circle c:circles){
      if (!c.touching){
        c.grow();
      }
      c.show();
    }
  }
  else{
    background(0);
    size+=changeSize;
    textSize(size);
    text(s,width/2,height/2-enterN*size);
  }
}
void keyPressed(){
  if (keyCode==BACKSPACE && s.length()>0){
    s=s.substring(0,s.length()-1);
  }
  else if (keyCode==UP){
    changeSize=1;
  }
  else if (keyCode==DOWN){
    changeSize=-1;
  }
  else if (keyCode==TAB){
    if (!drawing){
      img.loadPixels();
      loadPixels();
      img.pixels=pixels;
      img.updatePixels();
      growingRate=size/400;
      enterN=0;
      noFill();
    }
    if (drawing){
      s="";
      circles=new ArrayList<Circle>();
    }
    drawing=!drawing;
  }
  else if (keyCode!=BACKSPACE && keyCode!=SHIFT){
    s+=key;
  }
  if (keyCode==ENTER){
    if (height/2-(enterN+1.5)*size>0){
      enterN++;
    }
  }
}
void keyReleased(){
  changeSize=0;
}