int boardWidth, boardHeight; 
PFont gameFont = createFont("Georgia", 14);

Snake boardSnake;
int snakeAndFoodSize = 20;
int initialSnakeLength = 50;

Food boardFood;

float snakeSpeed;
final float FAST = 1.0/0.001;
final float DEFAULT = 1.0/0.01;
final float SLOW = 1.0/0.02;


double score = 0, highscore = 0;

CollisionHandler boardHandler;

void setup(){
  setSnakeSpeed(FAST);
  boardWidth = 800; boardHeight = 600; 
  size(boardWidth, boardHeight);
  boardSnake = new Snake(snakeAndFoodSize, initialSnakeLength);
  boardFood = new Food();
  boardHandler = new CollisionHandler(this, boardSnake,boardFood, snakeAndFoodSize);
}

void draw(){
  background(255);
  drawBorders();
  drawScore();
  drawSnake();
  drawFood();
  checkForCollisions();
  updateScore();
  updateSnakePosition();
}

private void updateScore(){
  score += 0.08;
  if (score>highscore) highscore = score;
}

private void updateSnakePosition(){
   boardSnake.updatePosition();
}

private void drawScore() {
  textFont(gameFont);
  
  // For displaying whole numbers
  int viewedScore = (int) Math.floor(score);
  int viewedHighScore = (int) Math.floor(highscore);
  
  fill(0, 102, 153);
  text("Score: "+ viewedScore, (boardWidth- (boardWidth/8.8)), (boardHeight - (boardHeight/20)) );
  fill(255,0,0);
  text("Highscore: "+ viewedHighScore, 50, (boardHeight - (boardHeight/20)) );
}

private void drawSnake(){
  strokeWeight(1);
  fill(0,255,0); // Sets snake color
  
  // Removing comment below will activate the PartySnake (warning for photosensitive epilepsy)
  // fill(random(0,255), random(0,255), random(0,255)); 
  
  // The following lines draws the Snake, one piece at the time
  Point[] coordinates = boardSnake.getCoordinates();
  for (int i = 0; i<coordinates.length; i++){
    noStroke();
    ellipse(coordinates[i].getX(), coordinates[i].getY(), boardSnake.getSize(), boardSnake.getSize());
  }
  
}

private void drawBorders(){
  color c1 = color(204, 153, 0); // orange-ish
  stroke(c1);
  strokeWeight(20);
  line(0, 0, boardWidth, 0); // top
  line(boardWidth, 0, boardWidth, boardHeight); // right
  line(0, boardHeight, boardWidth, boardHeight); // bottom 
  line(0, 0, 0, boardHeight); // left
}

private void drawFood(){
  strokeWeight(1);
  fill(255,0,0); // Food color
  ellipse(boardFood.getX(), boardFood.getY(), snakeAndFoodSize, snakeAndFoodSize);
}

private void checkForCollisions(){
  boardHandler.checkForCollisions();
}

private void setSnakeSpeed(float newSpeed){
  frameRate(newSpeed);
}

// Keyboard-listener
void keyPressed() {
  if (keyCode == UP) {
    boardSnake.giveDirection("up");
  }
  if (keyCode == DOWN) {
    boardSnake.giveDirection("down");
  }
  if (keyCode == LEFT) {
    boardSnake.giveDirection("left");
  }
  if (keyCode == RIGHT) {
    boardSnake.giveDirection("right");
  }
  if (keyCode == ENTER || keyCode == RETURN) {
    boardSnake.resetPosition();
  }
}



// **********************************Methods used by other classes (public interface)********************************** 

public void foodHit(){
  score += 500;
}

public void resetGame(){  
  boardSnake.initialize();
  score = 0;
}

