float FRAME_RATE=30;
boolean[] keystates;

void setup(){
size(1080,720);
frameRate(FRAME_RATE);
smooth();

keystates=new boolean[10];
}
float dtheta=0.01*PI;

void keyPressed(){
  if(keyCode>=48&&keyCode<=57)keystates[keyCode-48]=true;
}
void keyReleased(){
  if(keyCode>=48&&keyCode<=57)keystates[keyCode-48]=false;
}
void draw(){
  background(#b0b0b0);
pushMatrix();
translate(540,360);
scale(10);
strokeWeight(0.2);
stroke(#0000ff);

fill(#ffffff);
beginShape();
float rate=0.3;
for(float th=0;th<=10*2*PI;th+=dtheta){
   float l=rate*th;
   vertex(l*cos(th),l*sin(th));
}
endShape();

fill(#b0b0b0);
noStroke();
for(int i=0;i<=9;i++){
  if(keystates[i]){
beginShape();
  if(i!=0){
  for(float th=(i-1)*2*PI;th<=i*2*PI;th+=dtheta){
     float l=rate*th;
     vertex(l*cos(th),l*sin(th));
  }
  }
  for(float th=(i+1)*2*PI;th>=i*2*PI;th-=dtheta){
     float l=rate*th;
     vertex(l*cos(th),l*sin(th));
  }
endShape();
  }
}

popMatrix();
}
