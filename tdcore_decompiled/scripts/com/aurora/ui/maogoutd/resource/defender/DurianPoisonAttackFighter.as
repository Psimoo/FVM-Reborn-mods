package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.DurianPoisonGasShot;
   
   public class DurianPoisonAttackFighter extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var m_arrDurianPoisonGasShotArray:Array = [];
      
      public function DurianPoisonAttackFighter()
      {
         super();
         a_1309 = 60;
         a_1312 = 0;
         a_1095 = 375;
         a_1310 = 8;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DurianPoisonAttackFighter) as DurianPoisonAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DurianPoisonAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         a_1322 = 0;
         super.a_1797(stFieldGrid);
         a_1311 = 50 + this.a_3965();
         a_1309 = 60;
         a_1339 = 1820;
         this.m_isShoted = false;
         a_1313 = true;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:DurianPoisonGasShot = null;
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
         if(iCurrentTime - m_iPlaceTimeIntervals > 200 + this.a_3966())
         {
            this.a_3969(a_1339);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_isShoted && a_1334 != null)
         {
            this.m_isShoted = true;
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
                  stLastWaitShot = DurianPoisonGasShot.a_4344() as DurianPoisonGasShot;
                  if(null == stLastWaitShot)
                  {
                     break;
                  }
                  this.m_arrDurianPoisonGasShotArray.push(stLastWaitShot);
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  stLastWaitShot.x = xIndex * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width);
                  stLastWaitShot.y = yIndex * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height);
                  ++a_1323;
                  xIndex++;
               }
               return false;
            }
            a_1307 = a_1273;
         }
         if(this.m_isShoted)
         {
            if(iCurrentTime % 20 == 0)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter))
                        {
                           stMoveIntruder.a_4209(a_1311);
                           stMoveIntruder.a_4208(b_182.a_432,2);
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 900;
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
      
      override public function a_3940() : Boolean
      {
         var stDurianPoisonGasShot:DurianPoisonGasShot = null;
         super.a_3940();
         for each(stDurianPoisonGasShot in this.m_arrDurianPoisonGasShotArray)
         {
            stDurianPoisonGasShot.m_isParentAttackDie = true;
         }
         this.m_arrDurianPoisonGasShotArray = [];
         return true;
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
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 10 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 10 * 3 + 20 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 10 * 3 + 20 * 3 + 30 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 10 * 3 + 20 * 3 + 30 * 3 + 40 * (a_1094 - 9);
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 1 * m_iSkillDegree;
         }
         else if(m_iSkillDegree <= 5)
         {
            iSkillDegreeEffect = 1 * 3 + 2 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 5)
         {
            iSkillDegreeEffect = 1 * 3 + 2 * (m_iSkillDegree - 3) + 3 * (m_iSkillDegree - 5);
         }
         return 20 * iSkillDegreeEffect;
      }
   }
}

