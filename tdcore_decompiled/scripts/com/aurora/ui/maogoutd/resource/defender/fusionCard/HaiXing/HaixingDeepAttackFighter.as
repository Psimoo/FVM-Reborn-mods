package com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing.shot.HaixingFusionCommonShot;
   
   public class HaixingDeepAttackFighter extends a_3953
   {
      
      private var m_SputterHurtRate:Number = 0;
      
      public function HaixingDeepAttackFighter()
      {
         super();
         a_1095 = HaixingFusionDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = HaixingFusionDefence.SHOT_DELAY_TIMENUM;
         a_1317 = HaixingFusionDefence.CONTINUE_SHOT_INTERVAL;
         a_1333 = true;
         a_1337 = -2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(HaixingDeepAttackFighter,HaixingDeepAttackFighterMovie) as HaixingDeepAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.m_SputterHurtRate = HaixingFusionDefence.GetCardDeepValueByGradeDegree(m_iGradeDegree);
            a_1309 = HaixingFusionDefence.a_3966(m_iSkillDegree);
            a_1311 = HaixingFusionDefence.a_3965(a_1094) + HaixingFusionDefence.GetCardPrimaryValueByGradeDegree(m_iGradeDegree);
            if(a_1336)
            {
               a_1336.x += 2;
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return HaixingFusionDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(HaixingFusionDefence.GetFieldIntruderNumForFiveDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop(20);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 3)
         {
            if(a_1323 < 2)
            {
               this.FireFiveDirectionShots();
            }
            else if(a_1334.m_iXGridNo > 0)
            {
               this.AddMyShot(1);
            }
            ++a_1323;
         }
         return true;
      }
      
      private function FireFiveDirectionShots() : void
      {
         if(a_1334.m_iXGridNo > 0)
         {
            this.AddMyShot(1);
         }
         if(a_1334.m_iYGridNo > 0)
         {
            this.AddMyShot(2);
         }
         if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
         {
            this.AddMyShot(3);
         }
         if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
         {
            this.AddMyShot(4);
         }
         if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
         {
            this.AddMyShot(5);
         }
      }
      
      private function AddMyShot(iDirection:int) : void
      {
         var stLastWaitShot:HaixingFusionCommonShot = HaixingFusionCommonShot.a_4344(1);
         if(null == stLastWaitShot || !stFieldGrid)
         {
            return;
         }
         var arrShotPos:Array = [];
         stLastWaitShot.m_isSpecial = iDirection;
         var numShotXpos:Number = this.a_3955();
         if(a_1283)
         {
            numShotXpos = -numShotXpos;
         }
         var numCenterX:Number = x + numShotXpos;
         var numCenterY:Number = y + this.a_3956();
         if(!HaixingFusionDefence.GetShotSpawnPos(numCenterX,numCenterY,iDirection,arrShotPos))
         {
            return;
         }
         stLastWaitShot.iShotSequenceNum = a_1323;
         stLastWaitShot.m_SputterHurtRate = this.m_SputterHurtRate;
         stLastWaitShot.a_1797(0,a_1312,a_1311,arrShotPos[0],arrShotPos[1],a_1334.m_stCurrentBattbleFieldView,a_1334);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 42;
      }
      
      override protected function a_3956() : Number
      {
         return 57;
      }
   }
}

