package com.aurora.ui.maogoutd.resource.defender.PigYear.DesertCard.WindBreakGrass
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class WindBreakGrassBaseDefence extends a_3953
   {
      
      public function WindBreakGrassBaseDefence()
      {
         super();
         a_1338 = 0;
         a_1337 = 5;
         a_1095 = WindBreakGrassDefence.DEFENSE_PRICE;
         a_1333 = true;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(WindBreakGrassBaseDefence) as WindBreakGrassBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindBreakGrassBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 30;
         super.a_1797(stFieldGrid);
         a_1309 = WindBreakGrassDefence.a_3966(m_iSkillDegree);
         a_1339 = 30;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         trace("m_iCurrentFrame:" + a_1273);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.ChangeFiedType(false);
         }
         return true;
      }
      
      private function ChangeFiedType(bole:Boolean) : void
      {
         var stFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = stFieldGridVector[yIndex][xIndex];
               stFieldGrid.m_isCanBrokeByWind = bole;
            }
         }
      }
      
      override protected function a_3964() : int
      {
         return WindBreakGrassDefence.a_3964(a_1094);
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
   }
}

