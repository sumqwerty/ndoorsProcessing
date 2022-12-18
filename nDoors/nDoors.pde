
import processing.sound.*;
SoundFile file;

int num=5;
int[][] arr;
int sz;
int look = 0;
int up = 50;
int in = 0;
int steps = 3;
int zoom = 0;
PImage img;
boolean showPtr = false;

int zoomCntr = 0;


Aniloop gun;

void setup(){
  //size(1500,800); //(650,-650),(450,-350:-650)
  size(1000,1000);
  file = new SoundFile(this, "gunSound.mp3");
  gun = new Aniloop(file);
  rest(num);
  
  textSize(35);
  
  
}

void original(int n){
  //noStroke();
  for(int i=0; i<n; ++i){
    for(int j=0; j<n; ++j){
      
      //if(i < in)fill(255);
      //else if((i==in && j<in))fill(0);
      
      //else if((arr[j][i] == 1 || i<j))fill(255); // fill(255)
      //else fill(0);
      if(arr[j][i] == 1)fill(255); // fill(255)
      else fill(0);
      
      //translate((width/2),(height/2));
      
      rect((i)*sz,(j)*sz,sz,sz);
      //rect(-(i)*sz,(j)*sz,sz,sz);
      //rect((i)*sz,-(j)*sz,sz,sz);
      //rect(-(i)*sz,-(j)*sz,sz,sz);
      
      //translate((-width/2),(-height/2));
    }
  }
}

void rest(int n){
  arr = new int[n][n];
  sz = width/n;
  
  //int cnt = 1;
  
  for(int i=0; i<n-in; ++i){
    for(int j=0; j<n-in; ++j){
      //arr[i][j] = cnt;
      //++cnt;
      if(i == 0)arr[i][j] = 1;
      else{
        if((j+1)%(i+1) == 0){
          if(arr[i-1][j] == 1)arr[i][j] = 0;
          else arr[i][j] = 1;
        }
        else arr[i][j] = arr[i-1][j];
      }
    }
  }
}



void disp(int n){
  noStroke();  
  
  int lookm=0;
  int upm=height/4;
  if(!showPtr){
    if(mouseX>0 && mouseX<width && mouseY>0 && mouseY<height){
      lookm = (int)map(mouseX,0,width,-650,650);
      upm = (int)map(mouseY,0,height,-450,450);
    }
  }
  
  for(int i=0; i<n; ++i){
    for(int j=0; j<n; ++j){
      
      if(i < in)fill(0);
      else if((i==in && j<in))fill(0);
      
      else if((arr[j][i] == 1 || i<j))fill(117, 77, 40); // fill(255)
      else fill(40, 32, 12);
      
      
      
      translate((width/2)+lookm,(height/2)-upm);
      
      //floor
      if(i<j && j > in)fill(57, 57, 57);
      rect((i)*sz,(j)*sz,sz,sz);
      rect(-(i)*sz,(j)*sz,sz,sz);
      
      //roof
      if(i<j && j > in){
        fill(113, 113, 113);
      }
      rect((i)*sz,-(j)*sz,sz,sz);
      rect(-(i)*sz,-(j)*sz,sz,sz);
      
      translate((-width/2)-lookm,(-height/2)+upm);
    }
  }
}
void keyPressed(){
  if(key == ' ')gun.play();
  if(key == 'm')showPtr=!showPtr;
  
  
}

int fac = 1;
void draw(){
  fill(0);
  
  
  if(keyPressed){
    if(key == 's'){
      num += steps;
      zoomCntr--;
      if(zoomCntr % 5 == 0)in -= 1;
      if(in<5)in=5;
      
      if(num>200)num=200;
      rest(num);
    }
    if(key == 'w'){
      num -= steps;
      zoomCntr++;
      if(zoomCntr % 5 == 0)in += 1;
      if(in > 50)in=50;
      if(num < 2)num=2;
      rest(num);
    }
  }
  
  if(showPtr) cursor(POINT);
  else noCursor();
  original(num);
  
  //disp(num);
  //gun.disp(width/2, height-gun.getFirstFrame().height*0.9);
  
  //fill(255, 255, 0);
  //text((int)frameRate, 5, 35);
  
}
