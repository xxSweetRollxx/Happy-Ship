
class Forest
{
  //Variables For Class
  int numberOfTrees = 35;
  Tree[] treeArray = new Tree[numberOfTrees];

  //constructor
  Forest () {
    //change here to change floor position of trees
    float yVariation = 150;
    for (int i = 0; i < numberOfTrees; i++, yVariation+=10) {
      treeArray [i] = new Tree(yVariation);
    }
  }

  //Randomly Display Trees
  void display() {

    for (int i = 0; i < numberOfTrees; i++) {
      treeArray[i].display();
    }
  }
  //illusion of side scrolling
  void move() {
    for (int i = 0; i<numberOfTrees; i++) {
      treeArray[i].x -= 3;
      if ( treeArray[i].x <= 0 -treeArray[i].leafWidth  ) {
        treeArray[i].x = width + treeArray[i].leafWidth;
      }
    }
  }
}
