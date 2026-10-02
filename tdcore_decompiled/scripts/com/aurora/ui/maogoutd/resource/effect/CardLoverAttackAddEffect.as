package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class CardLoverAttackAddEffect extends MovieClip
   {
      
      private var m_stTiemr:Timer;
      
      public var m_Text:TextField;
      
      public var m_addType:MovieClip;
      
      public function CardLoverAttackAddEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : CardLoverAttackAddEffect
      {
         return PoolManager.getInstance().CheckOutOne(CardLoverAttackAddEffect) as CardLoverAttackAddEffect;
      }
      
      public function a_1797(add:Number, type:int) : Boolean
      {
         this.m_addType.gotoAndStop(type);
         var isPercent:Boolean = type != 1;
         var value:Number = isPercent ? add / 100 : add;
         var displayValue:String = value.toFixed(2);
         if(displayValue.indexOf(".") != -1)
         {
            while(displayValue.charAt(displayValue.length - 1) == "0")
            {
               displayValue = displayValue.slice(0,-1);
            }
            if(displayValue.charAt(displayValue.length - 1) == ".")
            {
               displayValue = displayValue.slice(0,-1);
            }
         }
         this.m_Text.x = this.m_addType.x + this.m_addType.width + 3;
         var suffix:String = isPercent ? "" : "%";
         this.m_Text.htmlText = "<b>+" + displayValue + suffix + "</b>";
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.playEffect();
         return true;
      }
      
      protected function a_3940() : Boolean
      {
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

