package com.aurora.ui.maogoutd.resource.defender.HorseYear.yunxiama
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.yunxiama.shot.YunXiaMaCommonShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class YunXiaMaBaseAttackFighter extends a_3953
   {
      
      private static const SHOT_POS_OFFSET:Array = [[50,-8],[50,56],[50,120]];
      
      private static const SHOTS_PER_ROW:int = 1;
      
      private var m_iContinueShotTimes1:int = 0;
      
      private var m_iContinueShotTimes2:int = 0;
      
      private var m_iContinueShotTimes3:int = 0;
      
      private var m_iGroupCount:int = 0;
      
      public function YunXiaMaBaseAttackFighter()
      {
         super();
         a_1313 = true;
         a_1095 = YunXiaMaDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(YunXiaMaBaseAttackFighter,YunXiaMaBaseAttackFighterMovie) as YunXiaMaBaseAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = YunXiaMaDefine.a_3966(m_iSkillDegree);
            a_1311 = YunXiaMaDefine.a_3965(a_1094);
            this.m_iContinueShotTimes1 = this.m_iContinueShotTimes2 = this.m_iContinueShotTimes3 = 0;
            this.m_iGroupCount = 0;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return YunXiaMaDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iValue:int) : Boolean
      {
         super.a_3969(iValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            this.m_iContinueShotTimes1 = this.m_iContinueShotTimes2 = this.m_iContinueShotTimes3 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            ++this.m_iGroupCount;
         }
         var elapsed:int = iCurrentTime - a_1321;
         if(elapsed == YunXiaMaDefine.SHOT_DELAY_TIMENUM1 + a_1317 * this.m_iContinueShotTimes1 && this.m_iContinueShotTimes1 < SHOTS_PER_ROW)
         {
            if(a_1334.m_iYGridNo > 0)
            {
               this.LaunchNextShot(0);
            }
            ++this.m_iContinueShotTimes1;
         }
         if(elapsed == YunXiaMaDefine.SHOT_DELAY_TIMENUM2 + a_1317 * this.m_iContinueShotTimes2 && this.m_iContinueShotTimes2 < SHOTS_PER_ROW)
         {
            this.LaunchNextShot(1);
            ++this.m_iContinueShotTimes2;
         }
         if(elapsed == YunXiaMaDefine.SHOT_DELAY_TIMENUM3 + a_1317 * this.m_iContinueShotTimes3 && this.m_iContinueShotTimes3 < SHOTS_PER_ROW)
         {
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               this.LaunchNextShot(2);
            }
            ++this.m_iContinueShotTimes3;
         }
         return true;
      }
      
      private function LaunchNextShot(shotIndex:int) : void
      {
         var targetYGrid:int = a_1334.m_iYGridNo + shotIndex - 1;
         var stStartField:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,targetYGrid);
         if(stStartField == null)
         {
            return;
         }
         var stLastWaitShot:YunXiaMaCommonShot = YunXiaMaCommonShot.a_4344(0) as YunXiaMaCommonShot;
         if(stLastWaitShot == null)
         {
            return;
         }
         var posOffset:Array = SHOT_POS_OFFSET[shotIndex] as Array;
         var dx:Number = Number(posOffset[0]);
         if(a_1283)
         {
            dx = -dx;
         }
         stLastWaitShot.m_isSpecial = 1;
         stLastWaitShot.m_iSuperShotType = this.m_iGroupCount % 4 == 0 ? 1 : 0;
         stLastWaitShot.a_1797(0,a_1312,a_1311,x + dx,y + posOffset[1],a_1334.m_stCurrentBattbleFieldView,stStartField);
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
   }
}

