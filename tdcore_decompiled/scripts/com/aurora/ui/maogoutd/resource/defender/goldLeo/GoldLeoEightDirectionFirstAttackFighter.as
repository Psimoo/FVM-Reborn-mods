package com.aurora.ui.maogoutd.resource.defender.goldLeo
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class GoldLeoEightDirectionFirstAttackFighter extends a_3953
   {
      
      public function GoldLeoEightDirectionFirstAttackFighter()
      {
         super();
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_1096 = false;
         a_1313 = true;
         a_1333 = true;
         a_1340 = false;
         a_1310 = 6;
         a_1095 = GoldLeoDefine.DEFENSE_PRICE;
         a_1311 = GoldLeoDefine.a_3965(a_1094);
         a_1309 = 2 * 1.25 * GoldLeoDefine.a_3966(m_iSkillDegree);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldLeoEightDirectionFirstAttackFighter) as GoldLeoEightDirectionFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldLeoEightDirectionFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = int(2 * 1.25 * GoldLeoDefine.a_3965(a_1094));
         a_1309 = GoldLeoDefine.a_3966(m_iSkillDegree);
         a_1340 = false;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldLeoDefine.a_3964();
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
         var cdTime:int = 0;
         var isExistIntruder:Boolean = false;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!a_1340)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
            cdTime = a_1321 == 0 ? 0 : a_1309;
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + cdTime)
            {
               a_1321 = iCurrentTime;
               isExistIntruder = false;
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     if(stFieldGridVector[yIndex][xIndex].a_1511.length > 0)
                     {
                        isExistIntruder = true;
                     }
                  }
               }
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter)
                        {
                           stMoveIntruder.a_4209(a_1311);
                           stMoveIntruder.a_4208(b_182.a_432,1);
                           stMoveIntruder.a_4208(b_182.a_433,100);
                        }
                     }
                  }
               }
               if(isExistIntruder)
               {
                  BattleFieldView.a_1032.play();
                  a_1307 = (a_1276[0] as FrameLabel).frame;
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
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
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            a_1321 = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         gotoAndStop((a_1276[0] as FrameLabel).frame);
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
   }
}

