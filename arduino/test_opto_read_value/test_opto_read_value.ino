/* Test optocoupleur 
   read value*/

int ruptPin = 2; // select the input pin for the optocoupleur
int val = 0; // variable to store the value coming from the sensor
int LedRed = 2; 
int LedGreen = 3;


void setup()
{
    Serial.begin(9600); // set up Serial library at 9600 bps
    pinMode(LedRed, OUTPUT);
    pinMode(LedGreen, OUTPUT);
}

void loop()
{
    val = analogRead(ruptPin); // read the value from the sensor
    Serial.println(val); // print the sensor value to the serial monitor
    if (val < 600) {
      digitalWrite(LedGreen, LOW);
      digitalWrite(LedRed, HIGH);
    }
    else {
      digitalWrite(LedGreen, HIGH);
      digitalWrite(LedRed, LOW);
    }
    delay(50);
}
