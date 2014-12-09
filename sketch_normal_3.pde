PFont font;

void Normal(float a,float b){
  //line : y=ax+b
  line((height/2-b)/a,height/2,(-height/2-b)/a,-height/2);
  
  //local mouse position
  float mx=mouseX-width/2;
  float my=mouseY-height/2;
  
  //normal line
  line(mx,my,(mx+a*my-a*b)/(a*a+1),(a*mx+a*a*my-a*a*b)/(a*a+1)+b);
  
  //print range
  float dx=mx-((mx+a*my-a*b)/(a*a+1));
  float dy=my-((a*mx+a*a*my-a*a*b)/(a*a+1)+b);
  float range=sqrt(dx*dx+dy*dy);
  textAlign(LEFT);
  fill(0,0,255);
  text(range,-width/2,24);
}

void setup(){
  size(320,320);
  
  font=createFont("FFScale",24);
  textFont(font);
}

void draw(){
  background(255);
  translate(width/2,height/2);
  
  //axisX
  line(-width/2,0,width/2,0);
  //axisY
  line(0,-height/2,0,height/2);
  
  Normal(2.4,50);
}
