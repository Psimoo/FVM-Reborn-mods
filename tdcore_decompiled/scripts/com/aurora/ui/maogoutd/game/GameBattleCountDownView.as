package com.aurora.ui.maogoutd.game
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GameBattleCountDownView extends Sprite
   {
      
      private static const RED_SWITCH_THRESHOLD:int = 30;
      
      public var m_stGreenZeroMovie:MovieClip;
      
      public var m_stGreenFirstMovie:MovieClip;
      
      public var m_stGreenSecondMovie:MovieClip;
      
      public var m_stGreenThirdMovie:MovieClip;
      
      public var m_stGreenFourthMovie:MovieClip;
      
      public var m_stRedFirstMovie:MovieClip;
      
      public var m_stRedSecondMovie:MovieClip;
      
      public var m_stRedThirdMovie:MovieClip;
      
      public var m_stRedFourthMovie:MovieClip;
      
      private var m_iTotalSeconds:int = 0;
      
      private var m_stTimer:Timer;
      
      private var greenDigits:Array;
      
      private var greenLastValues:Array = [-1,-1,-1,-1];
      
      private var redDigits:Array;
      
      private var redLastValues:Array = [-1,-1,-1];
      
      private var lastTenMinuteDigit:int = -1;
      
      private var lastMinuteDigit:int = -1;
      
      private var lastTenSecondDigit:int = -1;
      
      private var lastSecondDigit:int = -1;
      
      public function GameBattleCountDownView()
      {
         var mc:MovieClip = null;
         super();
         this.greenDigits = [this.m_stGreenZeroMovie,this.m_stGreenFirstMovie,this.m_stGreenThirdMovie,this.m_stGreenFourthMovie];
         this.redDigits = [this.m_stRedFirstMovie,this.m_stRedThirdMovie,this.m_stRedFourthMovie];
         for each(mc in this.greenDigits)
         {
            mc.gotoAndStop(1);
         }
         for each(mc in this.redDigits)
         {
            mc.gotoAndStop(1);
         }
         this.m_stGreenSecondMovie.gotoAndStop(1);
         this.m_stRedSecondMovie.gotoAndStop(1);
         this.m_stRedFirstMovie.y = 0;
         this.m_stRedSecondMovie.y = 7;
         this.m_stRedThirdMovie.y = 0;
         this.m_stRedFourthMovie.y = 0;
         this.m_stTimer = new Timer(1000);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.onTimerTick);
         this.addEventListener(Event.ADDED_TO_STAGE,this.a_4587);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveStateHandler);
      }
      
      private function a_4587(e:Event) : void
      {
         this.m_stTimer.start();
      }
      
      protected function onRemoveStateHandler(a_4730:Event) : void
      {
         this.m_stTimer.stop();
      }
      
      public function a_3014(iTotalSeconds:int = 300) : void
      {
         this.m_iTotalSeconds = iTotalSeconds;
         this.onTimerTick(null);
      }
      
      private function onTimerTick(e:TimerEvent) : void
      {
         if(this.m_iTotalSeconds <= 0)
         {
            return;
         }
         --this.m_iTotalSeconds;
         if(this.m_iTotalSeconds == 0)
         {
            a_1789.getInstance().dispatchEvent(new a_1778("TimeEnd"));
         }
         this.updateDisplay();
      }
      
      private function updateDisplay() : void
      {
         var vals:Array = null;
         if(this.m_iTotalSeconds > RED_SWITCH_THRESHOLD)
         {
            vals = [int(this.m_iTotalSeconds / 600),int(this.m_iTotalSeconds / 60 % 10),int(this.m_iTotalSeconds % 60 / 10),int(this.m_iTotalSeconds % 10)];
            this.updateDigits(this.greenDigits,this.greenLastValues,vals);
            this.m_stGreenSecondMovie.visible = true;
            this.m_stRedSecondMovie.visible = false;
            this.setVisibility(this.greenDigits,true);
            this.setVisibility(this.redDigits,false);
         }
         else
         {
            vals = [int(this.m_iTotalSeconds / 60),int(this.m_iTotalSeconds % 60 / 10),int(this.m_iTotalSeconds % 10)];
            this.updateDigits(this.redDigits,this.redLastValues,vals);
            this.m_stGreenSecondMovie.visible = false;
            this.m_stRedSecondMovie.visible = true;
            this.setVisibility(this.greenDigits,false);
            this.setVisibility(this.redDigits,true);
         }
      }
      
      private function updateDigits(digits:Array, lastValues:Array, vals:Array) : void
      {
         for(var i:int = 0; i < vals.length; i++)
         {
            if(lastValues[i] != vals[i])
            {
               digits[i].gotoAndStop(vals[i] + 1);
               lastValues[i] = vals[i];
            }
         }
      }
      
      private function setVisibility(digits:Array, visible:Boolean) : void
      {
         for(var i:int = 0; i < digits.length; i++)
         {
            digits[i].visible = visible;
         }
      }
   }
}

