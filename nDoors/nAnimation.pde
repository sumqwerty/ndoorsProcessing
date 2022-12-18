

class Aniloop{
  
  PImage imgs[]; 
  boolean animate = false;
  int onFrame = 0;
  int cntr = 0;
  int totalImages = 3;
  SoundFile file;
  
  Aniloop(SoundFile f){
    imgs = new PImage[4];
    imgs[0] = loadImage("g21.png");
    imgs[1] = loadImage("g22.png");
    imgs[2] = loadImage("g23.png");
    imgs[3] = loadImage("g21.png");
    file = f;
  }
  
  PImage getFirstFrame(){
    return imgs[0];
  }
  void disp(float xpos, float ypos){
    cntr++;
    if(cntr>20)cntr=0;
    if(animate){
      if(onFrame > 3){
        animate=false;
        onFrame=0;
        
      }
      if(cntr%totalImages*2==0)
      ++onFrame;
    }
    image(imgs[0],xpos,ypos);
    if(onFrame < imgs.length)image(imgs[onFrame],xpos,ypos);
  }
  void play(){
    animate = true;
    file.play();
  }
};
