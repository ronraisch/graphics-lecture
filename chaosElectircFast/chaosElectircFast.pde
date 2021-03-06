float k=0.1;
Particle[] particles;
int scl=1;
float qA=10;
float rA=10;
float massA=20;
float rLimit=rA/2;
int count=0;
Atractor[] atractors=new Atractor[3];
void setup(){
  size(600,600,FX2D);
  strokeWeight(scl);
  background(255);
  particles=new Particle[width*height/(scl*scl)];
  for (int i=0;i<width/scl;i++){
    for (int j=0;j<height/scl;j++){
      particles[j+i*width/scl]=new Particle((i*scl)%width,(j*scl)%height,float(scl)/4,2,1);
    }
  }
  atractors[0]=new Atractor(width/3,height/3,rA,color(255,0,0),qA,massA);
  atractors[1]=new Atractor(2*width/3,height/3,rA,color(0,255,0),qA,massA);
  atractors[2]=new Atractor(width/2,2*height/3,rA,color(0,0,255),qA,massA);
}
void draw(){
  print(frameRate+"\t"+count+"\n");
  //background(255);
  count=0;
  for (int i=0;i<particles.length;i++){
    if (!particles[i].arrived){
      count++;
      for (int j=0;j<atractors.length;j++){
        PVector force=atractors[j].calcForce(particles[i]).copy();
        particles[i].applyForce(force);
      }
      particles[i].update();
    }
    particles[i].show();
  }
  for (int i=0;i<atractors.length;i++){
    //atractors[i].show();
  }
}
float distSq(float x1, float y1,float x2,float y2){
  return (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
}
void mousePressed(){
  save("electricChaos");
}