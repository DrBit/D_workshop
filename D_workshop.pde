/*
 Fade
 
 This example shows how to fade an LED on pin 9
 using the analogWrite() function.
 
 This example code is in the public domain.
 
 */
#define max_speed  126 // (minimum 0 - max 255)
#define min_speed  27 // (minimum 0 - max 255)
#define motor_pin 9

int motorSpeed = min_speed;    // how fast the motor goes
int speedIncrement = 5;    // how big the incrments in velocity are (recomended values 0 - 20) needs to be bigger smaller than rampSpeed
int rampTime = 2000;    // how fast goes to fade in or out in ms ( 

// calculations
unsigned int refDelay = rampTime/(max_speed / speedIncrement);

void setup()  { 
  // declare pin 9 to be an output:
  pinMode(motor_pin, OUTPUT);    // Where we conect the transistor or the mosfet to drive the motor
  Serial.begin (9800);
  
  Serial.print ("refDelay = "); Serial.println (refDelay);
} 

void loop()  { 
  int vMode = 2;
  switch (vMode) {
    case 1:
      fade_test ();
      //Serial.print ("infade");
    break;
    
    case 2:
      speed_test ();
    
    break;
   
  } 
  //Serial.print ("loop"); 
  
  while (true) {
    //end loop 
  }
                          
}


void fade_test () {  
  
  // set the speed of pin 9:
  analogWrite(motor_pin, motorSpeed);
  
  // change the brightness for next time through the loop:
  motorSpeed = motorSpeed + speedIncrement;

  // reverse the direction of the fading at the ends of the fade: 
  if (((motorSpeed + speedIncrement) <= min_speed) || ((motorSpeed + speedIncrement) >= max_speed)) {
    speedIncrement = -speedIncrement ; 
    //Serial.print ("speedIncrement = "); Serial.println (speedIncrement);
    //Serial.print ("motorSpeed = "); Serial.println (motorSpeed);
  }  
  
  //Serial.print ("refDelay = "); Serial.println (refDelay);
  // wait for 30 milliseconds to see the dimming effect    
  delay(refDelay);  
}

void speed_test () {

  for (int a = 0; a < max_speed; a++) {
    // set the speed of pin 9:
    analogWrite(motor_pin, a);
    Serial.print ("motorSpeed = "); Serial.println (a);
    delay(1000);    // wait for 1 second so we can see the increments and determine the speed 
  }
  
  analogWrite(motor_pin, 0);   
}
