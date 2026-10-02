package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class CoffeeBottleEightDirectionFirstTransAttackFighter extends a_3953
   {
      
      public function CoffeeBottleEightDirectionFirstTransAttackFighter()
      {
         super();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         a_1095 = 150;
         a_1335 = 65539;
         a_1310 = 6;
         a_1311 = 40 + this.a_3965();
         a_1313 = true;
         a_1309 = 42;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeBottleEightDirectionFirstTransAttackFighter) as CoffeeBottleEightDirectionFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeBottleEightDirectionFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = 40 + this.a_3965();
         a_1309 = 42;
         if(stFieldGrid.m_stCurrentBattbleFieldView.iBattleFieldStageType == 1)
         {
            a_1340 = true;
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3966();
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
         var i:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var isExistIntruder:Boolean = false;
         if(!a_1340)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
            yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            if(a_1321 + 36 == iCurrentTime)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     trace("ReduceLife, Y:" + yIndex + ", X:" + xIndex);
                     arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter))
                        {
                           stMoveIntruder.a_4209(a_1311);
                           stMoveIntruder.a_4208(b_182.a_432,1);
                        }
                     }
                  }
               }
            }
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               a_1321 = iCurrentTime;
               isExistIntruder = false;
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     trace("CheckIntruder, Y:" + yIndex + ", X:" + xIndex);
                     if(stFieldGridVector[yIndex][xIndex].a_1511.length > 0)
                     {
                        isExistIntruder = true;
                     }
                  }
               }
               if(isExistIntruder)
               {
                  BattleFieldView.a_1032.play();
                  a_1307 = (a_1276[2] as FrameLabel).frame;
                  a_1275 = 2;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
         }
         return true;
      }
      
      override public function a_3970() : Boolean
      {
         if(a_1340)
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            a_1321 = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.6 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 == 0)
         {
            iStarDegreeEffect = 20;
         }
         else if(1 == a_1094)
         {
            iStarDegreeEffect = 24;
         }
         else if(2 == a_1094)
         {
            iStarDegreeEffect = 28;
         }
         else if(3 == a_1094)
         {
            iStarDegreeEffect = 32;
         }
         else if(4 == a_1094)
         {
            iStarDegreeEffect = 36;
         }
         else if(5 == a_1094)
         {
            iStarDegreeEffect = 40;
         }
         else if(6 == a_1094)
         {
            iStarDegreeEffect = 44;
         }
         else if(7 == a_1094)
         {
            iStarDegreeEffect = 48;
         }
         else if(8 == a_1094)
         {
            iStarDegreeEffect = 54;
         }
         else if(9 == a_1094)
         {
            iStarDegreeEffect = 60;
         }
         else if(10 == a_1094)
         {
            iStarDegreeEffect = 80;
         }
         else if(11 == a_1094)
         {
            iStarDegreeEffect = 100;
         }
         else if(12 == a_1094)
         {
            iStarDegreeEffect = 120;
         }
         else if(13 == a_1094)
         {
            iStarDegreeEffect = 140;
         }
         else if(14 == a_1094)
         {
            iStarDegreeEffect = 160;
         }
         else if(15 == a_1094)
         {
            iStarDegreeEffect = 180;
         }
         else if(16 == a_1094)
         {
            iStarDegreeEffect = 200;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 3 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (6 - 3) + 5 * (m_iSkillDegree - 6);
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

