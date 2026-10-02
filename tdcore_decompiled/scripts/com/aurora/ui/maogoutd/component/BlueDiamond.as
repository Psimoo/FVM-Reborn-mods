package com.aurora.ui.maogoutd.component
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class BlueDiamond extends Sprite
   {
      
      public var m_SimpleBlueDiamondMc:MovieClip;
      
      public var m_SplendidBlueDiamondMc:MovieClip;
      
      public var m_SpecialBlueDiamondMc:MovieClip;
      
      public var m_YearSp:Sprite;
      
      public function BlueDiamond()
      {
         super();
         this.m_SimpleBlueDiamondMc.gotoAndStop(1);
         this.m_SplendidBlueDiamondMc.gotoAndStop(1);
         this.m_SpecialBlueDiamondMc.gotoAndStop(1);
         this.m_YearSp.visible = false;
         this.m_SimpleBlueDiamondMc.visible = false;
         this.m_SplendidBlueDiamondMc.visible = false;
         this.m_SpecialBlueDiamondMc.visible = false;
      }
      
      public function ShowBlueDiamond(type:int = 0, level:int = 1, year:Boolean = false) : void
      {
         if(type == 0)
         {
            this.m_SimpleBlueDiamondMc.visible = false;
            this.m_SplendidBlueDiamondMc.visible = false;
            this.m_SpecialBlueDiamondMc.visible = false;
            this.m_YearSp.visible = false;
         }
         else if(type == 1)
         {
            this.m_SimpleBlueDiamondMc.visible = true;
            this.m_SplendidBlueDiamondMc.visible = false;
            this.m_SpecialBlueDiamondMc.visible = false;
            if(level > 0)
            {
               this.m_SimpleBlueDiamondMc.gotoAndStop(level + 1);
            }
         }
         else if(type == 2)
         {
            this.m_SimpleBlueDiamondMc.visible = false;
            this.m_SplendidBlueDiamondMc.visible = true;
            this.m_SpecialBlueDiamondMc.visible = false;
            if(level > 0)
            {
               this.m_SplendidBlueDiamondMc.gotoAndStop(level + 1);
            }
         }
         else if(type == 3)
         {
            this.m_SimpleBlueDiamondMc.visible = false;
            this.m_SplendidBlueDiamondMc.visible = false;
            this.m_SpecialBlueDiamondMc.visible = true;
            if(level > 0)
            {
               this.m_SpecialBlueDiamondMc.gotoAndStop(level + 1);
            }
         }
         this.m_YearSp.visible = year;
         if(this.m_YearSp.visible == false)
         {
            this.m_SimpleBlueDiamondMc.x = 9;
            this.m_SplendidBlueDiamondMc.x = 9;
            this.m_SpecialBlueDiamondMc.x = 9;
         }
         else
         {
            this.m_SimpleBlueDiamondMc.x = 0;
            this.m_SplendidBlueDiamondMc.x = 0;
            this.m_SpecialBlueDiamondMc.x = 0;
         }
      }
   }
}

