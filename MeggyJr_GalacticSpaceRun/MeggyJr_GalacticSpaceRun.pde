#include <MeggyJrSimple.h>    //Required code 1 of 2
//int mCounter = 0;
//int shotCounter = 1;
boolean round1 = false;
boolean death = false;
int xdoc = 16;
int ydoc = 7;
int xcoord = 0;
int ycoord = 5;
int direction = 270;
int xshot = 7;
int yshot = 5;
int xshot2 = 7;
int yshot2 = 4;
int mountainArray[8] = {4, 3, 1, 5, 2, 4, 3, 1};

void setup()
{
 MeggyJrSimpleSetup();  //required code 2 of 2
 Serial.begin(9600);
}

void loop()
{
 DrawPx(xcoord,ycoord,Red);
 DrawPx(xshot,yshot, Blue);
 DrawPx(xdoc,ydoc,Violet);
 drawMountain();
 DisplaySlate();
 ClearSlate();
 delay(400);
 CheckButtonsDown();
 if (Button_Up){
   ycoord++;
   //mCounter++;
 }
 if (Button_Down){
   ycoord--;
   //mCounter++;
 } 
 if (ycoord > 7){
   ycoord = 7;
 }
 if (ycoord < 0){
   ycoord = 0;
 }
 if (direction == 270){
   xshot--;
   xdoc--;
   xshot2--;
 }
 if (xshot < 0){
   xshot = 7;
   yshot = random(8);
 }
 
 if (xshot2 < 0){
   xshot2 = 7;
   yshot2 = random(8);
 }
 
 updateMountain();
  
 
// if (shotCounter = 1){
 //  DrawPx(xshot, yshot, Blue);
   //shotCounter = 0;
 //}
  
 if (xcoord == xdoc && ycoord == ydoc){
   round1 = true;
 }
  
 if (round1){
   ClearSlate();
   DisplaySlate();
   delay(2000);
   //mCounter = 0;
   //shotCounter = 0;
   xcoord = 0;
   ycoord = 5;
   DrawPx(xshot2, yshot2, Blue);
   round1 = false;  
 }
  
 if (ReadPx(xcoord, ycoord) == Blue){
   death = true;
 }
 
 if (xcoord == xshot && ycoord == yshot){
   death = true;
 }
 
 if (death){
   ClearSlate();
   DisplaySlate();
   delay(1000);
   //mCounter = 0;
   //shotCounter = 0;
   xcoord = 0;
   ycoord = 5;
   death = false;
  }
}







void drawMountain()
{
  for (int x = 0; x < 8; x++)
  {
   for (int i = 0; i < mountainArray[x]; i++)
    DrawPx (x, i, Blue);
   }
 for (int c = 0; c < 8; c++)
 {
  Serial.print(mountainArray[c]);
  Serial.print(" ");
 }
 Serial.println();
 }

void updateMountain()
{
  for (int i = 0; i < 7; i++){
    mountainArray[i] = mountainArray[i+1];
  }
  mountainArray[7] = random(8);
  while (mountainArray[7] > mountainArray[6]+2 || mountainArray[7] < mountainArray[6]-2  && mountainArray[7] > 0)
  mountainArray[7] = random(8);
}
