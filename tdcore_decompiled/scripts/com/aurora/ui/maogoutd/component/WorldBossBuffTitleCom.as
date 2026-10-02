package com.aurora.ui.maogoutd.component
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4747.TweenMax;
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class WorldBossBuffTitleCom extends MovieClip
   {
      
      public var buffIcon:MovieClip;
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public var m_iBuffID:int;
      
      public var bPlayEnd:Boolean = false;
      
      private var m_BuffArray:Array = [320012304,320012320,320012288,320012336,320012352,320012368,320012384,320012400,320012416,320012432,320012448];
      
      public function WorldBossBuffTitleCom()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public function ShowBuffICon(iBuffID:int) : void
      {
         x = 100;
         y = -390;
         this.m_iBuffID = iBuffID;
         visible = true;
         this.bPlayEnd = false;
         this.ShowBuffIcon();
         this.gotoAndStop(1);
         this.index = 0;
         this.id = setInterval(this.onPlay,80);
      }
      
      public function onComplete() : void
      {
         this.bPlayEnd = true;
      }
      
      private function ShowBuffIcon() : void
      {
         var index:int = 0;
         if(this.buffIcon == null)
         {
            return;
         }
         if(this.m_iBuffID == 0)
         {
            this.buffIcon.gotoAndStop(1);
         }
         else
         {
            index = this.m_BuffArray.indexOf(this.m_iBuffID);
            if(index == -1)
            {
               index = 0;
            }
            this.buffIcon.gotoAndStop(index + 1);
         }
      }
      
      private function onPlay() : void
      {
         ++this.index;
         if(this.index >= 1 && this.index <= 35)
         {
            this.ShowBuffIcon();
            if(this.index == 35)
            {
               TweenMax.to(this,1,{
                  "x":-26,
                  "y":26,
                  "onComplete":this.onComplete
               });
            }
         }
         else if(this.index >= 46 && this.bPlayEnd == false)
         {
            this.index = 36;
         }
         this.gotoAndStop(this.index);
         var num:int = this.totalFrames;
         if(num <= this.index)
         {
            a_1789.getInstance().dispatchEvent(new a_1778("OnBuffGetEnd"));
            this.a_4158();
         }
      }
      
      public function a_4158() : void
      {
         if(this.id != -1)
         {
            clearInterval(this.id);
            this.id = -1;
         }
         this.bPlayEnd = false;
         visible = false;
      }
   }
}

