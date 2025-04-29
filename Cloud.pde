
class Cloud
{

  float cloudX;
  float cloudY;
  float cloudSpread = 60;
  float cloudScale = 100;
  float cloudSpeed = 1;



  Cloud() {

    cloudX = random(width, width*2);
    cloudY = random(0, height);
  }

  void move() {
    //cloud Screen Wrap
    if (cloudX <= 0-cloudScale - cloudSpread) {
      cloudX = width + cloudScale + cloudSpread;
      cloudY = random (0, height);
    }


    //Cloud Movement based on speed (vibration)
    cloudY += random(-.5*cloudSpeed, +.5*cloudSpeed);
    cloudX += random(-5*cloudSpeed, +.5*cloudSpeed);
  }

  //display clouds
  //stolen from Joe Lesson
  void display() {
    noStroke();
    fill(255);
    ellipse(cloudX+cloudSpread, cloudY, 2*cloudScale, cloudScale );
    ellipse(cloudX-cloudSpread, cloudY, 2*cloudScale, cloudScale );
    ellipse(cloudX+.5*cloudSpread, cloudY-cloudSpread, 2*cloudScale, cloudScale);
    ellipse(cloudX-.5*cloudSpread, cloudY+cloudSpread, 2*cloudScale, cloudScale);
    stroke(0);
  }
}
