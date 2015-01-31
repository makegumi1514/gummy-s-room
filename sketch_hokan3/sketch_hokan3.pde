PVector p,q,r,b;
float t,v;
PVector[] a;
int count,oldcount,i;

float f(float t){
  return t;
}

void setup(){
  size(400,400);
  t=0;
  v=0.01f;
  a=new PVector[3];
  a[0]=new PVector(0,0);
  a[1]=new PVector(200,300);
  a[2]=new PVector(400,400);
  b=new PVector();
  count=0;
  i=1;
}

void draw(){
  background(0);
  println("count="+count);
  println("t="+t);
  
  if(count<1){
    b=PVector.add(PVector.mult(a[0],f(1-t)),PVector.mult(a[1],f(t)));
  }
  else if(count>=1){
    b=PVector.add(PVector.mult(a[1],f(1-t)),PVector.mult(a[2],f(t)));
  }
  
  ellipse(b.x,b.y,10,10);
  t+=v;
  if(t<0 || 1<=t){
    //oldcount=count;
    count+=i;
    t=0;
    if(count==0 || count==2){
      i*=-1;
      v*=-1;
    }
  }
}
