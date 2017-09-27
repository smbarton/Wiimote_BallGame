public class GameController {
  
  //Game controller loads levels and keeps track
  //of Orb count for current level
  
  protected Level currentLevel;
  protected boolean winLevel, loseLevel, isTimePaused;
  protected int currentOrbCount, currentOrbGoal;
  protected SoundFile soundf;
  
  //constructor
  GameController() {
    winLevel = false;
    loseLevel = false;
    isTimePaused = false;
    currentOrbGoal = 1;
    currentOrbCount = 0;
    
  }
  
  //loads the level and sets the variables
  public void loadLevel(Level level) {
    winLevel = false;
    loseLevel = false;
    currentOrbGoal = level.orbGoal;
    currentOrbCount = 0;
    currentLevel = level;
    currentLevel.setOrbs(this);
    //level.displayLevel();
  }
  
  //draws the current level
  public void displayCurrentLevel () {
    currentLevel.displayLevel();
  }
  
  ////reloads the level
  //public void resetLevel(){
  //  winLevel = false;
  //  loseLevel = false;
  //  currentOrbCount = 0;
  //  currentLevel.displayLevel();
  //  currentLevel.setOrbs(this);
  //}
  
  //adds to count and plays the colection sound 
  public void addToOrbCount(int num, Orb orb){
    currentOrbCount += num;
    soundf.play();
  }
  
  //getter for the lose level boolean
  public boolean checkCountdownBool() {
    return loseLevel;
  }
  
  //getter for the win boolean
  public boolean checkWinBool() {
    winLevel = checkOrbCount();
    return winLevel;
  }
  
  //returns a boolean for the current orb count
  private boolean checkOrbCount() {
    
    //while the current orb count is less than the goal - return false
    if(currentOrbCount < currentLevel.orbGoal) {
      return false;
    } else {
      return true;
    }
  }
  
  //creates a timer and returns its current  time
  public int timer(int timerLength) {
    
      int remainingTime = timerLength-millis();
    
      if(remainingTime/1000>0){
        int actualTime = (remainingTime/1000);
        return actualTime;
      } else {
        loseLevel = true;  //if the time has run out, set lose level
        return 0;
      }

  }
  
  //sets the soundfile for collection
  public void setSound(SoundFile sound) {
     soundf = sound; 
  }
  
}