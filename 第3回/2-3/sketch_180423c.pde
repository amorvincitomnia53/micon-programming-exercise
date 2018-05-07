import processing.serial.*;

Serial port=new Serial(this, "/dev/ttyACM0", 9600);

int N=300;
int[] history=new int[N];
int current=0;
float W=1080;
float H=720;
void settings(){
  
  size(int(W),int(H));
}
void setup(){
  
  clear();
  background(#ffffff);
}
  

void serialEvent(Serial p){
  
  while(port.available()>=3){
      if(port.read()=='H'){
        int big=port.read();
        int small=port.read();
        int val=big*4+small;
        history[current++]=val;
        println(val);
        if(current>=N){
          current=0;
        }
      }
  }
}
void draw(){ 
    background(#ffffff);
  pushMatrix();
  translate(0,H);
  scale(W/N, -H/1024.0);
  for(int i=0;i<N;i++){
    line(float(i), history[i], float(i+1), history[(i+1)%N]);  
  }
  popMatrix();
  saveFrame("movie######.png");
}
