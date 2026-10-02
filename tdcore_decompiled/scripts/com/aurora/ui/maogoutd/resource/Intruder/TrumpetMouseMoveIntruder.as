package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class TrumpetMouseMoveIntruder extends a_4206
   {
      
      private static var m_dict_skill_intruder:Dictionary;
      
      private static const MAX_LIFE:int = 560;
      
      private static const MAX_INJURED_LIFE:int = 300;
      
      private static const USE_SKILL_TIME:int = 38;
      
      private var m_bIsUsedSkillByGrid2:Boolean;
      
      private var m_bIsUsedSkillByObstacle:Boolean;
      
      private var m_bIsUseingSkill:Boolean;
      
      private var m_iMoveTime:int;
      
      private var m_iUseSkillTime:int;
      
      private var m_bIsUseSkillByGrid2:Boolean;
      
      public function TrumpetMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TrumpetMouseMoveIntruder) as TrumpetMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TrumpetMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1272 = 0;
         a_1279 = -width * 0.4;
         this.m_bIsUsedSkillByGrid2 = false;
         this.m_bIsUsedSkillByObstacle = false;
         this.m_bIsUseingSkill = false;
         this.m_iMoveTime = Math.abs(int(1.8 * a_3491.a_1080 / a_1350));
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
         this.GotoAndStopFrame(6);
         if(m_stCurrentFieldGrid != null)
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
            if(this.m_bIsUseingSkill)
            {
               this.GotoAndStopFrame(2);
            }
            else if(a_1475)
            {
               this.GotoAndStopFrame(4);
            }
            else
            {
               this.GotoAndStopFrame(0);
            }
         }
         else if(0 < a_1339)
         {
            if(this.m_bIsUseingSkill)
            {
               this.GotoAndStopFrame(3);
            }
            else if(a_1475)
            {
               this.GotoAndStopFrame(5);
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
         super.a_3969(iRduceLifeValue);
         return this.ResetMovieStatus();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         var numOrigXPos:Number = x;
         if(this.m_bIsUsedSkillByGrid2 && this.m_bIsUsedSkillByObstacle)
         {
            super.a_4216(iCurrentTime);
            this.UpdatePosY(numOrigXPos);
            return true;
         }
         if(this.m_bIsUseingSkill)
         {
            this.UseSkill();
            --this.m_iUseSkillTime;
            if(this.m_iUseSkillTime <= 0)
            {
               this.StopUseSkill();
            }
         }
         else
         {
            if(null == m_stCurrentFieldGrid)
            {
               return false;
            }
            if(!this.m_bIsUseingSkill && !isEatingDefense)
            {
               --this.m_iMoveTime;
            }
            if(!this.m_bIsUsedSkillByGrid2 && 0 == this.m_iMoveTime)
            {
               this.StartUseSkill(true);
            }
            else if(!this.m_bIsUsedSkillByObstacle && m_stCurrentFieldGrid.a_3492())
            {
               this.StartUseSkill(false);
            }
            else
            {
               super.a_4216(iCurrentTime);
               this.UpdatePosY(numOrigXPos);
            }
         }
         return true;
      }
      
      private function StartUseSkill(bIsUseSkillByGrid2:Boolean) : void
      {
         this.m_bIsUseSkillByGrid2 = bIsUseSkillByGrid2;
         this.m_bIsUseingSkill = true;
         this.m_iUseSkillTime = USE_SKILL_TIME;
         this.ResetMovieStatus();
         this.UseSkill();
      }
      
      private function IsCanUseSkill(stMoveIntruder:a_4206) : Boolean
      {
         if(null == m_dict_skill_intruder)
         {
            m_dict_skill_intruder = new Dictionary();
            m_dict_skill_intruder[8388609] = true;
            m_dict_skill_intruder[8388610] = true;
            m_dict_skill_intruder[8388611] = true;
            m_dict_skill_intruder[8388613] = true;
            m_dict_skill_intruder[8388620] = true;
            m_dict_skill_intruder[8388657] = true;
            m_dict_skill_intruder[8388658] = true;
            m_dict_skill_intruder[8388659] = true;
            m_dict_skill_intruder[8388668] = true;
            m_dict_skill_intruder[8388752] = true;
            m_dict_skill_intruder[8388753] = true;
            m_dict_skill_intruder[8388754] = true;
            m_dict_skill_intruder[8388755] = true;
            m_dict_skill_intruder[8388756] = true;
         }
         if(m_stCurrentFieldGrid.m_iYGridNo != stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo && stMoveIntruder.iLifeValue > 0 && true == m_dict_skill_intruder[stMoveIntruder.m_stMoveIntruderTypeID] && 1 != stMoveIntruder.iSpaceState && !stMoveIntruder.isEatingDefense && !stMoveIntruder.isCannotSeeByFighter && !stMoveIntruder.m_isRemovedFromBattaleField)
         {
            return true;
         }
         return false;
      }
      
      private function UseSkill() : void
      {
         var stCurBattleFieldView:BattleFieldView = null;
         var iCurYGridNo:int = 0;
         var iMoveIntruderCnt:* = 0;
         var stMoveIntruder:a_4206 = null;
         var iIntruderYGridNo:int = 0;
         var fYPosition:Number = NaN;
         if(null != m_stCurrentFieldGrid)
         {
            stCurBattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
            iCurYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            iMoveIntruderCnt = 10;
            if(null == stCurBattleFieldView.m_arrBaseMoveIntruderVector)
            {
               return;
            }
            for each(stMoveIntruder in stCurBattleFieldView.m_arrBaseMoveIntruderVector.slice())
            {
               if(null != stMoveIntruder.m_stCurrentFieldGrid && this.IsCanUseSkill(stMoveIntruder))
               {
                  iIntruderYGridNo = stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
                  fYPosition = stMoveIntruder.y + (iCurYGridNo - iIntruderYGridNo) * a_3491.a_1081;
                  stMoveIntruder.SetMoveToYPosition(fYPosition,iCurYGridNo);
                  iMoveIntruderCnt--;
                  if(iMoveIntruderCnt == 0)
                  {
                     break;
                  }
               }
            }
         }
      }
      
      private function StopUseSkill() : void
      {
         if(this.m_bIsUseSkillByGrid2)
         {
            this.m_bIsUsedSkillByGrid2 = true;
         }
         else
         {
            this.m_bIsUsedSkillByObstacle = true;
         }
         this.m_bIsUseingSkill = false;
         this.m_iUseSkillTime = -1;
         this.m_iMoveTime = -1;
         this.ResetMovieStatus();
      }
      
      private function UpdatePosY(numOrigXPos:Number) : void
      {
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
      }
   }
}

