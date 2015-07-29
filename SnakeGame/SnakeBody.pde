// LIFO-Queue implementation 
class SnakeBody{
  Node first, last;
  int size, maxSnakeLength;
  
  SnakeBody(int startLengthOfSnake){
    size = 0;
    maxSnakeLength = startLengthOfSnake;
  }
  
  private void push(int x, int y){
    Point newPoint = new Point(x,y);
    Node newNode = new Node(newPoint);  
    
    if (first==null && last==null){
      first = newNode;
      last = newNode;
      size++;
      return;
    }
    
    if(maxSnakeLength == size){
      pop();
      last.next = newNode;
      last = newNode;
    } else{
      last.next = newNode;
      last = newNode;
      size++;
    }
    
    
  }
  
  // For troubleshooting
  private void printSnakeBody(){
    Node temp = first;
    while (temp!=null){
      System.out.println(temp.coordinate);
    }
  }
  
  private void pop(){
    first = first.next;
  }
   
  public void initialize(int x, int y, int border){
    for (int i = 0; i < border; i++){
      push(x--, y);
    }
  }
  
  public Point getFront(){
    return last.coordinate;
  } 
  
  public Point[] toArray(){
    Point[] toReturn = new Point[size];  
    Node temp = first;
    
    for(int i = 0; temp!=null; i++){
      toReturn[i] = temp.coordinate;
      temp = temp.next;
    }
    return toReturn;
  }
  
  public void updateSnakeLength(int increment){
    maxSnakeLength += increment;
  }
  
  private class Node{
    Point coordinate = null; 
    Node next;
    Node(Point p){
      coordinate = p;
    }
  }
}
