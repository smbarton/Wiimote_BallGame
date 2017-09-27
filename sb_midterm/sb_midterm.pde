import oscP5.*;
import netP5.*;  
import processing.sound.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

//position variables
float _x;
float _y;
float _pRad = 50;

int timerLength;

//declare  gameControllers and levels
GameController gc;
Level01 level01;
Level02 level02;
Level03 level03;

//array for levels
Level[] lvlArray;

int lvlIndex;

//sounds
SoundFile winGame, collect;

//create pointer
Pointer pointer = new Pointer();

//ints for orbs
int totalOrbs, collectedOrbs, goalOrbs;

void setup() {
  
  //start at the first level
  lvlIndex = 0;
  
  //initialize array 
  lvlArray = new Level[3];
  
  //game controller
  gc = new GameController();

  //create levels and set them into array
  level01 = new Level01();
  level02 = new Level02();
  level03 = new Level03();
  
  lvlArray[0] = level01;
  lvlArray[1] = level02;
  lvlArray[2] = level03;
  
  //load first level
  gc.loadLevel(lvlArray[lvlIndex]);
  
  size(900, 675);
  frameRate(25);
  
  //create sound files
  winGame = new SoundFile(this, "winSound.mp3");
  collect = new SoundFile(this, "blop.mp3");
  
  //set the sound for collecting
  gc.setSound(collect);
  
  //create pointer
  pointer.setColor(43, 236, 239);
  pointer.setIsPointer(true);
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}


void draw() {
  background(0);  
  pointer.setPosition(_x, _y, _pRad);
  pointer.display();
  
  gc.displayCurrentLevel();
  
  //check for win bool and display victory message
  if(gc.checkWinBool() == true){
      textSize(32);
      text("Good job!" , width/2, 30);
      fill(0, 102, 153);
      lvlIndex++;
      
      //load the next level in the array
      if(lvlIndex < lvlArray.length){
        clear();
        winGame.play();
        gc.loadLevel(lvlArray[lvlIndex]);
      } 
      
  } else {
    //display timer
    textSize(32);
    text("Time left: " + gc.timer(60000) , 10, 30);
    //text("Time left: " + gc.timer(600000) , 10, 30);
    fill(0, 102, 153);
  }
  
  //check if time is up
  if(gc.checkCountdownBool() == true){
      clear();
      textSize(32);
      text("You lose!" , width/2, 30);
      fill(0, 102, 153);
  }
}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(123); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  
  //PITCH, ROLL, YAW POSITIONING
  //if(theOscMessage.addrPattern().equals("/wii/1/accel/pry") && 
  //  theOscMessage.typetag().equals("ffff")) {
  
  //  float p = theOscMessage.get(0).floatValue();
  //  float r = theOscMessage.get(1).floatValue();
  //  float y = theOscMessage.get(2).floatValue();
    
  ////  println(" values: " + p + ", " + r + ", " + y);
    
  //  _x = map(y * 100, 0, 100, 0, width);
  //  _y = map(p * 100, 100, 0, 0, height);
    
  ////  println("new values: " + _x + ", " + _y);
    
  //}
  
  ////IR POSITIONING - X
    if(theOscMessage.addrPattern().equals("/wii/1/ir/x") && 
      theOscMessage.typetag().equals("f")) {
    
      float x = theOscMessage.get(0).floatValue();
      //float y = theOscMessage.get(1).floatValue();
      
      _x = map(x * 100, 0, 100, 0, width);
      //_y = map(y * 100, 100, 0, 0, height);
      println("x: " + _x);
    }
  
    //IR POSITIONING - Y
    if(theOscMessage.addrPattern().equals("/wii/1/ir/y") && 
      theOscMessage.typetag().equals("f")) {
    
      float y = theOscMessage.get(0).floatValue();
  
      _y = map(y * 100, 0, 100, 0, width);
      println("y: " + y);
    }
  
    //PRESS THE B BUTTON
    if(theOscMessage.addrPattern().equals("/wii/1/button/B") && 
    theOscMessage.typetag().equals("f")) {
      println("B Button Pressed");
      pointer.switchColor();
      //println(pointer.getColorBool());  //for debugging
    }
  
}