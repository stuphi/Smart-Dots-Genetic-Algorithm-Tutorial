Population test;
PVector goal  = new PVector(400, 20);


void setup() {
  size(800, 800); //size of the window
  frameRate(100);//increase this to make the dots go faster
  test = new Population(1000);//create a new population with 1000 members

  background(0, 0, 255);
  fill(255);
  rect(10, 10, 780, 780);
   

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  fill(0, 0, 255);

  rect(300, 200, 800, 10);
  rect(0, 400, 500, 10);
  rect(300, 600, 800, 10);

  // store a bitmap of the arena
  loadPixels();

}


void draw() { 
  
  // Restore the arena
  updatePixels();

  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
  } else {
    //if any of the dots are still alive then update and then show them

    test.update();
    test.show();
  }
}
