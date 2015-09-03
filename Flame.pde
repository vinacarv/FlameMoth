class Flame {

  float fSizeX = 8;
  float fSizeY = 8;
  color fColor = color(255, 255, 0);
  int fAlpha = 200;
  float fX = width/2;
  float fY = height/2;
  float m = 0.1;
  float mSY = 0.1;
  float mVel = 10;
  float turnS = 3;

  //constructor
  Flame(float fSizeX_, float fSizeY_) {
    fSizeX = fSizeX_;
    fSizeY = fSizeY_;
  }

  void run() {
    move();
    display();
  }

  void flicker() {
    fColor = color(random(200, 255), random(200, 255), random(0, 1));
    fAlpha = int(random(180, 255));
  }


  void display() {
    //    fill(random(200,255), random(100,255), random(100,255));
    flicker();
    fill(fColor, fAlpha);
    noStroke();
    rectMode(CENTER);
    rect(fX, fY, fSizeX, fSizeY);
    fill(fColor, fAlpha/10);
    ellipseMode(CENTER);
    rect(fX, fY, fSizeX*2, fSizeY*2);
  }

  void move() {
    fX = mouseX;
    fY = mouseY;
  } 

/*
  void moveVel() {
    if ((mouseX > mX)&(mouseY > mY)) {
      mX += sqrt(int(mouseX - mX)^2 + int(mouseY - mY)^2);
      mY += sqrt(int(mouseX - mX)^2 + int(mouseY - mY)^2);
    } else if  ((mouseX > mX)&(mouseY < mY)) {
      mX += sqrt(int(mouseX - mX)^2 + int(mY - mouseY)^2);
      mY -= sqrt(int(mouseX - mX)^2 + int(mY - mouseY)^2);
    } else if ((mouseX < mX)&(mouseY > mY)) {
      mX -= sqrt(int(mX - mouseX)^2 + int(mouseY - mY)^2);
      mY += sqrt(int(mX - mouseX)^2 + int(mouseY - mY)^2);
    } else if ((mouseX < mX)&(mouseY < mY)) {
      mX -= sqrt(int(mX - mouseX)^2 + int(mY - mouseY)^2);
      mY -= sqrt(int(mX - mouseX)^2 + int(mY - mouseY)^2);
    }
  }

  void track() {
    if (mouseX > mX) {
      mSX+=turnS;
    } else if (mouseX < mX) {
      mSX-=turnS;
    }
    if (mouseY > mY) {
      mSY+=turnS;
    } else if (mouseY < mY) {
      mSY-=turnS;
    }
  }

  void trackVel() {
    if ((mouseX > mX)&(mouseY > mY)) {
      mVel = sqrt(int(mouseX - mX)^2 + int(mouseY - mY)^2);
    } else if  ((mouseX > mX)&(mouseY < mY)) {
      mVel = sqrt(int(mouseX - mX)^2 + int(mY - mouseY)^2);
    } else if ((mouseX < mX)&(mouseY > mY)) {
      mVel = sqrt(int(mX - mouseX)^2 + int(mouseY - mY)^2);
    } else if ((mouseX < mX)&(mouseY < mY)) {
      mVel = sqrt(int(mX - mouseX)^2 + int(mY - mouseY)^2);
    }
  }*/
}

