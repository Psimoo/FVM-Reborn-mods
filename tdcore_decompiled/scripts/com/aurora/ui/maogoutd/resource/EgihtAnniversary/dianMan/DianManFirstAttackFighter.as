package com.aurora.ui.maogoutd.resource.EgihtAnniversary.dianMan
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class DianManFirstAttackFighter extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var m_arrDianManFirstAttackFighterShotArray:Array = [];
      
      public function DianManFirstAttackFighter()
      {
         super();
         a_1309 = 60;
         a_1312 = 0;
         a_1095 = 325;
         a_1310 = 8;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DianManFirstAttackFighter) as DianManFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DianManFristAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         a_1322 = 0;
         super.a_1797(stFieldGrid);
         a_1311 = this.a_3965() * 1.25;
         a_1309 = 60;
         a_1339 = 2000;
         this.m_isShoted = false;
         a_1313 = true;
         a_1275 = 1;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var yIndex:int = 0;
         var xIndex:int = 0;
         var yStart:int = 0;
         var xEnd:int = 0;
         var stLastWaitShot:DianManFirstShot = null;
         var startFieldGrid:a_3491 = null;
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
         var xStart:int = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
         var yEnd:int = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
         xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
         if(iCurrentTime - m_iPlaceTimeIntervals > 200 + this.a_3966())
         {
            this.a_3969(a_1339);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_isShoted && a_1334 != null)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.m_isShoted = true;
            a_1321 = iCurrentTime;
            a_1323 = 1;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  if(!(a_1334.m_iXGridNo == xIndex && a_1334.m_iYGridNo == yIndex))
                  {
                     stLastWaitShot = DianManFirstShot.a_4344() as DianManFirstShot;
                     this.m_arrDianManFirstAttackFighterShotArray.push(stLastWaitShot);
                     startFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                     stLastWaitShot.iShotSequenceNum = a_1323;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,startFieldGrid);
                     a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
                     stLastWaitShot.x = xIndex * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width);
                     stLastWaitShot.y = yIndex * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height);
                     ++a_1323;
                  }
               }
            }
            a_1307 = a_1273;
         }
         if(this.m_isShoted)
         {
            if(iCurrentTime % 20 == 0)
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     stTargetFieldGrid = stFieldGridVector[yIndex][xIndex];
                     arrMoveIntruder = stTargetFieldGrid.IntruderArray;
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter))
                        {
                           stMoveIntruder.a_4209(a_1311);
                           stMoveIntruder.a_4208(b_182.a_432,2);
                           if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
                           {
                              stMoveIntruder.a_4208(b_182.a_435,20);
                           }
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
         return 600;
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
         var stDianManFirstAttackFighterShot:DianManFirstShot = null;
         super.a_3940();
         for each(stDianManFirstAttackFighterShot in this.m_arrDianManFirstAttackFighterShotArray)
         {
            stDianManFirstAttackFighterShot.m_isParentAttackDie = true;
         }
         this.m_arrDianManFirstAttackFighterShotArray = [];
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
         var iStarDegreeEffect:Number = 5;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 7;
               break;
            case 2:
               iStarDegreeEffect = 8;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 27;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 35;
               break;
            case 13:
               iStarDegreeEffect = 39;
               break;
            case 14:
               iStarDegreeEffect = 43;
               break;
            case 15:
               iStarDegreeEffect = 47;
               break;
            case 16:
               iStarDegreeEffect = 52;
         }
         return 10 * iStarDegreeEffect;
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

