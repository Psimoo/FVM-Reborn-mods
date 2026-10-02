package com.aurora.ui.maogoutd.component
{
   import flash.display.MovieClip;
   
   public class ArmyGemBg extends MovieClip
   {
      
      public function ArmyGemBg()
      {
         super();
      }
      
      public function setLevel(iMaxLevel:int) : void
      {
         if(0 < iMaxLevel && iMaxLevel < 6)
         {
            gotoAndStop(2);
         }
         else if(5 < iMaxLevel && iMaxLevel < 9)
         {
            gotoAndStop(3);
         }
         else if(9 == iMaxLevel)
         {
            gotoAndStop(4);
         }
         else if(10 == iMaxLevel)
         {
            gotoAndStop(5);
         }
         else if(iMaxLevel >= 11 && iMaxLevel <= 12)
         {
            gotoAndStop(6);
         }
         else if(iMaxLevel >= 13 && iMaxLevel <= 14)
         {
            gotoAndStop(7);
         }
         else if(iMaxLevel >= 15)
         {
            gotoAndStop(8);
         }
         else
         {
            gotoAndStop(1);
         }
      }
   }
}

