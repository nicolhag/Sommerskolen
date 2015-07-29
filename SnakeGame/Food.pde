class Food{
  int x, y;
  
  Food(){
    generateRandomPosition();
  }
  
  public void generateRandomPosition(){
    x = ((int) random(0, width));
    
    // Prevents food from appearing on the borders
    if (x > width-40) x -= 20; 
    if (x < 40) x += 40;
    
    y = (int) random(0, height);
    
     // Prevents food from appearing on the borders
    if (y > height-40) x -= 20; 
    if (y < 40) y += 40;
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  
}
