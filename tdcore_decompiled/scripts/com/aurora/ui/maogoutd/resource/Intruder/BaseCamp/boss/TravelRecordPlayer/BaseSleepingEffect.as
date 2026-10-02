package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.TravelRecordPlayer
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BaseSleepingEffect extends a_4108
   {
      
      public var m_stTargetField:a_3491;
      
      private var m_iStartTime:int;
      
      private var m_iSleepTime:int;
      
      public function BaseSleepingEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : BaseSleepingEffect
      {
         return PoolManager.getInstance().CheckOutOne(BaseSleepingEffect) as BaseSleepingEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaseSleepingEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.m_iSleepTime * 10)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.m_stTargetField != null && Boolean(this.m_stTargetField.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            this.m_stTargetField.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         if(this.m_stTargetField != null && this.m_stTargetField.m_stAttackFighter != null)
         {
            this.m_stTargetField.m_stAttackFighter.m_BaseEffect = null;
            this.m_stTargetField.m_stAttackFighter.m_isSleep = false;
            this.m_stTargetField = null;
         }
         return true;
      }
   }
}

