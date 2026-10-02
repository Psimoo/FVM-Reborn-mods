package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FallenEdenChangeStep2Effect extends MovieClip
   {
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public var gameMap:FallenEdenGameMap;
      
      public function FallenEdenChangeStep2Effect()
      {
         super();
      }
      
      public function PlayAnimation() : void
      {
         visible = true;
         this.gotoAndStop(1);
         this.index = 0;
         this.id = setInterval(this.OnPlay,99);
      }
      
      private function OnPlay() : void
      {
         ++this.index;
         this.gotoAndStop(this.index);
         if(this.index == 10 && this.gameMap != null)
         {
            this.gameMap.a_4130();
         }
         var num:int = 23;
         if(num <= this.index)
         {
            this.StopAnimation();
         }
      }
      
      public function StopAnimation() : void
      {
         if(this.id != -1)
         {
            clearInterval(this.id);
            this.id = -1;
         }
         visible = false;
      }
   }
}

