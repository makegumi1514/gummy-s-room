//nikou teiri
float binomial_thearem(int n,int k){
  int n_kai=n;
  int k_kai=k;
  int n_k_kai=n-k;
  float binomial;
  if(n==0){
    n_kai=1;
  }else{
    for(int i=n-1;i>=2;i--){
      n_kai*=i;
    }
  }
  if(k==0){
    k_kai=1;
  }else{
    for(int i=k-1;i>=2;i--){
      k_kai*=i;
    }
  }
  if((n-k)==0){
    n_k_kai=1;
  }else{
    for(int i=n-k-1;i>=2;i--){
      n_k_kai*=i;
    }
  }
  binomial=n_kai/(k_kai*n_k_kai);
  return binomial;
}

//Bernstein_basis_polynomials
float Bernstein(int n,int v,float x){
  float n_v=binomial_thearem(n,v);
  float bern;
  float x_jou=x;
  float x_1_jou=1-x;
  if(v==0){
    x_jou=1;
  }else{
    for(int i=1;i<v;i++){
      x_jou*=x;
    }
  }
  if((n-v)==0){
    x_1_jou=1;
  }else{
    for(int i=1;i<n-v;i++){
      x_1_jou*=(1-x);
    }
  }
  bern=n_v*x_jou*x_1_jou;
  return bern;
}

//4point Bezier
void Bezier(PVector c0,PVector c1,PVector c2,PVector c3,float t){
  int n=4;
  PVector[] C=new PVector[4];
  C[0]=c0;
  C[1]=c1;
  C[2]=c2;
  C[3]=c3;
  PVector p=new PVector();
  for(int i=0;i<=(n-1);i++){
      p.x+=C[i].x*Bernstein(n-1,i,t);
      p.y+=C[i].y*Bernstein(n-1,i,t);
  }
  ellipse(p.x,p.y,10,10);
}

PVector b0,b1,b2,b3;
float time;

void setup(){
  size(320,320);
  b0=new PVector(50,50);
  b1=new PVector(150,200);
  b2=new PVector(250,200);
  b3=new PVector(300,20);
  
  time=0;
  float a=Bernstein(3,0,0);
  println(a);
}

void draw(){
  background(255);
  Bezier(b0,b1,b2,b3,time);
  
  ellipse(b0.x,b0.y,20,20);
  ellipse(b1.x,b1.y,20,20);
  ellipse(b2.x,b2.y,20,20);
  ellipse(b3.x,b3.y,20,20);
  
  time+=0.01f;
  if(time>1){
    time=0;
  }
}
