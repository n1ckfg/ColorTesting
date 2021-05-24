int sW = 512;
int sH = 512;

PImage img1, img2, img3;
PGraphics gfx;

void setup() {
  size(50, 50, P2D);
  surface.setSize(sW, sH);
  
  img1 = loadImage("test1.jpg");
  img2 = loadImage("test2.jpg");
  gfx = createGraphics(sW, sH);
  
  gfx.beginDraw();
  gfx.image(img1, 0, 0, gfx.width, gfx.height);
  gfx.endDraw();
  img1 = gfx.get();
  img1.loadPixels();
  
  gfx.beginDraw();
  gfx.image(img2, 0, 0, gfx.width, gfx.height);
  gfx.endDraw();
  img2 = gfx.get();
  img2.loadPixels();
  
  img3 = createImage(sW, sH, RGB);
  img3.loadPixels();
  for (int i=0; i<img3.pixels.length; i++) {
    color col1 = img1.pixels[i];
    color col2 = img2.pixels[i];
    img3.pixels[i] = lerpColor(col1, col2, 0.5);
  }
  img3.updatePixels();
}

void draw() {
  image(img3, 0, 0);
}
