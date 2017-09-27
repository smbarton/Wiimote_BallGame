public class Level01 extends Level {
  
  //Array of randomly positioned orbs
  protected Orb[] orbs = {
      new Orb(randomPosW(), randomPosH(), _pRad, _blue), 
      new Orb(randomPosW(), randomPosH(), _pRad, _blue), 
      new Orb(randomPosW(), randomPosH(), _pRad, _blue),
      new Orb(randomPosW(), randomPosH(), _pRad, _blue),
      new Orb(randomPosW(), randomPosH(), _pRad, _blue)
    };
  
  Level01(){
    orbGoal = orbs.length;
    //timerLength = 20000;
  }
  
  public void setOrbs(GameController gc) {
    for (Orb o : orbs) {
      o.attachGameController(gc);
      //o.setIsCollected(false);
    }
  }
  
  //display level and check for collisions
  public void displayLevel() {
    for (Orb o : orbs) {
      if(o.getIsCollected() == false) {
        o.display();
        o.checkCollision(pointer);
      }
    }
  }
  
  
}