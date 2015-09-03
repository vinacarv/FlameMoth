int tSize = 8;
color BGColor = 40;
Moth[] moths = new Moth[30];
Moth M1 = new Moth(300, 300, color(255, 0, 0), 8, random(10, 25), random(3, 8));
Flame flameCursor = new Flame(15, 25);
int qtdM = 0;
int currentSparks = 0;
int maxSparks = 12;
int mSizeGraph= 10;

boolean sketchFullScreen() {
  return true;
}

ArrayList <Spark> sparks = new ArrayList();


////////////////////////////////////////////////////SETUP
void setup() {
  size(displayWidth, displayHeight);
  //size(400, 400);
  frameRate(30);
  background(BGColor); 
  for (int i=0; i<moths.length-1; i++) {
    //moths[i] = new Moth(random(100, 200), random(100, 200), color(255,255,255), 2random(10, 50), random(3, 8));
    moths[i] = new Moth(random(0, width), random(0, height), color(255, 255, 255), 2, random(10, 50), random(3, 8));
  }

  mouseX = width/2;     ////FLAME STARTS PROGRAM CENTERED ON SCREEN
  mouseY = height/2;
}

/////////////////////////////////////////////////////DRAW
void draw() {
  background(BGColor);
  fill (240, 220, 0);
  noStroke();
  noCursor();

  flameCursor.run();////////////////////RUN THE FLAME

  for (int i=0; i<moths.length-1; i++) {//////////////RUN MOTHS
    moths[i].run();
  }

  if (currentSparks < maxSparks) { /////////////ADD SPARKS
    addSpark();
    currentSparks++;
  }

  for (int s = sparks.size(); s != 0;) { ////////////RUN SPARKS
    sparks.get(--s).run(); //NOT FULLY UNDERSTOOD!
  }


  if (millis() % 4 == 0) { /////REMOVES SPARKS EVERY TIME MILLIS%3 HAPPENS IN A FRAME
    sparks.remove(0);
    currentSparks--;
    //currentSparks == maxSparks ////////// MAX SPARKS REMOVAL CONDITION
    //    for (int i = 0; i < sparks.size()-1; i++){
    //    sparks.remove(i);
    //    currentSparks--;
  }

  M1.run();






  //////////////////////////////////////DEBUG

  println(1 + " ---> TurnS: " + M1.turnS + " Accel: " + M1.accel + " mS ----> X:" + M1.mSX + "     Y:" + M1.mSY );
  println(1 + " ---> Size: " + M1.mSize);
  println("Current Sparks: " + currentSparks);
  println("CurrentFrame/millis: " + frameCount + " / " + millis());
  //S1.run(); //////////////EXEMPLE SPARK

 /* stroke(130); /////// MOTH SIZE GRAPHING
  noSmooth();
  //if(frameCount%3 == 0)
  line(0, 150, width, 150);
  stroke(255);
  point(mSizeGraph, 150+M1.mSize);
  point(mSizeGraph, 150+moths[1].mSize *3);
  point(mSizeGraph, 150+moths[2].mSize*3);
  point(mSizeGraph, 150+moths[3].mSize*3);
  point(mSizeGraph, 150+moths[4].mSize*3);
  stroke(200, 0, 0);
  point(mSizeGraph, 150+M1.angle);
  mSizeGraph++;
  */
}



///////////////////////////////// EXTRA FUNCTIONS

void addSpark() {
  sparks.add( new Spark(flameCursor.fX, flameCursor.fY - flameCursor.fSizeY/2, random(-8, 8), random(10, 20)) );
}

