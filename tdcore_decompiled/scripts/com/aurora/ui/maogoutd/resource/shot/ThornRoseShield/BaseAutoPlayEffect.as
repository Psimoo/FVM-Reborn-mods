package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BaseAutoPlayEffect extends BaseBuffEffectMovieClip
   {
      
      private var a_1109:Timer;
      
      public function BaseAutoPlayEffect()
      {
         super();
         mouseEnabled = false;
         this.a_1109 = new Timer(50);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4109);
      }
      
      override public function a_1797(isReversed:Boolean = false) : Boolean
      {
         super.a_1797(isReversed);
         visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function play() : void
      {
         this.a_1109.start();
      }
      
      public function stop() : void
      {
         this.a_1109.stop();
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SpecialSkillCallBack(... args) : void
      {
      }
      
      public function a_3940() : Boolean
      {
         visible = false;
         gotoAndStop(1);
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
         return true;
      }
   }
}

