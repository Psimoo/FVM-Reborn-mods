package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class CardLoverEnergyAddEffect extends MovieClip
   {
      
      private var m_stTiemr:Timer;
      
      public var m_Text:TextField;
      
      public function CardLoverEnergyAddEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : CardLoverEnergyAddEffect
      {
         return PoolManager.getInstance().CheckOutOne(CardLoverEnergyAddEffect) as CardLoverEnergyAddEffect;
      }
      
      public function a_1797(add:Number) : Boolean
      {
         this.m_Text.htmlText = "<b>+" + add.toFixed(1).toString() + "</b>";
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.playEffect();
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         PoolManager.getInstance().CheckInOne(this);
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.stopEffect();
         return true;
      }
      
      public function playEffect() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stopEffect() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         if(currentFrame < totalFrames)
         {
            gotoAndStop(currentFrame + 1);
         }
         if(currentFrame == totalFrames)
         {
            this.a_3940();
            return;
         }
      }
   }
}

