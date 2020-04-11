
/*Interruption PCINT2*/

#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 6);

volatile int opto1=0;
volatile int opto2=0;

void pciSetup(byte pin)
{
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin));  // enable pin
    PCIFR  |= bit (digitalPinToPCICRbit(pin)); // clear any outstanding interrupt
    PCICR  |= bit (digitalPinToPCICRbit(pin)); // enable interrupt for the group
}

ISR(PCINT2_vect) // handle pin change interrupt for D0 to D7 here
{
  if (digitalRead(2) == LOW){
   opto1=opto1+1;
  }
  if (digitalRead(7) == LOW){
   opto2=opto2+1;
  } 
 
  lcd.setCursor(0,1);
  String chaine = "1: " + String(opto1) + " 2: " + String(opto2);
  lcd.print(chaine);
}  

void setup()   
{
  
  Serial.begin(9600); 
  lcd.begin(16, 2);
  pciSetup(7);
  pciSetup(2);
  lcd.print("Number balls");
  lcd.setCursor(0,1);
  String chaine = "1: " + String(opto1) + " 2: " + String(opto2);
  lcd.print(chaine);
}

void loop()
{ 
  
}
