PVector b0,b1,b2,b3;
float t;

void setup(){
  size(320,320);
  b0=new PVector(50,50);
  b1=new PVector(150,200);
  b2=new PVector(250,200);
  b3=new PVector(300,20);
  t=0;
}

void draw(){
  background(100);
  PVector p=new PVector();
  
  p.x=(b0.x*(1-t)*(1-t)*(1-t))+(b1.x*3*t*(1-t)*(1-t))+(b2.x*3*t*t*(1-t))+(b3.x*t*t*t);
  p.y=(b0.y*(1-t)*(1-t)*(1-t))+(b1.y*3*t*(1-t)*(1-t))+(b2.y*3*t*t*(1-t))+(b3.y*t*t*t);
  
  ellipse(p.x,p.y,10,10);
  
  t+=0.005f;
  if(t>1){
    t=0;
  }
  
  ellipse(b0.x,b0.y,20,20);
  ellipse(b1.x,b1.y,20,20);
  ellipse(b2.x,b2.y,20,20);
  ellipse(b3.x,b3.y,20,20);
}
