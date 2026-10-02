package com.aurora.ui.maogoutd.resource.defender.PigYear.riceFlowerMachine
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public dynamic class RiceFlowerMachineSecondDefence extends a_3953
   {
      
      private static var m_iAdditionHurt:Number = 1.3;
      
      public function RiceFlowerMachineSecondDefence()
      {
         super();
         a_1335 = 65552;
         a_1095 = RiceFlowerMachineDefence.DEFENSE_PRICE;
         a_1338 = 10;
         a_1337 = 5;
         a_1310 = 8;
         a_1317 = 2;
         a_1333 = true;
         a_1339 = 6;
         a_1309 = RiceFlowerMachineDefence.a_3966(m_iSkillDegree);
         a_1311 = int(RiceFlowerMachineDefence.a_3965(a_1094) * m_iAdditionHurt);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(RiceFlowerMachineSecondDefence) as RiceFlowerMachineSecondDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return RiceFlowerMachineSecondDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = RiceFlowerMachineDefence.a_3966(m_iSkillDegree);
         a_1311 = int(RiceFlowerMachineDefence.a_3965(a_1094) * m_iAdditionHurt);
         a_1310 = m_iSkillDegree >= 7 ? 6 : 8;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return RiceFlowerMachineDefence.a_3964(m_iSkillDegree);
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
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            stLastWaitShot = RiceFlowerMachineShot.a_4344();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 0;
               a_1324.push(stLastWaitShot);
               for(i = 0; i < 5; i++)
               {
                  stLastWaitShot = RiceFlowerMachineShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               a_1307 = 12;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 90,y + 30,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3956() : Number
      {
         return 0.2 * height;
      }
      
      override protected function a_3966() : int
      {
         return RiceFlowerMachineDefence.a_3966(m_iSkillDegree);
      }
   }
}

