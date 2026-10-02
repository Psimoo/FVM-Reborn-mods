package com.aurora.ui.maogoutd.resource.Intruder.airCarrier
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import flash.display.FrameLabel;
   
   public class AirCarrierMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3510;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private static const SKILL_TICK:int = 52 * 2;
      
      private static const SKILL_DELAY_TICK:int = 38 * 2;
      
      private var m_bIsUsingSkill:Boolean;
      
      private var m_iSkillTick:int;
      
      private var m_iMoveTime:int;
      
      public function AirCarrierMouseMoveIntruder()
      {
         super();
         BoomIsReduceLife = true;
         a_1272 = 0;
         a_1467 = -36;
         m_IsAirElite = true;
      }
      
      public static function a_3926() : AirCarrierMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(AirCarrierMouseMoveIntruder) as AirCarrierMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AirCarrierMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         this.m_bIsUsingSkill = false;
         this.m_iMoveTime = int(Math.abs((2 + 1.5) * a_3491.a_1080 / a_1350));
         a_1465 = 3;
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
      
      private function LifeIsZeroHandle() : void
      {
         this.GotoAndStopFrame(8);
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var iIsInjured:int = 0;
         var iKeyFrame:int = 0;
         var iYGridNo:int = 0;
         if(a_1339 <= 0)
         {
            this.LifeIsZeroHandle();
         }
         else
         {
            iIsInjured = MAX_INJURED_LIFE < a_1339 ? 0 : 4;
            if(this.m_bIsUsingSkill)
            {
               if(SKILL_TICK == this.m_iSkillTick)
               {
                  iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  if(0 == iYGridNo)
                  {
                     iKeyFrame = 2;
                  }
                  else if(BattleFieldView.a_1012 - 1 == iYGridNo)
                  {
                     iKeyFrame = 3;
                  }
                  else
                  {
                     iKeyFrame = 1;
                  }
               }
               else
               {
                  iIsInjured = 0;
                  iKeyFrame = a_1275;
               }
            }
            else
            {
               iKeyFrame = 0;
            }
            iKeyFrame += iIsInjured;
            this.GotoAndStopFrame(iKeyFrame);
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
      
      private function IsRealeaseMouse() : Boolean
      {
         return Boolean(SKILL_TICK == this.m_iSkillTick + SKILL_DELAY_TICK);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid || a_1339 <= 0)
         {
            return false;
         }
         if(x > BattleFieldView.a_1013 + width || x <= -width)
         {
            a_3940();
            return false;
         }
         if(this.m_bIsUsingSkill)
         {
            if(this.m_iSkillTick > 0)
            {
               --this.m_iSkillTick;
               if(0 == this.m_iSkillTick)
               {
                  this.StopUseSkill();
               }
               else if(this.IsRealeaseMouse())
               {
                  this.RealeaseMouse();
               }
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
            if(this.m_iMoveTime > 0)
            {
               --this.m_iMoveTime;
               if(0 == this.m_iMoveTime)
               {
                  this.StartUseSkill();
               }
            }
         }
         return true;
      }
      
      private function StartUseSkill() : void
      {
         this.m_iSkillTick = SKILL_TICK;
         this.m_bIsUsingSkill = true;
         this.ResetMovieStatus();
      }
      
      private function StopUseSkill() : void
      {
         this.m_iSkillTick = 0;
         this.m_bIsUsingSkill = false;
         this.ResetMovieStatus();
         a_1350 *= -1;
      }
      
      private function RealeaseMouse() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         var iXGridNo:int = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var iYGridNoStart:int = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 1,0);
         var iYGridNoEnd:int = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var iYGridNo:int = iYGridNoStart; iYGridNo <= iYGridNoEnd; iYGridNo++)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(!stStartFieldGrid)
            {
               throw Error(toString() + "::RealeaseMouse->iXGridNo = " + iXGridNo + "  iYGridNo = " + iYGridNo);
            }
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8388760);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8388760).toString(16));
            }
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8388760;
            stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
      }
   }
}

