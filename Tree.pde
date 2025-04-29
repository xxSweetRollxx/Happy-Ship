class Tree
{
  //Variables For Class
  int leafWidth = 70;
  float x;
  float yVariation;
  color randomColor1;
  color randomColor2;
  color randomColor3;

  //Passing Varation that happens in forest / no overlap
  Tree(float tempYVariation) {
    yVariation =  tempYVariation;
    x = random(0, width);
    randomColor1 = color(random(255), random(255), random(255));
    randomColor2 = color(random(255), random(255), random(255));
    randomColor3 = color(random(255), random(255), random(255));
  }

  //Display / Draw Trees
  void display() {
    //actual trees
    noStroke();
    fill(#8B795D);
    rectMode(CENTER);
    rect(x, 600+yVariation, 80, 100);
    fill (randomColor1);
    triangle(leafWidth+x, 600+yVariation, x, 320+yVariation, x-leafWidth, 600+yVariation);
    fill(randomColor2);
    triangle(leafWidth+x, 500+yVariation, x, 310+yVariation, x-leafWidth, 500+yVariation);
    fill(randomColor3);
    triangle(leafWidth+x, 400+yVariation, x, 300+yVariation, x-leafWidth, 400+yVariation);
  }
}
