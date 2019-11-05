#include <CapacitiveSensor.h>

#include <AP_Sync.h>

AP_Sync sendData(Serial); // Create an Object named sendData of type APsync

CapacitiveSensor   cs_2_3 = CapacitiveSensor(2, 3);
CapacitiveSensor   cs_4_5 = CapacitiveSensor(4, 5);
CapacitiveSensor   cs_6_7 = CapacitiveSensor(6, 7);
CapacitiveSensor   cs_8_9 = CapacitiveSensor(8, 9);
CapacitiveSensor   cs_10_11 = CapacitiveSensor(10, 11);
CapacitiveSensor   cs_12_13 = CapacitiveSensor(12, 13);
void setup()
{

  Serial.begin(9600);

}

void loop()
{
  long start = millis();
  long total1 =  cs_2_3.capacitiveSensor(30);
  long total2 =  cs_4_5.capacitiveSensor(30);
  long total3 =  cs_6_7.capacitiveSensor(30);
  long total4 =  cs_8_9.capacitiveSensor(30);
  long total5 =  cs_10_11.capacitiveSensor(30);
  long total6 =  cs_12_13.capacitiveSensor(30);

  delay(10);
  sendData.sync("touch1", (total1));
  sendData.sync("touch2", (total2));
  sendData.sync("touch3", (total3));
  sendData.sync("touch4", (total4));
  sendData.sync("touch5", (total5));
  sendData.sync("touch6", (total6));
}
