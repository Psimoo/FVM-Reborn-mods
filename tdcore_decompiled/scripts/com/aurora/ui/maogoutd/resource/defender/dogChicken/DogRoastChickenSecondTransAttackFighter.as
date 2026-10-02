package com.aurora.ui.maogoutd.resource.defender.dogChicken
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DogRoastChickenSecondTransAttackFighter extends a_3953
   {
      
      private var a_1383:int;
      
      public function DogRoastChickenSecondTransAttackFighter()
      {
         super();
         a_1095 = 60;
         a_1304 = b_183.b_194;
         a_1313 = true;
         a_1314 = true;
         a_1317 = 10;
         a_1312 = 15;
         a_1309 = 40;
         a_1310 = 8;
         a_1333 = true;
         a_1320 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DogRoastChickenSecondTransAttackFighter) as DogRoastChickenSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogRoastChickenSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1383 = 5;
         stFieldGrid.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3460(BattleFieldView.a_1011 - stFieldGrid.m_iXGridNo - 1,stFieldGrid.m_iYGridNo);
         stFieldGrid.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3460(BattleFieldView.a_1011 - stFieldGrid.m_iXGridNo - 2,stFieldGrid.m_iYGridNo);
         super.a_1797(stFieldGrid);
         a_1309 = 40;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 60;
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
         if(this.a_1383 <= 0 && iCurrentTime >= a_1321 + a_1309)
         {
            if(0 == this.a_1383 && iCurrentTime >= a_1321 + 40)
            {
               this.a_3969(a_1339);
            }
            return false;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            stLastWaitShot = DogRoastChickenShot.a_4344();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1324.push(stLastWaitShot);
               for(i = 0; i < 1; i++)
               {
                  stLastWaitShot = DogRoastChickenShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               a_1323 = 0;
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos + 30,y + this.a_3956() - 30,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         if(a_1321 == iCurrentTime)
         {
            --this.a_1383;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         if(a_1334)
         {
            a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3461(BattleFieldView.a_1011 - a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
            a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3461(BattleFieldView.a_1011 - a_1334.m_iXGridNo - 2,a_1334.m_iYGridNo);
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.7;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 == 0)
         {
            iStarDegreeEffect = 2;
         }
         else if(a_1094 == 1)
         {
            iStarDegreeEffect = 3;
         }
         else if(a_1094 == 2)
         {
            iStarDegreeEffect = 4;
         }
         else if(a_1094 == 3)
         {
            iStarDegreeEffect = 5;
         }
         else if(a_1094 == 4)
         {
            iStarDegreeEffect = 6;
         }
         else if(5 == a_1094)
         {
            iStarDegreeEffect = 8;
         }
         else if(6 == a_1094)
         {
            iStarDegreeEffect = 9;
         }
         else if(7 == a_1094)
         {
            iStarDegreeEffect = 11;
         }
         else if(8 == a_1094)
         {
            iStarDegreeEffect = 13;
         }
         else if(9 == a_1094)
         {
            iStarDegreeEffect = 18;
         }
         else if(10 == a_1094)
         {
            iStarDegreeEffect = 25;
         }
         else if(11 == a_1094)
         {
            iStarDegreeEffect = 34;
         }
         else if(12 == a_1094)
         {
            iStarDegreeEffect = 43;
         }
         else if(13 == a_1094)
         {
            iStarDegreeEffect = 55;
         }
         else if(14 == a_1094)
         {
            iStarDegreeEffect = 70;
         }
         else if(15 == a_1094)
         {
            iStarDegreeEffect = 85;
         }
         return iStarDegreeEffect;
      }
   }
}

