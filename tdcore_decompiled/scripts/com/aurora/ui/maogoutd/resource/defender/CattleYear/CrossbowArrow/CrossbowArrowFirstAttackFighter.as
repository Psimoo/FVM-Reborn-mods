package com.aurora.ui.maogoutd.resource.defender.CattleYear.CrossbowArrow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CrossbowArrowFirstAttackFighter extends a_3953
   {
      
      public function CrossbowArrowFirstAttackFighter()
      {
         super();
         a_1095 = CrossbowArrowDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 3;
         a_1337 = 0;
         a_1333 = true;
         a_1309 = CrossbowArrowDefence.a_3966(m_iSkillDegree);
         a_1311 = CrossbowArrowDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CrossbowArrowFirstAttackFighter) as CrossbowArrowFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrossbowArrowFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(a_1336)
         {
            a_1336.y += 13;
            a_1336.x += 7;
            a_1336.scaleX = a_1336.scaleY = 1.25;
         }
         a_1309 = CrossbowArrowDefence.a_3966(m_iSkillDegree);
         a_1311 = CrossbowArrowDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CrossbowArrowDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var k:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            for(k = 0; k < 2; k++)
            {
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = CrossbowArrowFirstShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = CrossbowArrowFirstShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
            }
            if(a_1334.m_iXGridNo > 0)
            {
               stLastWaitShot = CrossbowArrowFirstShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = CrossbowArrowFirstShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1307 = 1;
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
            if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 80,y - 31,a_1334.m_stCurrentBattbleFieldView,stStartField);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 80,y + 99,a_1334.m_stCurrentBattbleFieldView,stStartField);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo);
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 80,y + 34,a_1334.m_stCurrentBattbleFieldView,stStartField);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iXGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo);
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,-a_1312,a_1311,x - 10,y + 34,a_1334.m_stCurrentBattbleFieldView,stStartField);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
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
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

