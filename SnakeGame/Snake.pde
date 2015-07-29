class Snake {
  DirectionHandler direction;
  SnakeBody coordinates;
  int initialX, initialY, initialSnakeLength, snakeSize;

  Snake(int snakeSize, int initialSnakeLength) {
    initialX = width / 2; // Middle of board
    initialY = height / 2; // Middle of board
    this.snakeSize = snakeSize;
    this.initialSnakeLength = initialSnakeLength;
    direction = new DirectionHandler("left"); // let the snake start out going left
    initialize();
  }
  
  private void initialize(){
    coordinates = new SnakeBody(initialSnakeLength);
    coordinates.initialize(initialX,initialY, initialSnakeLength);
  }
  
  public void addSnakeLength(int size){
    coordinates.updateSnakeLength(size);
  }

  public void giveDirection(String wantedDirection) {
    direction.setNewDirection(wantedDirection);
  }

  public void updatePosition() {
    coordinates.push( direction.newXPosition(coordinates.getFront().getX()), direction.newYPosition(coordinates.getFront().getY()));
  }

  public void resetPosition() {
    coordinates.initialize(initialX, initialY, initialSnakeLength);
  }
  
  public Point getFrontCoordinate(){
    return coordinates.getFront();
  }

  public Point[] getCoordinates() {
    return coordinates.toArray();
  }

  public int getSize() {
    return snakeSize;
  }
}  

