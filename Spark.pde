class Spark {

  float sSize = 3;
  float sX = width/2+5;
  float sY = height/2+5;
  float mVel = 10;
  float atten = 2;
  color sColor = color(255, 240, 0);
  float sAlpha = 200;
  int lifeSpan = 3000;
  int lifeTime = 0;
  float initialSY = 5;
  float initialSX = 5;

  //constructor
  Spark(float sX_, float sY_, float initialSX_, float initialSY_) {
    sX = sX_;
    sY = sY_;
    initialSX = initialSX_;
    initialSY = initialSY_;
  }

  void run() {
    move();
    display();
    //die();
  }

  void flicker() {
    sColor = color(random(200, 255), random(200, 255), random(0, 5));
    sAlpha = random(100, 200);
  }


  void display() {
    //    fill(random(200,255), random(100,255), random(100,255));
    flicker();
    fill(sColor, sAlpha);
    noStroke();
    rectMode(CENTER);
    rect(sX, sY, sSize, sSize); //THE SPARK
    fill(sColor, sAlpha/3); //SPARK GLOW COLOR/ALPHA
    rect(sX, sY, sSize*3, sSize*3); //THE SPARK GLOW
  }

  void move() {
    if (initialSX >= 0) {
      sX += initialSX; 
      initialSX--;
    } 
    else {
      sX += initialSX; 
      initialSX++;
    }
    sY -= initialSY;
    initialSY -= atten;
    if (initialSY <= 5) initialSY = 5;
  }
}

