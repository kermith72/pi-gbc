
/*Interruption PCINT2 with I2C*/
#include <Wire.h>
#include "rgb_lcd.h"

rgb_lcd lcd;

const int colorR = 255;
const int colorG = 0;
const int colorB = 0;


volatile int opto1=0;
volatile int opto2=0;
volatile int opto3=0;
volatile int opto4=0;
volatile int opto5=0;
volatile int opto6=0;
volatile int opto7=0;

void pciSetup(byte pin)
{
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin));  // enable pin
    PCIFR  |= bit (digitalPinToPCICRbit(pin)); // clear any outstanding interrupt
    PCICR  |= bit (digitalPinToPCICRbit(pin)); // enable interrupt for the group
}

ISR(PCINT2_vect) // handle pin change interrupt for D2 to D7 here
{
  if (digitalRead(2) == LOW){
   opto1=opto1+1;
  }
  if (digitalRead(3) == LOW){
   opto2=opto2+1;
  } 
  if (digitalRead(4) == LOW){
   opto3=opto3+1;
  } 
  if (digitalRead(5) == LOW){
   opto4=opto4+1;
  } 
  if (digitalRead(6) == LOW){
   opto6=opto5+1;
  } 
  if (digitalRead(7) == LOW){
   opto6=opto6+1;
  } 
 
} 

ISR(PCINT1_vect) // handle pin change interrupt for A0 to A5 here
{
  if (digitalRead(A0) == LOW){
   opto7=opto7+1;
  }
 
} 
 

void setup()   
{
  
  lcd.begin(16, 2);
  lcd.setRGB(colorR, colorG, colorB);
  pciSetup(2);
  pciSetup(3);
  pciSetup(4);
  pciSetup(5);
  pciSetup(6);
  pciSetup(7);
  pciSetup(A0);
  lcd.print("2 3 4 5 6 7 A");
 }

void loop()
{ 
  lcd.setCursor(0,1);
  String chaine = String(opto1) + " " + String(opto2) + " " + String(opto3) + " " + String(opto4) + " " + String(opto5) + " " + String(opto6) + " " + String(opto7);
  lcd.print(chaine);
  delay(100);
}
