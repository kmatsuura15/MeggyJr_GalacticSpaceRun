#include <MeggyJrSimple.h>    //Required code 1 of 2
boolean death = false;
boolean round1 = true;
boolean round2 = false;
boolean round3 = false;
int marker = 0;    //counts the amount of times shot 1 and 2 wrap around  
int xcoord = 0;    //int x coord
int ycoord = 5;    //int y coord
int xdoc = 7;    //int xcoord of the docking station
int ydoc = 7;    //int ycoord of the docking station
int xdoc2 = 7;    //int xcoord of the docking station in round 2
int ydoc2 = 7;    // int ycoord of the docking station in round 2
int xshot = 6;    //int xcoord of shot 1
int yshot = random(8);    //random ycoord of shot 1
int xshot2 = 6;    //int xcoord of shot 2
int yshot2 = random(8);    //random ycoord of shot 2
int xshot3 = 4;    //int xcoord of shot 3
int yshot3 = random(8);    //random ycoord of shot 3
int xshot4 = 3;    
int yshot4 = random(8);
int xshot5 = 5;
int yshot5 = random(8);
int direction = 270;    //initial direction
int mountainArray[8] = {4, 3, 1, 5, 2, 4, 3, 1};    //initial y values of mountain.

void setup()
{
 MeggyJrSimpleSetup();  //required code 2 of 2
 Serial.begin(9600);    //Mr. Kiang wrote this.  This is used to track the values of each mountain in the mountainArray.
}


void loop()
{
 DrawPx(xcoord,ycoord,Red);    //Draws Player  
 DrawPx(xshot,yshot,Green);    //Draws first shot
 DrawPx(xshot2,yshot2,Green);    //Draws 2nd shot
 drawMountain();    //draws the mountain
 DisplaySlate();
 ClearSlate();
 delay(100);
 CheckButtonsDown();
   if (Button_Down){
     ycoord--;    // moves player down
   }
   if (Button_Up){
     ycoord++;    //moves player up
   }
 ifStatements();
 updateMountain();
}










void ifStatements()
{
 if (round1){    //if it's round one...
  if (marker >= 20){    //if the marker is greater than or equal to twenty, the docking station will spawn in.  Allowing the player to reach the next level.
    DrawPx(xdoc,ydoc,Violet);    //Draws the docking station
  }
   if (ycoord > 7){    //Doesn't let the player go above and outside the Meggy Screen
     ycoord = 7;
   }
   if (ycoord < 0){    //Doesn't let the player go below and outside the Meggy Screen 
   ycoord = 0;
   }
   if (direction == 270){    //if direction is 270, both shots and docking station will move to the left.
   xshot--;
   xshot2--;
   xdoc--;
   }
   if (xdoc < 0){    //these make the shots and docking station loop around.
     xdoc = 7;
   }
   if (xshot < 0){
     xshot = 7;
   }
   if (xshot2 < 0){
     xshot2 = 7;
   }
   if (xshot == 7){    //if the shot loops around, the ycoord will be a random number.  This makes the game unpredictable.
     yshot = random(8);
     marker++;
   }
 
   if (xshot2 == 7){
     yshot2 = random(8);
     marker++;
   }
   if (xcoord == xshot && ycoord == yshot){    //these codes are the hit detection between the player and the shots and docking station.
     death = true;
   }
   if (xcoord == xshot2 && ycoord == yshot2){
     death = true;
   }
   if (xcoord == xdoc && ycoord == ydoc){
     round2 = true;
   }
 }
 
 if (round2){    // if it's round 2...
   round1 = false;  //it's not round 1 anymore.
   marker = 0;    // marker gets reset to zero round will be longer 
   DrawPx(xshot3, yshot3, Green);    //Draws another shot
   if (marker >= 30){    //if the marker is over or equal to 30, the docking station will appear.
     DrawPx(xdoc2,ydoc2,Violet);
   }
   if (ycoord > 7){    //the rest of the code in round2 is the same as the code in round1 except it has another shot coded for.
     ycoord = 7;
   }
   if (ycoord < 0){
   ycoord = 0;
   }
   if (direction == 270){
   xshot--;
   xshot2--;
   xshot3--;
   xdoc2--;
   }
   if (xdoc2 < 0){
     xdoc2 = 7;
   }
   if (xshot < 0){
     xshot = 7;
   }
   if (xshot2 < 0){
     xshot2 = 7;
   }
   if (xshot3 < 0){
     xshot3 = 7;
   }
   
   if (xshot == 7){
     yshot = random(8);
     marker++;
   }
 
   if (xshot2 == 7){
     yshot2 = random(8);
     marker++;
   }
   
   if (xshot3 == 7){
     yshot3 = random(8);
   }
   if (xcoord == xshot && ycoord == yshot){
     death = true;
   }
   if (xcoord == xshot2 && ycoord == yshot2){
     death = true;
   }
   if (xcoord == xshot3 && ycoord == yshot3){
     death = true;
   }
   if (xcoord == xdoc2 && ycoord == ydoc2){
   round3 = true;
   }  
 }
 
 if (round3){    //if round 3...
   round1 = false;
   round2 = false;    //It's not round 1 and 2...
   DrawPx(xshot3,yshot3,Green);    //Draws the other shots.  
   DrawPx(xshot4,yshot4,Green);
   DrawPx(xshot5,yshot5,Green);
   if (ycoord > 7){    //Rest of code is exactly the same except 2 more shots are coded for.
     ycoord = 7;
   }
   if (ycoord < 0){
   ycoord = 0;
   }
   if (direction == 270){
   xshot--;
   xshot2--;
   xshot3--;
   xshot4--;
   xshot5--;
   }
   if (xshot < 0){
     xshot = 7;
   }
   if (xshot2 < 0){
     xshot2 = 7;
   }
   if (xshot3 < 0){
     xshot3 = 7;
   }
   if (xshot4 < 0){
     xshot4 = 7;
   }
   if (xshot5 < 0){
     xshot5 = 7;
   }
   if (xshot == 7){
     yshot = random(8);
   }
 
   if (xshot2 == 7){
     yshot2 = random(8);
   }
   if (xshot3 == 7){
     yshot3 = random(8);
   }
   if (xshot4 == 7){
     yshot4 = random(8);
   }
   if (xshot5 == 7){
     yshot5 = random(8);
   }
   if (xcoord == xshot && ycoord == yshot){
     death = true;
   }
   if (xcoord == xshot2 && ycoord == yshot2){
     death = true;
   }
   if (xcoord == xshot3 && ycoord == yshot3){
     death = true;
   }
   if (xcoord == xshot4 && ycoord == yshot4){
     death = true;
   }
   if (xcoord == xshot5 && ycoord == yshot5){
     death = true;
   }
 }
    
   
 if (death){    //if you die, reset everything.
   ClearSlate();
   DisplaySlate();
   delay(3000);
   xcoord = 0;
   ycoord = 5;
   mountainArray[0] = 4;
   mountainArray[1] = 3;
   mountainArray[2] = 1;
   mountainArray[3] = 5;
   mountainArray[4] = 2;
   mountainArray[5] = 4;
   mountainArray[6] = 3;
   mountainArray[7] = 1;
   xshot = 7;
   xshot2 = 7;
   round1 = true;
   round2 = false;
   round3 = false;
   marker = 0; 
   death = false;
   }
}  

 





void drawMountain()
{
  for (int x = 0; x < 7; x++)
  {
   for (int i = 0; i < mountainArray[x]; i++){
    DrawPx (x, i, Blue);    //coordinates of the mountains
    if (xcoord == x && ycoord == i){    //if player hits the mountain, the player dies.
      death = true;
    }  
   }
 for (int c = 0; c < 8; c++)    //keeps track of the values in the Array.
 {
  Serial.print(mountainArray[c]);
  Serial.print(" ");
 }
 Serial.println();
 }
}








void updateMountain()
{
  for (int i = 0; i < 7; i++){    //the mountains will copy from left to right.
    mountainArray[i] = mountainArray[i+1];
  }
  
  mountainArray[7] = random(8);    //the 7th mountain or last one will be a random height.
  while (mountainArray[7] > mountainArray[6]+2 && mountainArray[7] > 0)
  mountainArray[7] = random(8);
}
  

