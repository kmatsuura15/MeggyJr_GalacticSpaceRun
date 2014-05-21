#include <MeggyJrSimple.h>    //Required code 1 of 2
boolean death = false;
boolean round1 = true;
boolean round2 = false;
boolean round3 = false;
int marker = 0;
int xcoord = 0;
int ycoord = 5;
int xdoc = 7;
int ydoc = 7;
int xdoc2 = 7;
int ydoc2 = 7;
int xshot = 6;
int yshot = random(8);
int xshot2 = 6;
int yshot2 = random(8);
int xshot3 = 4;
int yshot3 = random(8);
int xshot4 = 3;
int yshot4 = random(8);
int xshot5 = 5;
int yshot5 = random(8);
int direction = 270;
int mountainArray[8] = {4, 3, 1, 5, 2, 4, 3, 1};

void setup()
{
 MeggyJrSimpleSetup();  //required code 2 of 2
 Serial.begin(9600);
}


void loop()
{
 DrawPx(xcoord,ycoord,Red);
 DrawPx(xshot,yshot,Green);
 DrawPx(xshot2,yshot2,Green);
 drawMountain();
 DisplaySlate();
 ClearSlate();
 delay(100);
 CheckButtonsDown();
   if (Button_Down){
     ycoord--;
   }
   if (Button_Up){
     ycoord++;
   }
 ifStatements();
 updateMountain();
}










void ifStatements()
{
 if (round1){
  if (marker >= 20){
    DrawPx(xdoc,ydoc,Violet);
  }
   if (ycoord > 7){
     ycoord = 7;
   }
   if (ycoord < 0){
   ycoord = 0;
   }
   if (direction == 270){
   xshot--;
   xshot2--;
   xdoc--;
   }
   if (xdoc < 0){
     xdoc = 7;
   }
   if (xshot < 0){
     xshot = 7;
   }
   if (xshot2 < 0){
     xshot2 = 7;
   }
   if (xshot == 7){
     yshot = random(8);
     marker++;
   }
 
   if (xshot2 == 7){
     yshot2 = random(8);
     marker++;
   }
   if (xcoord == xshot && ycoord == yshot){
     death = true;
   }
   if (xcoord == xshot2 && ycoord == yshot2){
     death = true;
   }
   if (xcoord == xdoc && ycoord == ydoc){
     round2 = true;
   }
 }
 
 if (round2){
   round1 = false;
   marker = 0;
   DrawPx(xshot3, yshot3, Green);
   if (marker >= 30){
     DrawPx(xdoc2,ydoc2,Violet);
   }
   if (ycoord > 7){
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
 
 if (round3){
   round1 = false;
   round2 = false;
   DrawPx(xshot3,yshot3,Green);
   DrawPx(xshot4,yshot4,Green);
   DrawPx(xshot5,yshot5,Green);
   if (ycoord > 7){
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
    
   
 if (death){
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
    DrawPx (x, i, Blue);
    if (xcoord == x && ycoord == i){
      death = true;
    }  
   }
 for (int c = 0; c < 8; c++)
 {
  Serial.print(mountainArray[c]);
  Serial.print(" ");
 }
 Serial.println();
 }
}








void updateMountain()
{
  for (int i = 0; i < 7; i++){
    mountainArray[i] = mountainArray[i+1];
  }
  
  mountainArray[7] = random(8);
  while (mountainArray[7] > mountainArray[6]+2 && mountainArray[7] > 0)
  mountainArray[7] = random(8);
}
  

