#include <MeggyJrSimple.h>  //required code 1 of 2

int marker = 7

struct Point{
  int x;    //x-coordinate of this point.
  int y;    //y-coordinate of this point.
};

Point s1 = {7,0};    //origonal points of the first mountain
Point s2 = {6,0};
Point s3 = {5,0};
Point s4 = {6,1};
Point s5 = {7,1};
Point s6 = {6,2};
Point s7 = {5,1};

Point mountainArray[64] = {s1, s2, s3, s4, s5, s6, s7};

void setup()
{
  MeggyJrSimpleSetup();    //required code 2 of 2
}

void loop()
{
  for (int i = 0; i <= marker; i++){
    DrawPx(mountainArray[i].x, mountainArray[i].y, Blue);

}

void drawMountain()
{
  
