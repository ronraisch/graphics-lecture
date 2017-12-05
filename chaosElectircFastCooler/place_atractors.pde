PVector[] pickLocation(int n,float x,float y,float r,char c){
  if (c=='r'){
    PVector[] v=pickLocationRandomPolygon(n,x,y,r);
    return v;
  }
  else if(c=='p'){
    PVector[] v=pickLocationPolygon(n,x,y,r);
    return v;
  }
  else{
    PVector[] v=pickLocationRandom(n);
    return v;
  }
}
PVector[] pickLocationRandom(int n){
  PVector[] vertices=new PVector[n];
   for (int i=0;i<n;i++){
     vertices[i]=new PVector(random(width),random(height));
   }
   return vertices;
}
PVector[] pickLocationPolygon(int n,float x,float y,float r){
   PVector center=new PVector(x,y);
   PVector dir=new PVector(r,0);
   PVector[] vertices=new PVector[n];
   for (int i=0;i<n;i++){
     PVector currnet=PVector.add(center,dir);
     vertices[i]=currnet;
     dir.rotate(2*PI/n);
   }
   return vertices;
}

PVector[] pickLocationRandomPolygon(int n,float x,float y,float r){
   PVector center=new PVector(x,y);
   PVector dir=new PVector(r,0);
   PVector[] vertices=new PVector[n];
   for (int i=0;i<n;i++){
     PVector currnet=PVector.add(center,dir);
     vertices[i]=currnet;
     dir.rotate(2*PI/n+random(-0.1,0.1));
     dir.mult(random(0.75,1.25));
   }
   return vertices;
}
color randomColor(){
  return color(int(random(255)),int(random(255)),int(random(255)));
}