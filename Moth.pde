class Moth {

  float mSize = 2;
  float mX = width/2;
  float mY = height/2;
  float mSX = 0.1;
  float mSY = 0.1;
  float mVel = 10;
  float turnS = 0.3;
  color mColor = color(255, 255, 255);
  int mAlpha = 255;
  float distX = 0;
  float distY = 0;
  float distXY = 0;
  boolean right = true;
  boolean dive = true;
  float accel = 3;
  float maxAccel = 5;
  float minS = 5;
  float terminalS = 25;
  float angle = 0;



  //constructor
  Moth(float mX_, float mY_, color mColor_, float mSize_, float terminalS_, float maxAccel_) {
    mX = mX_;
    mY = mY_;
    mColor = mColor_;
    mSize = mSize_;
    maxAccel = maxAccel_;
    terminalS = terminalS_;
  }

  void run() {
    track();
    move();
    moveZ();
    display();
  }

  void display() {
    //fill(random(200, 255), random(100, 255), random(100, 255)); //////COLORFUL MOTHS
    fill(mColor, mAlpha); ///WHITE MOTHS
    noStroke();
    ellipse(mX, mY, mSize, mSize);
  }

  void move() {
    mX += mSX;
    mY += mSY;
  } 

  void moveVel() {  ////////////////////////MOVE WITH HIPOTENUSE
    if ((mouseX > mX)&(mouseY > mY)) {
      mX += sqrt(int(mouseX - mX)^2 + int(mouseY - mY)^2);
      mY += sqrt(int(mouseX - mX)^2 + int(mouseY - mY)^2);
    } 
    else if  ((mouseX > mX)&(mouseY < mY)) {
      mX += random(1, sqrt(int(mouseX - mX)^2 + int(mY - mouseY)^2));
      mY -= random(1, sqrt(int(mouseX - mX)^2 + int(mY - mouseY)^2));
    } 
    else if ((mouseX < mX)&(mouseY > mY)) {
      mX -= sqrt(int(mX - mouseX)^2 + int(mouseY - mY)^2);
      mY += sqrt(int(mX - mouseX)^2 + int(mouseY - mY)^2);
    } 
    else if ((mouseX < mX)&(mouseY < mY)) {
      mX -= sqrt(int(mX - mouseX)^2 + int(mY - mouseY)^2);
      mY -= sqrt(int(mX - mouseX)^2 + int(mY - mouseY)^2);
    }
  }

  void moveZ() {     
    mSize = 2 + sin(radians(angle)) * 5;
    angle += random(5);   
    if (angle > 180) angle = 0;
    mColor = color(mSize*36+50, mSize*36+50, mSize*36+50) ;
  }

  void maneuver() { ////////////////////CHANGES DIRECTION FOR MOVE (STANDALONE VERSION)
    if (millis() % 2 == 0) { //////////////////CHANGES HAPPEN WHEN MILLIS%2 HIT A FRAME (TRUE RANDOM)
      if (distX < 0) {
        accel = random(accel, maxAccel); //NEW ACCEL EVERY TIME MOTH CHANGES DIRECTION 
        mSX -= accel;  
        if (abs(mSX) > terminalS) mSX = random(-terminalS, -minS); //LIMITS TERMINAL SPEED
        right = false;
      } 
      if (distX > 0) {
        mSX += accel; 
        if (abs(mSX) > terminalS) mSX = random(minS, terminalS);
        right = true;
      }
      if (distY < 0) {
        mSY -= accel;
        if (abs(mSY) > terminalS) mSY = random(-terminalS, -minS);
        dive = false;
      } 
      if (distY > 0) {
        mSY += accel; 
        if (abs(mSY) > terminalS) mSY = random(minS, terminalS);
        dive = true;
      }
    }
  }


  ////////////////////////FLAME TRACKING
  void track() {
    distX = flameCursor.fX - mX;
    distY = flameCursor.fY - mY;
    //    if (accel < 5 || accel > 5) accel = 0;
    distXY = sqrt(int(distX)^2 + int(distY)^2);
    maneuver(); //CHANGES DIRECTION FOR MOVE()
  }
  /*  if (distXY < 50) { /////////////////////DELAY + MANEUVER (DIDN'T LOOK NATURAL ENOUGH)
   maneuver();
   } else if (distXY > 50) {
   if (millis() % 1.5 == 0) {
   maneuver();
   }
   } else if (distXY > 50 && distXY < 150) {
   if (millis() % 2.5 == 0) {
   maneuver();
   }
   } else if (distXY > 50 && distXY < 150) {
   if (millis() % 4 == 0) {
   maneuver();
   }
   } else {
   maneuver();
   }*/


  void trackVel() {     ////////////////////TRACKING WITH HIPOTENUSE
    if ((mouseX > mX)&(mouseY > mY)) {
      mVel = sqrt(int(mouseX - mX)^2 + int(mouseY - mY)^2);
    } 
    else if  ((mouseX > mX)&(mouseY < mY)) {
      mVel = sqrt(int(mouseX - mX)^2 + int(mY - mouseY)^2);
    } 
    else if ((mouseX < mX)&(mouseY > mY)) {
      mVel = sqrt(int(mX - mouseX)^2 + int(mouseY - mY)^2);
    } 
    else if ((mouseX < mX)&(mouseY < mY)) {
      mVel = sqrt(int(mX - mouseX)^2 + int(mY - mouseY)^2);
    }
  }
}

