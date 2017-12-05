Particle[] particles=new Particle[100];
float maxR=10;
void setup(){
  size(600,600);
  //noStroke();
  background(255);
  for (int i=0;i<particles.length;i++){
    particles[i]=new Particle(random(width),random(height),random(maxR/2,maxR),randomColor());
  }
}
void draw(){
  //background(255);
  for (int i=0;i<particles.length;i++){
    particles[i].update();
    particles[i].show();
  }
}
color randomColor(){
  return color(int(random(255)),int(random(255)),int(random(255)));
}