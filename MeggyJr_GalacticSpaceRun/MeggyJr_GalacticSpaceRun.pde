#include <MeggyJrSimple.h>  //required code 1 of 2

int marker = 7;
int moveCounter = 0;
int direction = 90;

struct Point{
  int x;    //x-coordinate of this point.
  int y;    //y-coordinate of this point.
};

Point s1 = {7,0};    //origonal points of the first mountain
Point s2 = {6,0};
Point s3 = {5,0};
Point s4 = {6,1};
Point s5 = {7,1};
Point s6 = {5,1};
Point s7 = {6,2};
Point s8 = {5,2};
Point s9 = {7,2};
Point s10 = {6,3};


Point mountainArray[64] = {s1, s2, s3, s4, s5, s6, s7, s8, s9, s10};



void setup()
{
  MeggyJrSimpleSetup();    //required code 2 of 2
}

void loop()
{
 drawMountain();
 DisplaySlate();
 delay(200);
 ClearSlate();
 moveMountain();
 if (moveCounter%3 == 0){    //This doesn't work
   marker+3 || marker-3;
   DisplaySlate();
 }  
}

void drawMountain()
{
 for (int i = 0; i < marker; i++){
   DrawPx(mountainArray[i].x, mountainArray[i].y, Orange);
 }
}

void moveMountain()
{
 for (int i = 0; i < marker; i++){ 
   CheckButtonsDown();
     if (Button_Right){
       direction = 90;
     }
   if (direction == 90){
     mountainArray[i].x--;
     moveCounter++;
   }  
 }
}

