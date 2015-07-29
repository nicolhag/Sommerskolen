class CollisionHandler{
  SnakeGame gameController;
  Snake boardSnake;
  Food boardFood;
  int snakeAndFoodSize;
  
  CollisionHandler(SnakeGame gameController, Snake boardSnake, Food boardFood, int snakeAndFoodSize){
    this.gameController = gameController;
    this.boardSnake = boardSnake;
    this.boardFood = boardFood;
    this.snakeAndFoodSize = snakeAndFoodSize;
  }
  
  public void checkForCollisions(){
    if ( checkSnakeOnBorder() || checkSnakeOnItself() ){
      gameController.resetGame();
      boardFood.generateRandomPosition();
    }
    
    if (checkSnakeOnFood()){
      gameController.foodHit();
      boardFood.generateRandomPosition();
      boardSnake.addSnakeLength(30);
    }
  }
  
  public boolean checkSnakeOnFood(){
    // Applying for worlds worst if-test record
    if (boardFood.getX() > (boardSnake.getFrontCoordinate().getX() - snakeAndFoodSize) && boardFood.getX() 
    < (boardSnake.getFrontCoordinate().getX() + snakeAndFoodSize) && boardFood.getY() > 
    (boardSnake.getFrontCoordinate().getY() - snakeAndFoodSize) && 
    boardFood.getY() < (boardSnake.getFrontCoordinate().getY() + snakeAndFoodSize)){
      return true;
    }
    return false;
  }
  
  public boolean checkSnakeOnBorder(){
    if (boardSnake.getFrontCoordinate().getX() <= snakeAndFoodSize){
      return true;
    } else if (boardSnake.getFrontCoordinate().getX() >= width-snakeAndFoodSize){
      return true;
    } else if (boardSnake.getFrontCoordinate().getY() <= snakeAndFoodSize){
      return true;
    } else if (boardSnake.getFrontCoordinate().getY() >= height-snakeAndFoodSize){
      return true;
    } else {
      return false;
    }
  }
  
  // Not implemented yet
  public boolean checkSnakeOnItself(){
    return false;
  }
  
}
