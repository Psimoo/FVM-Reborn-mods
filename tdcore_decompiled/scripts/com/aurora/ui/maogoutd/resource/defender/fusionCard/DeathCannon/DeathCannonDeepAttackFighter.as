package com.aurora.ui.maogoutd.resource.defender.fusionCard.DeathCannon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DeathCannonDeepAttackFighter extends a_3953
   {
      
      public function DeathCannonDeepAttackFighter()
      {
         super();
         a_1095 = DeathCannonDefence.DEFENSE_PRICE;
         a_1337 = 0;
         a_1310 = 12;
         a_1313 = true;
         a_1317 = 5;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DeathCannonDeepAttackFighter,DeathCannonDeepAttackFighterMovie) as DeathCannonDeepAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = 900 + DeathCannonDefence.GetCardPrimaryValueByGradeDegree(m_iGradeDegree) + DeathCannonDefence.GetCardDeepValueByGradeDegree(m_iGradeDegree);
         a_1309 = 700 - DeathCannonDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DeathCannonDefence.a_3964(m_iSkillDegree);
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
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1324.length = 0;
            for(i = 0; i < 2; i++)
            {
               stLastWaitShot = DeathCannonDeepShot.a_4344();
               DeathCannonDeepShot(stLastWaitShot).a_1598 = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][BattleFieldView.a_1011 - 2];
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = 39;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 11,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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

