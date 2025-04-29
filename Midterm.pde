//Melanie Foley
//Midterm
//Fall 2022
//Alex R.Assisted everytime I called upon him
//Kudos to Alex <3

//stolen art
//https://openclipart.org/detail/271116/kawaii-rocket



//ship Variables
PImage ship1;
Ship ship;

//clouds
int numberOfClouds = 5;
Cloud [] clouds;

//TimerVariable
int timer =0;
int resetTime;

//screen variables
int screen = 1;

//PrettyTrees
Forest forest;

//SETUP
void setup() {
  size(1400, 1000);
  background(#6DA0F0);
  imageMode(CENTER);
  reset();
}

void draw() {
  //background fill
  background(#6DA0F0);
  //ground
  fill(#7DE370);
  noStroke();
  rectMode(CORNER);
  rect(0, 700, width, height);

  //weird screen shit we learned
  switch(screen) {
  case 1:
    titleScreen();
    break;
  case 2:
    playScreen();
    break;
  case 3:
    deathScreen();
    break;
  }
}
//Key press for reset
void keyPressed() {

  if (key == 'r' || key == 'R') {

    reset();
  }
}
//mouse clicky button
//click to proceed to game through title screen
void mousePressed() {
  if (screen == 1) {
    //reset timer
    resetTime = millis();
    screen = 2;
  }
}
//titlescreen
void titleScreen() { 
  //display forest and clouds
  forest.display();
  for (int i = 0; i<numberOfClouds; i++) {
    clouds[i].move();
    clouds[i].display();
  } 
  //title text
  fill(#FF4DE2);
  textAlign(CENTER, CENTER);
  textSize(200);
  //alex helped with weird math
  text("HAPPY SHIP", width/2, (1.0/4)*height);
  textSize(100);
  fill(#000000);
  text("CLICK TO BEGIN", width/2, (2.0/3)*height);
  textSize(50);
  fill(#05FA71);
  text("PS.. avoid the clouds", width/2, (2.0/4)*height);
}
//Second Screen "PlayScreen"
void playScreen() {
  //Trees
  forest.display();
  forest.move();

  //Ship
 
  //code executes when ship is not falling
  if (!ship.isFalling) {
    //update timer
    timer = (millis() - resetTime)/1000;
    ship.move();
    //executes when falling
    //switch to death screen
  } else {
    screen = 3;
  }


  //cloud speed
  //remainders lesson from alex(personal note)
  //call clouds
  for (int i = 0; i<numberOfClouds; i++) {
    if (timer%10==0) {
      clouds[i].cloudSpeed +=.01;
    }

    clouds[i].display();
    clouds[i].move();
    ship.collisionCheck(clouds[i]);
  }

  //Timer Text
  fill(#F5573B);
  textAlign(LEFT);
  textSize(100);
  text(timer, 0, 100);
}
//Screen Three Stuff
void deathScreen() {
  forest.display();
  forest.move();
  ship.death();
  for (int i = 0; i<numberOfClouds; i++) {
    clouds[i].display();
    clouds[i].move();
  }
  //get good text
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(0);
  text("GET FUCKED PRESS \"R\"", width/2, height/2);

  //Timer Text
  fill(#F5573B);
  textAlign(LEFT);
  textSize(100);
  text(timer, 0, 100);
}

//reset stuff
void reset() {
  screen = 1;

  ship = new Ship();
  forest = new Forest();
  clouds = new Cloud[numberOfClouds];
  //Cloud
  for (int i = 0; i<numberOfClouds; i++) {
    clouds[i] = new Cloud();
  }
}
