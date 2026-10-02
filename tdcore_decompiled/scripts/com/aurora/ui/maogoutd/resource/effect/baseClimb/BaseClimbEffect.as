package com.aurora.ui.maogoutd.resource.effect.baseClimb
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class BaseClimbEffect extends a_4108
   {
      
      protected var m_fClimbHeightEx:EncrypNumber;
      
      protected var m_fClimbWidthEx:EncrypNumber;
      
      protected var m_iClimbTickEx:EncrypIntEx;
      
      protected var m_bIsNeedParabola:EncrypBooleanEx;
      
      private var m_bIsRunning:Boolean;
      
      public function BaseClimbEffect()
      {
         super();
         a_1279 = -0.5 * width;
         this.m_fClimbHeightEx = new EncrypNumber(6);
         this.m_iClimbTickEx = new EncrypIntEx(20);
         this.m_fClimbWidthEx = new EncrypNumber(1);
         this.m_bIsNeedParabola = new EncrypBooleanEx(false);
      }
      
      public function get ClimbHeight() : Number
      {
         return this.m_fClimbHeightEx.Value;
      }
      
      public function get ClimbWidth() : Number
      {
         return this.m_fClimbWidthEx.Value;
      }
      
      public function get ClimbTick() : int
      {
         return this.m_iClimbTickEx.Value;
      }
      
      public function get IsNeedParabola() : Boolean
      {
         return this.m_bIsNeedParabola.Value;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_bIsRunning = false;
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.m_bIsRunning = false;
         super.a_3940();
         return true;
      }
      
      public function a_3567(bIsNeed:Boolean = false) : void
      {
         if(!bIsNeed && this.m_bIsRunning)
         {
            return;
         }
         gotoAndStop(1);
         play();
         this.m_bIsRunning = true;
      }
      
      private function EndPlay() : void
      {
         stop();
         gotoAndStop(1);
         this.m_bIsRunning = false;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.EndPlay();
         }
      }
   }
}

