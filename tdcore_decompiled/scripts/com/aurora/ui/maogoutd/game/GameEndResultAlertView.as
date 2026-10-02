package com.aurora.ui.maogoutd.game
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GameEndResultAlertView extends Sprite
   {
      
      public var m_stWinAlert:MovieClip;
      
      public var m_stLoaseAlert:MovieClip;
      
      public var m_stChallengeFailedAlert:MovieClip;
      
      public var m_stChallengeOverAlert:MovieClip;
      
      private var a_1109:Timer;
      
      public function GameEndResultAlertView()
      {
         super();
         this.a_1109 = new Timer(100);
         this.m_stWinAlert.gotoAndStop(1);
         this.m_stLoaseAlert.gotoAndStop(1);
         this.m_stChallengeFailedAlert.gotoAndStop(1);
         this.m_stChallengeOverAlert.gotoAndStop(1);
      }
      
      public function a_3521() : void
      {
         this.m_stLoaseAlert.visible = false;
         this.m_stWinAlert.visible = true;
         this.m_stChallengeFailedAlert.visible = false;
         this.m_stChallengeOverAlert.visible = false;
         this.m_stWinAlert.gotoAndStop(1);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_3525);
         this.a_1109.start();
      }
      
      public function a_3522() : void
      {
         this.m_stLoaseAlert.visible = true;
         this.m_stWinAlert.visible = false;
         this.m_stChallengeFailedAlert.visible = false;
         this.m_stChallengeOverAlert.visible = false;
         this.m_stLoaseAlert.gotoAndStop(1);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_3526);
         this.a_1109.start();
      }
      
      public function a_3523() : void
      {
         this.m_stLoaseAlert.visible = false;
         this.m_stWinAlert.visible = false;
         this.m_stChallengeFailedAlert.visible = true;
         this.m_stChallengeOverAlert.visible = false;
         this.m_stChallengeFailedAlert.gotoAndStop(1);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_3527);
         this.a_1109.start();
      }
      
      public function a_3524() : void
      {
         this.m_stLoaseAlert.visible = false;
         this.m_stWinAlert.visible = false;
         this.m_stChallengeFailedAlert.visible = false;
         this.m_stChallengeOverAlert.visible = true;
         this.m_stChallengeOverAlert.gotoAndStop(1);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_3528);
         this.a_1109.start();
      }
      
      private function a_3525(a_4730:Event) : void
      {
         if(this.m_stWinAlert.currentFrame == this.m_stWinAlert.totalFrames)
         {
            this.m_stWinAlert.removeEventListener(TimerEvent.TIMER,this.a_3525);
            this.a_1109.stop();
            return;
         }
         this.m_stWinAlert.nextFrame();
      }
      
      private function a_3526(a_4730:Event) : void
      {
         if(this.m_stLoaseAlert.currentFrame == this.m_stLoaseAlert.totalFrames)
         {
            this.m_stLoaseAlert.removeEventListener(TimerEvent.TIMER,this.a_3526);
            this.a_1109.stop();
            return;
         }
         this.m_stLoaseAlert.nextFrame();
      }
      
      private function a_3527(a_4730:Event) : void
      {
         if(this.m_stChallengeFailedAlert.currentFrame == this.m_stChallengeFailedAlert.totalFrames)
         {
            this.m_stChallengeFailedAlert.removeEventListener(TimerEvent.TIMER,this.a_3527);
            this.a_1109.stop();
            return;
         }
         this.m_stChallengeFailedAlert.nextFrame();
      }
      
      private function a_3528(a_4730:Event) : void
      {
         if(this.m_stChallengeOverAlert.currentFrame == this.m_stChallengeOverAlert.totalFrames)
         {
            this.m_stChallengeOverAlert.removeEventListener(TimerEvent.TIMER,this.a_3528);
            this.a_1109.stop();
            return;
         }
         this.m_stChallengeOverAlert.nextFrame();
      }
   }
}

