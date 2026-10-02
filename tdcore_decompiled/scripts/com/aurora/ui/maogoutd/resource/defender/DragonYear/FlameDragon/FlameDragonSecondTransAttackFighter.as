package com.aurora.ui.maogoutd.resource.defender.DragonYear.FlameDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class FlameDragonSecondTransAttackFighter extends a_3953
   {
      
      public function FlameDragonSecondTransAttackFighter()
      {
         super();
         a_1095 = FlameDragonDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 8;
         a_1317 = 2;
         a_1333 = true;
         a_1311 = FlameDragonDefence.a_3965(a_1094) * 1.35;
         a_1309 = FlameDragonDefence.a_3966(m_iSkillDegree);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FlameDragonSecondTransAttackFighter) as FlameDragonSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameDragonSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = FlameDragonDefence.a_3965(a_1094) * 1.35;
         a_1309 = FlameDragonDefence.a_3966(m_iSkillDegree);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FlameDragonDefence.a_3964(m_iSkillDegree);
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
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(FlameDragonDefence.a_3430(a_1334) <= 0)
            {
               return false;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            stLastWaitShot = FlameDragonSecondShot.a_4344();
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
            a_1321 = iCurrentTime;
            a_1307 = 4;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            BattleFieldView.a_1032.play();
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 70,y + 56,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}

