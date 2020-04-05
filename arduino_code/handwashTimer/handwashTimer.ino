#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

#define pinPIR 2
#define pinLED 4

#define NUMPIXELS      16

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, pinLED, NEO_GRB + NEO_KHZ800);

void setup() {
  // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif
  // End of trinket special code

  pinMode( pinPIR,INPUT );
  
  pixels.begin(); // This initializes the NeoPixel library.
  pixels.setBrightness(127);
  // circle start
  for(byte i=0;i<NUMPIXELS;i++){ pixels.setPixelColor(i, pixels.Color(255,255,255)); pixels.show(); delay(50); }
  // circle stop
  for(byte i=0;i<NUMPIXELS;i++){ pixels.setPixelColor(i, pixels.Color(0,0,0)); pixels.show(); delay(50); }
  delay(5000);
}

void loop() {
  if ( digitalRead(pinPIR) == 1) {
    int timeToWait = ((60000/NUMPIXELS)/2);
    pixels.setBrightness(255); 
    for(byte i=0;i<=NUMPIXELS;i++) { pixels.setPixelColor((NUMPIXELS-i), pixels.Color(0,   0,255)); pixels.show(); delay(timeToWait); }
    for(byte i=0;i<=NUMPIXELS;i++) { pixels.setPixelColor((NUMPIXELS-i), pixels.Color(161,66,245)); pixels.show(); delay(timeToWait); }
    for(byte i=0;i<=NUMPIXELS;i++) { pixels.setPixelColor((NUMPIXELS-i), pixels.Color(0,255,0)); pixels.show(); }
    delay(10000);
  } else {
    for(byte i=0;i<=NUMPIXELS;i++){ pixels.setPixelColor(i, pixels.Color(0,0,0)); pixels.show(); }
  }
}
