float FRAME_RATE=30;
void setup(){
size(1080,720);
frameRate(FRAME_RATE);
smooth();
}
float dt=1/FRAME_RATE;
float omega=2*PI;
float total_theta=0;
float MAX_THETA=100*2*PI+0.01;

void draw(){
  total_theta+=dt*omega;
  if(total_theta>MAX_THETA)total_theta=0;

  background(#b0b0b0);
pushMatrix();
translate(540,360);
scale(10);
strokeWeight(0.2);
stroke(#0000ff);
beginShape();
int N=10000;
float rate=0.3;
for(float th=0;th<=total_theta;th+=dt*omega){
   float l=rate*th;
   vertex(l*cos(th),l*sin(th));
}
endShape();

popMatrix();
}
