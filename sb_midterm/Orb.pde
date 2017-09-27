public class Orb {
  protected float _x, _y, _rad, _speed;
  protected color _color, _red, _green, _blue, _orange, _lBlue;
  protected boolean isPointer;
  protected boolean isCollected;
  protected GameController gc;
  
  protected int value;
  
  protected SoundFile sound;
  
  PVector position;
  
  //default constructor
  Orb() {
    _x = width/4;
    _y = height/4;
    _rad = 30;
        
    _red = color(255, 0, 0);
    _green = color(0, 255, 0);
    _blue = color(0, 0, 255);
    
    _orange = color(244, 147, 36);
    _lBlue = color(43, 236, 239);
    
    _color = _green;
    
    setIsPointer(false);
  }
  
  //constructor for custom color
  Orb(float x, float y, float size, int r, int g, int b) {
    _x = x;
    _y = y;
    position = new PVector(_x, _y);
    _rad = size;
    _color = color(r, g, b);
    
    _red = color(255, 0, 0);
    _green = color(0, 255, 0);
    _blue = color(0, 0, 255);
    
    setIsCollected(false);
    setIsPointer(false);
    
    value = 1;
   
  }
  
  //constructor for custom color using color object
    Orb(float x, float y, float size, color col){
    _x = x;
    _y = y;
    position = new PVector(_x, _y);
    _rad = size;
    _color = col;
    
    _red = color(255, 0, 0);
    _green = color(0, 255, 0);
    _blue = color(0, 0, 255);
    
    setIsCollected(false);
    setIsPointer(false);
    
    value = 1;
   
  }
  
  //attach a gamecontroller to this orb
  public void attachGameController(GameController gc) {
    this.gc = gc;
  }
  
  //set the color of the orb
  public void setColor(int r, int g, int b) {
    _color = color(r, g, b);
  }
  
  //draw the orb
  public void display() {
    fill(_color);
    ellipse(_x, _y, _rad, _rad);
  }
  
  //GETTERS
  
  public float getX() {
    return _x;
  }
  
  public float getY() {
    return _y;
  }
  
  public float getRad() {
    return _rad;
  }
  
  public PVector getPosition() {
    return position;
  }
  
  public color getColor() {
    return _color;
  }
  
  public boolean getIsPointer() {
    return isPointer;
  }
  
  public boolean getIsCollected() {
    return isCollected;
  }
  
  //SETTERS
  
  public void setPosition(float x, float y, float rad) {
    _x = x;
    _y = y;
    position = new PVector(_x, _y);
    _rad = rad;
  }
  
  public void setIsPointer(boolean bPointer) {
    isPointer = bPointer;
  }
  
  public void setIsCollected(boolean bCollected) {
    isCollected = bCollected;
  }
  
  public void setSound(SoundFile sound) {
    this.sound = sound;
  }
  
  public void playSound() {
    //this.sound.play();
  }
  
  public void checkCollision(Orb otherOrb) {
    //check position (x and y) of other orb
    //if within radius, of this orb = COLLISION
    PVector oPos = otherOrb.getPosition();
    float x1, x2, y1, y2;
    color oColor;
    
    //create a box area around the orb
    //checks if the center of the ponter is inside it
    x1 = _x - (_rad/2);
    x2 = _x + (_rad/2);
    y1 = _y - (_rad/2);
    y2 = _y + (_rad/2);
    
    if (oPos.x >= x1 && oPos.x <= x2 && oPos.y >= y1 && oPos.y <= y2){
      //println("COLLISION");
      oColor = otherOrb.getColor();
      
      if(_color == oColor) {
        //println("RIGHT COLOR");
        setIsCollected(true);  //marks this orb as collected
        gc.addToOrbCount(value, this);  //adds to the game controller count
      } else {
        //println("WRONG COLOR");
      }
    }
    
  }
  
}