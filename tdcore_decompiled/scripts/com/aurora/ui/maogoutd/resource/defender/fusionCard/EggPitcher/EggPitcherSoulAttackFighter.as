package com.aurora.ui.maogoutd.resource.defender.fusionCard.EggPitcher
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class EggPitcherSoulAttackFighter extends a_3953
   {
      
      public function EggPitcherSoulAttackFighter()
      {
         super();
         a_1309 = 60 - EggPitcherDefence.a_3966(m_iSkillDegree);
         a_1311 = EggPitcherDefence.a_3965(a_1094) + EggPitcherDefence.GetCardGradeDegree1EffectValue(m_iGradeDegree);
         a_1312 = 15;
         a_1095 = 250;
         a_1304 = b_183.b_187;
         a_1310 = 9;
         a_1337 = -15;
         a_1312 = 20;
         a_1317 = 2;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(EggPitcherSoulAttackFighter) as EggPitcherSoulAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggPitcherSoulAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 8;
         super.a_1797(stFieldGrid);
         a_1311 = EggPitcherDefence.a_3965(a_1094) + EggPitcherDefence.GetCardGradeDegree1EffectValue(m_iGradeDegree);
         a_1309 = 60 - EggPitcherDefence.a_3966(m_iSkillDegree);
         if(m_bServerIssued)
         {
            if(a_1336)
            {
               a_1336.x += 6;
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:EggPitcherSoulShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324 = [];
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 2)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            this.AddShot(-1);
            this.AddShot(0);
            this.AddShot(1);
            ++a_1323;
         }
         return true;
      }
      
      private function AddShot(iYOffset:int) : void
      {
         var stLastWaitShot:EggPitcherSoulShot = null;
         var stStartField:a_3491 = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo + iYOffset);
         if(stStartField != null)
         {
            stLastWaitShot = EggPitcherSoulShot.a_4344();
            stLastWaitShot.InitData(EggPitcherDefence.GetCardGradeDegree4EffectValue(m_iGradeDegree),EggPitcherDefence.GetCardGradeDegree3EffectValue(m_iGradeDegree),EggPitcherDefence.GetCardGradeDegree2EffectValue(m_iGradeDegree));
            if(stLastWaitShot != null)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 63,y + iYOffset * 64,a_1334.m_stCurrentBattbleFieldView,stStartField);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
      
      private function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo - 1);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo + 1);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

