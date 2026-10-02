package com.aurora.ui.maogoutd.resource.defender.fusionCard.termiThreeShotGun
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TermiThreeShotGunDeepAttackFighter extends a_3953
   {
      
      private var totalShotCount:int = 0;
      
      private var shotIndex:int = 0;
      
      public function TermiThreeShotGunDeepAttackFighter()
      {
         super();
         a_1095 = TermiThreeShotGunDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1337 = 0;
         a_1310 = 8;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(TermiThreeShotGunDeepAttackFighter) as TermiThreeShotGunDeepAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TermiThreeShotGunDeepAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = TermiThreeShotGunDefence.a_3965(a_1094) + TermiThreeShotGunDefence.GetCardDeepValueByGradeDegree(m_iGradeDegree);
            a_1309 = TermiThreeShotGunDefence.a_3966(m_iSkillDegree);
            this.totalShotCount = this.shotIndex = 0;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TermiThreeShotGunDefence.a_3964(m_iSkillDegree);
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
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            if(a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            ++this.totalShotCount;
            this.shotIndex = 0;
            a_1324.length = 0;
            a_1324.length = 0;
            for(j = 0; j < 3; j++)
            {
               this.pushShot();
               if(a_1334.m_iYGridNo > 0)
               {
                  this.pushShot();
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.pushShot();
               }
            }
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            this.lauchShot(1,45);
            this.lauchShot(-1,55);
            this.lauchShot(0,55);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function lauchShot(direction:int, baseX:int) : void
      {
         var id:int = 0;
         if(direction == 1 && a_1334.m_iYGridNo >= BattleFieldView.a_1012 - 1)
         {
            return;
         }
         if(direction == -1 && a_1334.m_iYGridNo <= 0)
         {
            return;
         }
         var stStartField:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + direction);
         var numShotXpos:Number = a_1283 ? -baseX : baseX;
         var numShotYpos:Number = direction == 1 ? 28 : 48;
         var stShot:a_4348 = a_1324.pop();
         if(stShot)
         {
            ++this.shotIndex;
            id = m_iDefenseGlobalID << 14 | this.totalShotCount << 4 | this.shotIndex;
            stShot.iShotGroupIndex = direction;
            stShot.m_isSpecial = TermiThreeShotGunDefence.GetCardPrimaryValueByGradeDegree(m_iGradeDegree);
            stShot.a_1797(id,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,stStartField);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stShot,BattleLayerDefine.SHOT_TYPE,stStartField);
         }
      }
      
      private function pushShot() : void
      {
         var stShot:a_4348 = TermiThreeShotGunDeepShot.a_4344();
         a_1324.push(stShot);
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

