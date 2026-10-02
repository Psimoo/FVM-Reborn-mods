package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.DrinkMachine
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BaseFrozenEffect extends a_4108
   {
      
      public var m_stTargetField:a_3491;
      
      private var m_iStartTime:int;
      
      private var m_iSleepTime:int;
      
      public function BaseFrozenEffect()
      {
         super();
      }
      
      public static function a_3926() : BaseFrozenEffect
      {
         return PoolManager.getInstance().CheckOutOne(BaseFrozenEffect) as BaseFrozenEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaseFrozenEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
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
         if(a_1273 == a_1274)
         {
            this.a_3940();
            return;
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.m_iSleepTime * 10)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
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

