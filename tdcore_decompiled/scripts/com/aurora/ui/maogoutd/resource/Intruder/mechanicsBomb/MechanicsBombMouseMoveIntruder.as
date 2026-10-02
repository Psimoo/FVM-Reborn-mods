package com.aurora.ui.maogoutd.resource.Intruder.mechanicsBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.mechanicsBomb.MechanicsBombShot;
   import flash.display.FrameLabel;
   
   public class MechanicsBombMouseMoveIntruder extends a_4206
   {
      
      private static const MOVE_SPEED:Number = 60 / (6 * 20);
      
      private static const MAX_LIFE:int = 2340;
      
      private static const MAX_MOUSE_DOWN_LIFE:int = 0.6 * MAX_LIFE;
      
      private static const MAX_INJURED_LIFE:int = MAX_MOUSE_DOWN_LIFE / 2;
      
      private static const USE_SKILL_START_TICK:int = 16 * 20;
      
      private static const USE_SKILL_INTERNAL_TICK:int = 12 * 20;
      
      private static const USE_SKILL_CONTINUE_TICK:int = 14;
      
      private static const MOUSE_DROP_DOWN_TICK:int = 14;
      
      private var m_iUseSkillContinueTick:int;
      
      private var m_iLastUseSkillTick:int;
      
      private var m_iMouseDropDownTick:int;
      
      public function MechanicsBombMouseMoveIntruder()
      {
         super();
         BoomIsReduceLife = true;
         a_1272 = 0;
         a_1279 = -0.3 * width;
         a_1467 = -20;
      }
      
      public static function a_3926() : MechanicsBombMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(MechanicsBombMouseMoveIntruder) as MechanicsBombMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MechanicsBombMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = MOVE_SPEED;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1465 = 3;
         a_1339 = MAX_LIFE;
         this.m_iUseSkillContinueTick = 0;
         this.m_iMouseDropDownTick = 0;
         this.m_iLastUseSkillTick = 0;
         a_1464 = true;
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
      
      private function LifeIsZeroHandle() : int
      {
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
         return 7;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var iFrameID:int = -1;
         if(a_1339 <= 0)
         {
            iFrameID = this.LifeIsZeroHandle();
         }
         else if(this.m_iMouseDropDownTick > 0)
         {
            iFrameID = 2;
         }
         else if(3 == a_1465)
         {
            if(this.m_iUseSkillContinueTick > 0)
            {
               iFrameID = 1;
            }
            else
            {
               iFrameID = 0;
            }
         }
         else if(MAX_INJURED_LIFE <= a_1339)
         {
            if(!a_1475)
            {
               iFrameID = 3;
            }
            else
            {
               iFrameID = 5;
            }
         }
         else if(!a_1475)
         {
            iFrameID = 4;
         }
         else
         {
            iFrameID = 6;
         }
         this.GotoAndStopFrame(iFrameID);
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(0 == this.m_iLastUseSkillTick)
         {
            this.m_iLastUseSkillTick = iCurrentTime - USE_SKILL_INTERNAL_TICK + USE_SKILL_START_TICK;
         }
         if(this.m_iUseSkillContinueTick > 0)
         {
            --this.m_iUseSkillContinueTick;
            if(0 == this.m_iUseSkillContinueTick)
            {
               this.ResetMovieStatus();
            }
            return true;
         }
         if(this.m_iMouseDropDownTick > 0)
         {
            --this.m_iMouseDropDownTick;
            if(0 == this.m_iMouseDropDownTick)
            {
               a_1464 = false;
               a_1465 = 0;
               this.ResetMovieStatus();
            }
            return true;
         }
         if(3 == a_1465 && a_1339 < MAX_MOUSE_DOWN_LIFE)
         {
            this.m_iMouseDropDownTick = MOUSE_DROP_DOWN_TICK;
            this.ResetMovieStatus();
         }
         else
         {
            if(!this.CheckIsUseSkill(iCurrentTime))
            {
               return super.a_4216(iCurrentTime);
            }
            this.m_iUseSkillContinueTick = USE_SKILL_CONTINUE_TICK;
            this.ResetMovieStatus();
            this.DropDownBomb(iCurrentTime);
         }
         return true;
      }
      
      private function CheckIsUseSkill(iCurrentTime:int) : Boolean
      {
         return 3 == a_1465 && iCurrentTime >= this.m_iLastUseSkillTick + USE_SKILL_INTERNAL_TICK;
      }
      
      private function DropDownBomb(iCurrentTime:int) : void
      {
         this.m_iLastUseSkillTick = iCurrentTime;
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid;
         var stBaseShot:a_4348 = MechanicsBombShot.a_4344();
         if(!stBaseShot)
         {
            return;
         }
         stBaseShot.a_1797(0,0,a_1377,x - 12,y + 65,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
         stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.SHOT_TYPE);
      }
   }
}

