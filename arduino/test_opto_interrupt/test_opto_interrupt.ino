
#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 6);

volatile int comptageImpulsion=0;


void setup()   {
  
Serial.begin(9600); 
lcd.begin(16, 2);
attachInterrupt(0, gestionINT0, RISING);
lcd.print("Nb balle");
lcd.setCursor(0,1);
lcd.print(comptageImpulsion);
}

void loop(){ 
  lcd.setCursor(0,1);
  lcd.print(comptageImpulsion);
  delay(50);
}

void gestionINT0() {
  comptageImpulsion=comptageImpulsion+1; 
Serial.print("Nombre impulsions = ");
Serial.println(comptageImpulsion);



}
