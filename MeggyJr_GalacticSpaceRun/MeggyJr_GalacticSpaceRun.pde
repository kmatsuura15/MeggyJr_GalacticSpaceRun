#include <MeggyJrSimple.h>  //required code 1 of 2

int marker = 7;
int moveCounter = 0;
int xcoord = 0;
int ycoord = 4;

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
Point s11 = {5,3};
Point s12 = {7,3};
Point s13 = {6,4};


Point mountainArray[64] = {s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13};



void setup()
{
  MeggyJrSimpleSetup();    //required code 2 of 2
}

void loop()
{
 DrawPx(xcoord,ycoord,Blue);
 for (int i = 0; i < marker; i++){ 
   DrawPx(mountainArray[i].x, mountainArray[i].y, Orange);
   if (moveCounter%3 == 0){    //This doesn't work
     marker+3;
   }  
   if (marker >= 13){
     marker = 7;
   }   
   CheckButtonsDown();
    if (Button_Right){
      mountainArray[i].x--;
      moveCounter++;
    }
    if (Button_Down){
      ycoord--;
      DrawPx(xcoord,ycoord,Blue);
    }  
    if (Button_Up){
      ycoord++;
      DrawPx(xcoord,ycoord,Blue);
    } 
 }
 DisplaySlate();
 ClearSlate();
 delay(200);
}




