package com.aurora.ui.maogoutd.game
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   
   public class GameGuideCardIntruducePanel extends Sprite
   {
      
      public var m_stConfirmButton:SimpleButton;
      
      public var m_stCardInfoMovie:MovieClip;
      
      public function GameGuideCardIntruducePanel()
      {
         super();
         this.m_stCardInfoMovie.gotoAndStop(1);
      }
   }
}

