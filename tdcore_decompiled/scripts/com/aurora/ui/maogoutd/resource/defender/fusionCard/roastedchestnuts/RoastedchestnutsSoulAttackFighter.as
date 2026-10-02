package com.aurora.ui.maogoutd.resource.defender.fusionCard.roastedchestnuts
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RoastedchestnutsSoulAttackFighter extends a_3953
   {
      
      private var m_BoomPower:int;
      
      private var totalShotCount:int = 0;
      
      private var boomInterval:int = 0;
      
      public function RoastedchestnutsSoulAttackFighter()
      {
         super();
         a_1313 = true;
         a_1312 = 20;
         a_1095 = RoastedchestnutsDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = RoastedchestnutsDefence.SHOT_DELAY_TIMENUM;
         a_1337 = 13;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(RoastedchestnutsSoulAttackFighter) as RoastedchestnutsSoulAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoastedchestnutsSoulAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = RoastedchestnutsDefence.a_3966(m_iSkillDegree);
            a_1311 = 1.2 * (RoastedchestnutsDefence.a_3965(a_1094) + RoastedchestnutsDefence.GetCardPrimaryValueByGradeDegree(m_iGradeDegree) + RoastedchestnutsDefence.GetCardSoulValueByGradeDegree(m_iGradeDegree));
            this.m_BoomPower = RoastedchestnutsDefence.GetCardDeepValueByGradeDegree(m_iGradeDegree);
            if(a_1336)
            {
               a_1336.x -= 13;
            }
            this.totalShotCount = 0;
            this.boomInterval = RoastedchestnutsDefence.GetBoomIntervalByGradeDegree(m_iGradeDegree);
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            ++this.totalShotCount;
            a_1321 = iCurrentTime;
            a_1324.length = 0;
            stLastWaitShot = RoastedchestnutsSoulShot.a_4344();
            this.createShotForRow(a_1334.m_iYGridNo - 1);
            this.createShotForRow(a_1334.m_iYGridNo);
            this.createShotForRow(a_1334.m_iYGridNo + 1);
            a_1307 = 10;
            a_1275 = 0;
            a_1323 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            this.launchShot(a_1334.m_iYGridNo + 1);
            this.launchShot(a_1334.m_iYGridNo);
            this.launchShot(a_1334.m_iYGridNo - 1);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function createShotForRow(targetY:int) : void
      {
         var iXGridAdd:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var iCurXGridNo:int = 0;
         if(!stFieldGrid || targetY < 0 || targetY >= BattleFieldView.a_1012)
         {
            return;
         }
         if(a_1283)
         {
            iXGridAdd = -1;
         }
         else
         {
            iXGridAdd = 1;
         }
         var iTargetXGridNo:int = a_1334.m_iXGridNo;
         var bIsOccupy:Boolean = false;
         for(var iDis:int = 1; iDis <= 8; iDis += iXGridAdd)
         {
            iCurXGridNo = a_1334.m_iXGridNo + iDis;
            if(iCurXGridNo < 0 || iCurXGridNo >= BattleFieldView.a_1011)
            {
               break;
            }
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iCurXGridNo,targetY);
            if(Boolean(stTargetFieldGrid) && stTargetFieldGrid.m_isOccupy)
            {
               bIsOccupy = true;
            }
            iTargetXGridNo = iCurXGridNo;
            if(bIsOccupy)
            {
               break;
            }
         }
         var shot:a_4348 = RoastedchestnutsSoulShot.a_4344();
         shot.m_PTargetXGridNo = iTargetXGridNo;
         shot.m_PTargetYGridNo = targetY;
         shot.m_isSpecial = this.m_BoomPower;
         shot.m_iSuperShotType = (this.totalShotCount - 1) % this.boomInterval == 0 ? 1 : 0;
         a_1324.push(shot);
      }
      
      private function launchShot(targetY:int) : void
      {
         var numShotYpos:Number = NaN;
         var numShotXpos:Number = NaN;
         if(!stFieldGrid || targetY < 0 || targetY >= BattleFieldView.a_1012)
         {
            return;
         }
         var startField:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,targetY);
         var shot:a_4348 = a_1324.pop();
         if(Boolean(shot) && Boolean(startField))
         {
            numShotYpos = (targetY + 0.5) * a_3491.a_1081;
            numShotXpos = (stFieldGrid.m_iXGridNo + (a_1283 ? -0.5 : 0.5)) * a_3491.a_1081;
            if(targetY > stFieldGrid.m_iYGridNo)
            {
               numShotXpos += a_1283 ? 20 : -20;
            }
            shot.a_1797(0,a_1312,a_1311,numShotXpos,numShotYpos,startField.m_stCurrentBattbleFieldView,startField);
            startField.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,startField);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.5 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
   }
}

