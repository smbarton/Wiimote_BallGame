public class Level03 extends Level {
  
  //Array of randomly positioned orbs
  protected Orb[] orbs = {
      new Orb(randomPosW(), randomPosH(), _pRad, _blue), 
      new Orb(randomPosW(), randomPosH(), _pRad, _blue), 
      new Orb(randomPosW(), randomPosH(), _pRad, _blue),
      new Orb(randomPosW(), randomPosH(), _pRad, _blue),
      new Orb(randomPosW(), randomPosH(), _pRad, _blue),
      new Orb(randomPosW(), randomPosH(), _pRad, _blue), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange), 
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange),
      new Orb(randomPosW(), randomPosH(), _pRad, _orange)
    };
  
  Level03(){
    orbGoal = orbs.length;
    timerLength = 20000;
  }
  
  public void setOrbs(GameController gc) {
    for (Orb o : orbs) {
      o.attachGameController(gc);
    }
  }
  
  public void displayLevel() {
    for (Orb o : orbs) {
      if(o.getIsCollected() == false) {
        o.display();
        o.checkCollision(pointer);
      }
    }
  }
  
  
}