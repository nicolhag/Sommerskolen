class DirectionHandler{
  String currentDirection, initialDirection;
  int increment;
  
  DirectionHandler(String initialDirection){
      currentDirection = initialDirection;
      this.initialDirection = initialDirection;
      increment = 2;
  }
  
  public void setNewDirection(String newDirection){
    if (newDirection.equals("up")){
      handleUpSignal();
    } else if (newDirection.equals("right")){
      handleRightSignal();
    } else if (newDirection.equals("down")){
      handleDownSignal();
    } else if (newDirection.equals("left")){
      handleLeftSignal();
    }
  }
  
  public void forceDirection(String newDirection){
    currentDirection = newDirection;
  }
  
  public int newXPosition(int currentX){
    if (currentDirection.equals("left")){
      return currentX -= increment;
    } else if (currentDirection.equals("right")){
      return currentX += increment;
    } else {
      return currentX;
    }
    
  }
  
  public int newYPosition(int currentY){
    if (currentDirection.equals("down")){
      return currentY += increment;
    } else if (currentDirection.equals("up")){
      return currentY -= increment;
    }  else {
      return currentY;
    }
  }
  
  void handleUpSignal(){
    if (! currentDirection.equals("down")){
      currentDirection = "up";  
    }
  }
  
  void handleRightSignal(){
    if (! currentDirection.equals("left")){
      currentDirection = "right";  
    }
  }
  
  void handleDownSignal(){
    if (! currentDirection.equals("up")){
      currentDirection = "down";  
    }
  }
  
  void handleLeftSignal(){
    if (! currentDirection.equals("right")){
      currentDirection = "left";  
    }
  }
  
}
