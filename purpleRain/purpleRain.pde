int nDrops=1000;
float g=0.02;
Drop[] rain=new Drop[nDrops];
void setup(){
  for (int i=0;i<rain.length;i++){
    rain[i]=new Drop();
  }
  //size(displayWidth,displayHeight);
  size(480,320);
  //stroke(125,0,125);
  stroke(0,102,204);
}
void draw(){
  //background(204,153,255);
  for (Drop d:rain){
    d.update();
    d.show();
  }
}