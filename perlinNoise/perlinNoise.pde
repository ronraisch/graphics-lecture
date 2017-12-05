int numOfParticles=10000;
float maxSpeed=5;
Particle[] particles=new Particle[numOfParticles];
Force[][] forces;
int wid=10;
Force f;
float roff=0;
float particleRadius=1;
float thetaoff=0;
float rChange=0.01;
float thetaChange=0.02;
void setup(){
  //size(600,600,FX2D);
  //size(displayWidth,displayHeight,FX2D);
  fullScreen(FX2D);
  background(255);
  colorMode(HSB);
  strokeWeight(particleRadius);
  
  forces=new Force[width/wid+1][height/wid+1];
  for (int i=0;i<width/wid+1;i++){
    for (int j=0;j<height/wid+1;j++){
      Force f=new Force(i,j);
      forces[i][j]=f;
    }
  }
  for (int i=0;i<numOfParticles;i++){
    Particle p=new Particle(random(width),random(height));
    particles[i]=p;
  }
}
void draw(){
  print(frameRate+"\n");
  //background(255);
  strokeWeight(1);
  stroke(0);
  for (int i=0;i<width/wid+1;i++){
    for (int j=0;j<height/wid+1;j++){
      forces[i][j].update();
      //forces[i][j].show();
    }
  }
  strokeWeight(particleRadius);
  for (Particle p:particles){
    p.update();
    p.show();
  }
  roff+=rChange;
  thetaoff+=thetaChange;
}
PVector polar2cart(float r,float theta){
  PVector cart=new PVector(r*cos(theta),r*sin(theta));
  return cart;
}
float distSq(float x1,float y1,float x2,float y2){
  return (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
}