package com.aurora.ui.maogoutd.resource.defender.fusionCard.CoffeeCup
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CoffeeCupSoulAttackFighter extends a_3953
   {
      
      private var shotOffset:Array = [[47,22],[30,36],[64,51]];
      
      public function CoffeeCupSoulAttackFighter()
      {
         super();
         a_1095 = CoffeeCupDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1337 = 0;
         a_1310 = 8;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeCupSoulAttackFighter) as CoffeeCupSoulAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeCupSoulAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = CoffeeCupDefence.a_3965(a_1094) + CoffeeCupDefence.GetCardPrimaryValueByGradeDegree(m_iGradeDegree) + CoffeeCupDefence.GetCardDeepValueByGradeDegree(m_iGradeDegree) + CoffeeCupDefence.GetCardSoulValueByGradeDegree(m_iGradeDegree);
            a_1309 = CoffeeCupDefence.a_3966(m_iSkillDegree);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CoffeeCupDefence.a_3964(m_iSkillDegree);
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
         var i:int = 0;
         var stStartField:a_3491 = null;
         var k:int = 0;
         var j:int = 0;
         var i3:* = 0;
         var i2:int = 0;
         var numShotXpos:Number = NaN;
         var numShotYpos:Number = NaN;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(CoffeeCupDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            for(k = 0; k < 3; k++)
            {
               for(j = 0; j < 3; j++)
               {
                  stLastWaitShot = CoffeeCupSoulShot.a_4344();
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            for(i3 = 2; i3 >= 0; i3--)
            {
               for(i2 = 0; i2 < 3; i2++)
               {
                  numShotXpos = this.shotOffset[i2][0] - i3 * 10;
                  if(a_1283)
                  {
                     numShotXpos = -numShotXpos;
                  }
                  numShotYpos = Number(this.shotOffset[i2][1]);
                  stLastWaitShot = a_1324.pop();
                  if(stLastWaitShot)
                  {
                     stLastWaitShot.alpha = 1 - 0.35 * i3;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
                     a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
                  }
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
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

