package com.aurora.ui.maogoutd.resource.defender.PigYear.FlyFishMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class FlyFishMeowBaseAttackFighter extends a_3953
   {
      
      public function FlyFishMeowBaseAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = FlyFishMeowDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1337 = -5;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FlyFishMeowBaseAttackFighter) as FlyFishMeowBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyFishMeowBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 10;
         super.a_1797(stFieldGrid);
         a_1311 = FlyFishMeowDefence.a_3965(a_1094);
         a_1309 = FlyFishMeowDefence.a_3966(m_iSkillDegree);
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
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(FlyFishMeowDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            a_1323 = 1;
            for(j = 0; j < 1; j++)
            {
               stLastWaitShot = FlyFishMeowBaseShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos - 32,y + this.a_3956() + 14,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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

