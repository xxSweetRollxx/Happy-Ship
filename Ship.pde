class Ship
{
  //ship Variables
  PImage ship1;
  float ship1X = -300;
  float ship1Y = height/2;
  float easing = .05;
  boolean isFalling = false;
  float velocity = 0;
  float gravity = .05;
  float targetX = 0;
  float targetY = 0;

  //constructor
  Ship() {
    //ship
    ship1 = loadImage("ship1.png");
    ship1.resize(100, 150);
    imageMode(CENTER);
  }

  //passing cloud object as argument
  void collisionCheck(Cloud cloud) {
    if (ship1X>cloud.cloudX-100 && ship1X<cloud.cloudX+100 && ship1Y>cloud.cloudY-100 && ship1Y<cloud.cloudY+100) {

      isFalling = true;
    }
  }

  //moving/display  ship
  void move() { 
    //Easing/Change Ship Target
    if (mousePressed) {
      targetX = mouseX;
      targetY = mouseY;
    }
    pushMatrix();
    //easing
    float dx = targetX - ship1X;
    ship1X += dx*easing;
    float dy = targetY - ship1Y;
    ship1Y += dy*easing;
    float theta = atan2(mouseY-ship1Y, mouseX-ship1X)+HALF_PI;

    //movement/display
    translate(ship1X, ship1Y);
    rotate(theta);
    image(ship1, 0, 0);
    popMatrix();
  }

  //death called on collision
  void death() {

    //falling
    ship1Y += velocity;
    velocity += gravity;
    pushMatrix();
    translate(ship1X, ship1Y);
    rotate(PI);
    image(ship1, 0, 0);
    popMatrix();
  }
}
