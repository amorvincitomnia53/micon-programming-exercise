import processing.serial.*;

Serial port=new Serial(this, "/dev/ttyACM0", 9600);

int N=300;
int current=0;
float W=1080;
float H=720;
void settings(){
  
  size(int(W),int(H));

}
void setup(){
  
  clear();
  background(#ffffff);
frameRate(FRAME_RATE);
}
  
  void keyTyped(){
   
    if(key=='s'){
      println("Save");
      save("a.png");
    }
  }

void serialEvent(Serial p){
  
  while(port.available()>=3){
      if(port.read()=='H'){
        int big=port.read();
        int small=port.read();
        current=big*4+small;
      }
  }
}
float FRAME_RATE=30;
float dtheta=0.01*PI;

void draw(){
  background(#b0b0b0);
pushMatrix();
translate(540,360);
scale(10);
strokeWeight(0.2);
stroke(#0000ff);
noFill();
beginShape();
float rate=0.3;
for(float th=0;th<=10*2*PI;th+=dtheta){
   float l=rate*th;
   vertex(l*cos(th),l*sin(th));
}
endShape();

fill(#ffffff);
stroke(#0000ff);

beginShape();
  for(float th=0;th<=10*2*PI*current/1024;th+=dtheta){
     float l=rate*th;
     vertex(l*cos(th),l*sin(th));
  }
endShape();
 popMatrix();
}
