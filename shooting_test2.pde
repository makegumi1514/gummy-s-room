MyShip ship;
Boss boss;
PFont font;
boolean gameover;

class MyShip {
  int hp;
  float mx,my;
  MyShip(){
    hp=255;
    mx=mouseX; my=mouseY;
  }
  void hit(){
    hp-=32;
    if(hp<0){
      gameover=true;
    }
  }
  void update(float x,float y){
    mx=x; my=y;
    stroke(255,255,0);
    fill(hp,hp,0);
    triangle(mx,my-7,mx-10,my+7,mx+10,my+7);
    if(mousePressed){
      line(mx,my-7,mx,0);
      if(abs(mx-boss.bx)<(boss.bw/2)){
        boss.hit();
      }
    }
  }
}

class Shot {
  float sx,sy,sr;
  float dx,dy;
  Shot(float x,float y,float r,float vx,float vy){
    sx=x; sy=y; sr=r;
    dx=vx; dy=vy;
  }
  boolean update(){
    sx+=dx;
    sy+=dy;
    stroke(255,0,0);
    noFill();
    //fill(255,0,0);
    ellipse(sx,sy,2*sr,2*sr);
    //hit frag
    if(pow(sx-ship.mx,2)+pow(sy-ship.my,2)<sr*sr){
      ship.hit();
      return false;
    }
    //out screen frag
    if(sx<0||sx>width||sy<0||sy>height){
      return false;
    }
    return true;
  }
}

//class Shot_360 extends Shot {
//    float sx,sy,sr,rad;
//    ArrayList shots_360;
//    Shot_360(float x,float y,float r){
//      sx=x; sy=y; sr=r;
//      shots_360=new ArrayList();
//    }
//    for(int i=0; i<=360; i+=10){
//      rad=radians(i);
//      shots_360.add(new shot(x,y,r,cos(rad),sin(rad)));
//    }
//}

class Boss {
  int hp;
  float bx,by,bcx,bw;
  ArrayList shots;
  Boss(float x,float y,float w){
    hp=255;
    bx=bcx=x; by=y; bw=w;
    shots=new ArrayList();
  }
  void hit(){
    hp--;
    if(hp<0){
      gameover=true;
    }
  }
  //function of normalize
  PVector NormalizeV(float vx,float vy){
    PVector v=new PVector(vx,vy);
    v.normalize();
    return v;
  }
  void shot_360(float x,float y,float r){
    for(int i=0; i<360; i+=10){
      float rad=radians(i);
      shots.add(new Shot(x,y,r,cos(rad)*3,sin(rad)*3));
    }
  }
  void shot_aim(float x,float y,float r,float s){
    PVector v=NormalizeV(ship.mx-x,ship.my-y);
    shots.add(new Shot(x,y,r,v.x*s,v.y*s));
  }
    
  void update(){
    float vx;
    vx=50.0*sin(radians(frameCount*4));
    bx=bcx+vx;
    stroke(0,255,0);
    fill(0,hp,0);
    rect(bx,by,bw,20);
    if(frameCount%15==0){
      shot_360(bx,by,7);
    }
    if(hp<120){
      if(frameCount%30==0){
        shot_aim(bx,by,20,8);
      }
    }
    for(int i=shots.size()-1; i>=0; i--){
      Shot s=(Shot)shots.get(i);
      if(s.update()==false){
        shots.remove(i);
      }
    }
  }
}

void print_time(){
  float ft=(float)millis()/1000;
  textAlign(RIGHT);
  text(nf(ft,1,2),width,24);
}

void setup(){
  size(320,320);
  frameRate(30);
  noCursor();
  rectMode(CENTER);  //a rect draws from CENTER
  font=createFont("FFScale",24);
  textFont(font);
  ship=new MyShip();
  boss=new Boss(width/2,30,50);
  gameover=false;
}

void draw(){
//  ship.update(mouseX,mouseY);
//  boss.update();
  
  if(gameover){
    textAlign(CENTER);
    if(ship.hp<=0){
      fill(0,0,255);
      text("YOU LOSE",width/2,height/2);
    } else {
      fill(255*sin(frameCount),255,255*cos(frameCount));
      text("YOU WIN!",width/2,height/2);
    }
  } else {
    background(0);
    ship.update(mouseX,mouseY);
    boss.update();
    fill(255,255,255);
    print_time();
  }
}
