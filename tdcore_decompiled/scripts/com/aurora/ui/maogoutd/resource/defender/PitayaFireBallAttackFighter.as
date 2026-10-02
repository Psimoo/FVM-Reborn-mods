package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.PitayaFireBallShot;
   import flash.display.FrameLabel;
   
   public class PitayaFireBallAttackFighter extends a_3953
   {
      
      public function PitayaFireBallAttackFighter()
      {
         super();
         a_1309 = 80;
         a_1311 = this.a_3965();
         a_1312 = 15;
         a_1095 = 375;
         a_1310 = 8;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(PitayaFireBallAttackFighter) as PitayaFireBallAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return PitayaFireBallAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         a_1322 = 0;
         super.a_1797(stFieldGrid);
         a_1311 = this.a_3965();
         a_1309 = 80;
         a_1339 = 1820;
         a_1313 = true;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:PitayaFireBallShot = null;
         var numShotXpos:Number = NaN;
         var stStartField:a_3491 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
         xStart = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
         yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
         xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
         if(iCurrentTime - m_iPlaceTimeIntervals > 230)
         {
            this.a_3969(a_1339);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 1;
            loop0:
            for(yIndex = yStart; yIndex <= yEnd; )
            {
               xIndex = xStart;
               while(true)
               {
                  if(xIndex > xEnd)
                  {
                     yIndex++;
                     continue loop0;
                  }
                  stLastWaitShot = PitayaFireBallShot.a_4344() as PitayaFireBallShot;
                  if(null == stLastWaitShot)
                  {
                     break;
                  }
                  a_1324.push(stLastWaitShot);
                  xIndex++;
               }
               return false;
            }
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stLastWaitShot = a_1324.pop();
                  if(stLastWaitShot)
                  {
                     stLastWaitShot.iShotSequenceNum = a_1323;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
                     parent.addChildAt(stLastWaitShot,1);
                     stLastWaitShot.x = xIndex * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width);
                     stLastWaitShot.y = yIndex * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height);
                     ++a_1323;
                  }
               }
            }
         }
         if(iCurrentTime - a_1321 == a_1310 + 20)
         {
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter) && 3 != stMoveIntruder.iSpaceState)
                     {
                        stMoveIntruder.a_3969(a_1311);
                        stMoveIntruder.a_4208(b_182.a_432,2);
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 600 - this.a_3966();
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
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 210;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 210;
               break;
            case 1:
               iStarDegreeEffect = 270;
               break;
            case 2:
               iStarDegreeEffect = 330;
               break;
            case 3:
               iStarDegreeEffect = 360;
               break;
            case 4:
               iStarDegreeEffect = 450;
               break;
            case 5:
               iStarDegreeEffect = 540;
               break;
            case 6:
               iStarDegreeEffect = 630;
               break;
            case 7:
               iStarDegreeEffect = 750;
               break;
            case 8:
               iStarDegreeEffect = 870;
               break;
            case 9:
               iStarDegreeEffect = 990;
               break;
            case 10:
               iStarDegreeEffect = 1140;
               break;
            case 11:
               iStarDegreeEffect = 1290;
               break;
            case 12:
               iStarDegreeEffect = 1440;
               break;
            case 13:
               iStarDegreeEffect = 1590;
               break;
            case 14:
               iStarDegreeEffect = 1740;
               break;
            case 15:
               iStarDegreeEffect = 1890;
               break;
            case 16:
               iStarDegreeEffect = 2040;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 2 * m_iSkillDegree;
         }
         else if(m_iSkillDegree <= 5)
         {
            iSkillDegreeEffect = 2 * 3 + 3 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 5)
         {
            iSkillDegreeEffect = 2 * 3 + 3 * (m_iSkillDegree - 3) + 4 * (m_iSkillDegree - 5);
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

