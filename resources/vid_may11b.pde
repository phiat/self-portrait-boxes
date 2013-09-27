import processing.video.*;
Capture video;
int count;
//PImage buffer;

float bred;
Block blocks[];
int screenwidth = 640;
int screenheight = 480;

//   original processing sketch (self portrait)
//   Patrick Ryan - phiat

void setup(){
  size(640,480,P3D);
  background(0);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
  
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    video = new Capture(this, cameras[0]);
    video.start();
  
  count = screenwidth * screenheight;
  frameRate(30);
  //buffer = new PImage(600,600);
  blocks = new Block[count];
  color c1 = color(200,200,200);
  for (int i = 0; i < count; i++){
      blocks[i] = new Block(1.0*i%screenwidth,(1.0*i/screenwidth)-(1.0*i%screenwidth),0,c1,5,5);
    }
    println(blocks.length);
  }
}

void draw(){
  background(0);
  directionalLight(51, 102, 126, -1, 0, 0);
  if (video.available()){
    scale(1.0);
    video.read();
    //loadPixels();
    video.loadPixels();

    //translate(-width/3,height/10);
    for (int y=0;y<screenheight;y+=100){
      for (int x=screenwidth-1;x>0;x-=50){
        pushMatrix();
        color vidpixel= video.pixels[x+(y*screenwidth)];
        translate(x*5,y*5,0);
        //translate(0,0,map(bred,0,255,-5,30));
        //rect(x,y,5,5);;
        Block b =  blocks[x+(y*screenwidth)];

        b.c = vidpixel;
        pushMatrix();
           rotateY(2/(red(b.c)));
           //rotateZ(red(b.c));
           b.w = green(b.c)/10;
           b.h = brightness(b.c)/5;
           b.z = int(brightness(vidpixel)/3);
           blocks[x+(y*screenwidth)].drawBlock();
            //blocks[x].drawBlock();
                      //rotateY(-1);

        popMatrix();
        //blocks[x+(y*video.width)].drawBlock();
        popMatrix();      
        count += 1;
      } 
    }
    updatePixels();
  }
}

class Block {
  float x,y,z,w,h;
  color c;
  Block(float ix,float iy, float iz, color ic,float iw, float ih){
    x = ix;
    y = iy;
    z = iz;
    c = ic;
    w = iw;
    h = ih;
  }  
  void drawBlock(){
    pushMatrix();
    translate(x,y,z);
    //strokeWeight(0.5);
    fill(c);
    rect(0,0,w,h);
    popMatrix();
  }
  
//  void drawTri(){
//    pushMatrix();
//    translate(x,y,z);
//    fill(c);
//    triangle(0,0,w,0,w/2,h);
//    popMatrix();
//  }
//    void drawSphere(){
//    pushMatrix();
//    translate(x,y,z);
//    fill(c);
//    //sphere(0,0,w);
//    popMatrix();
//  }

}

