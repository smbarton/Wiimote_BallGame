public abstract class Level {
  
  //colors
  protected color _orange = color(244, 147, 36);  
  protected color _blue = color(43, 236, 239);
  protected color _red = color(255, 0, 0);
  
  //creates a random x and a random y position
  protected float randomPosW(){return random((_pRad), (width - _pRad));}
  protected float randomPosH(){return random((_pRad), (height - _pRad));}
  
  public int timerLength;  //timer length for the level
  public int orbGoal;  //how many orbs need to be collected to beat the level
  
  //attaches the game controller to all the orbs
  public void setOrbs(GameController gc){};
  
  //draws the level
  public void displayLevel(){};
  
}