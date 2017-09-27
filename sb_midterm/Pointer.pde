public class Pointer extends Orb {
  private boolean bColor = true;
  
  //contstructor
  Pointer() {
    _x = width/2;
    _y = height/2;
    _rad = 50;
    
    _color = _blue;
  }
  
  //switch color by pressing the B button
  public void switchColor(){
    bColor = !bColor;
    
    if(bColor == true) {
      _color = _lBlue;
    } else {
      _color = _orange;
    }
  }
  
}