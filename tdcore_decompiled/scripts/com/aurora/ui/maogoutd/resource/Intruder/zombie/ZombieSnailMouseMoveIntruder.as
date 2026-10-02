package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseAccelerationEffect;
   import com.aurora.ui.maogoutd.resource.effect.SnailLubricationAcceEffect;
   import flash.display.FrameLabel;
   
   public class ZombieSnailMouseMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private static const MAX_LIFE:int = 5400;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private static const SNAIL_LUBRICATION_TICK:int = 20 * 50;
      
      private static const EAT_LIFE_VALUE:int = 3000;
      
      private static const USE_SKILL_TICK:int = 14;
      
      private var m_iUseSkillTick:int;
      
      public function ZombieSnailMouseMoveIntruder()
      {
         super();
         BoomIsReduceLife = true;
         a_1272 = 0;
         a_1279 = -33;
      }
      
      public static function a_3926() : ZombieSnailMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(ZombieSnailMouseMoveIntruder) as ZombieSnailMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieSnailMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1377 = EAT_LIFE_VALUE;
         this.m_iUseSkillTick = 0;
         return true;
      }
      
      private function GotoAndStopFrame(iFrame:uint) : void
      {
         if(iFrame != a_1275)
         {
            a_1275 = iFrame;
            gotoAndStop((a_1276[iFrame] as FrameLabel).frame);
            a_3419();
         }
      }
      
      private function LifeIsZeroHandle() : void
      {
         this.GotoAndStopFrame(4);
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(MAX_INJURED_LIFE < a_1339)
         {
            if(this.m_iUseSkillTick > 0)
            {
               this.GotoAndStopFrame(2);
            }
            else
            {
               this.GotoAndStopFrame(0);
            }
         }
         else if(0 < a_1339)
         {
            if(this.m_iUseSkillTick > 0)
            {
               this.GotoAndStopFrame(3);
            }
            else
            {
               this.GotoAndStopFrame(1);
            }
         }
         else if(a_1339 <= 0)
         {
            this.LifeIsZeroHandle();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(a_1475 && HasTag(40009))
         {
            a_1475 = false;
            this.ResetMovieStatus();
         }
         a_1464 = HasTag(40009);
         if(this.m_iUseSkillTick > 0)
         {
            --this.m_iUseSkillTick;
            if(USE_SKILL_TICK - 6 == this.m_iUseSkillTick)
            {
               this.AddSnailLubricationEffect();
            }
            if(0 == this.m_iUseSkillTick)
            {
               this.ResetMovieStatus();
            }
         }
         return super.a_4216(iCurrentTime);
      }
      
      override protected function HasCanEatTarget() : Boolean
      {
         if(HasTag(40009))
         {
            return false;
         }
         return super.HasCanEatTarget();
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         var bIsXGridNoNotEqual:Boolean = Boolean(stNextFieldGrid.m_iInitialXGridNo != m_stCurrentFieldGrid.m_iInitialXGridNo);
         if(bIsXGridNoNotEqual)
         {
            this.m_iUseSkillTick = USE_SKILL_TICK;
            this.ResetMovieStatus();
         }
         super.ChangeFieldGrid(stNextFieldGrid);
         if(stNextFieldGrid.m_stBaseLander != null)
         {
            a_1474 = 20;
         }
      }
      
      private function AddSnailLubricationEffect() : void
      {
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         var iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo + (a_1283 ? -2 : 2);
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         if(null == stFieldGrid)
         {
            return;
         }
         var stAccelerationEffect:BaseAccelerationEffect = SnailLubricationAcceEffect.a_3926();
         stAccelerationEffect.a_1797(stFieldGrid,SNAIL_LUBRICATION_TICK);
         stFieldGrid.AddAcceleration(stAccelerationEffect);
      }
   }
}

