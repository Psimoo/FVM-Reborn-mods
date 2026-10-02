package com.aurora.ui.maogoutd.resource.defender.DragonYear.DragonFruit
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.PitayaFireBallShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DragonFruitBaseAttackFighter extends a_3953
   {
      
      private var m_arrDragonFruitBaseShotArray:Array = [];
      
      private var m_MouseArr:Array = new Array(8388649,8392745,8389221,8388631,8388749,8388750,8392727);
      
      private var m_CardIDArr:Array = new Array(286400640,286400654,286400655);
      
      public function DragonFruitBaseAttackFighter()
      {
         super();
         a_1312 = 15;
         a_1095 = DragonFruitDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 12;
         a_1309 = 40;
         a_1333 = true;
         a_1338 = 0;
         a_1311 = DragonFruitDefence.a_3965(a_1094);
         a_1309 = 40;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DragonFruitBaseAttackFighter) as DragonFruitBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonFruitBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = DragonFruitDefence.a_3965(a_1094);
         a_1309 = 40;
         a_1275 = 0;
         a_1339 = DragonFruitDefence.MAX_LIFE_VALUE;
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:PitayaFireBallShot = null;
         var numShotXpos:Number = NaN;
         var stStartField:a_3491 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         if(a_1275 == 2)
         {
            return false;
         }
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var yStart:int = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
         var xStart:int = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
         var yEnd:int = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
         var xEnd:int = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
         trace("m_iCurrentFrame::" + a_1273);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 1;
            this.AddWaitShot(1);
            a_1307 = 10;
            this.m_arrDragonFruitBaseShotArray = [];
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            this.LaunchShot(1);
         }
         if(iCurrentTime - a_1321 == a_1310 + 0.1 * 20)
         {
            this.a_4352(1);
         }
         return true;
      }
      
      private function a_4352(m_Range:int) : void
      {
         var stStartField:a_3491 = null;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 == null)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stStartField != null)
               {
                  arrMoveIntruder = stStartField.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1)
                     {
                        stMoveIntruder.a_3969(a_1311);
                        stMoveIntruder.a_4208(b_182.a_432,2);
                     }
                  }
               }
            }
         }
      }
      
      private function AddWaitShot(m_Range:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var stStartField:a_3491 = null;
         var xIndex:int = 0;
         if(a_1334 == null)
         {
            return false;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               stLastWaitShot = DragonFruitBaseShot.a_4344();
               if(stStartField != null && stLastWaitShot != null)
               {
                  a_1324.push(stLastWaitShot);
               }
            }
         }
         return true;
      }
      
      private function LaunchShot(m_Range:int) : void
      {
         var stLastWaitShot:a_4348 = null;
         var stStartField:a_3491 = null;
         var xIndex:int = 0;
         var tempX2:int = 0;
         var tempY2:int = 0;
         if(a_1334 == null)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stStartField != null)
               {
                  stLastWaitShot = a_1324.pop();
                  if(stLastWaitShot != null)
                  {
                     tempX2 = stStartField.m_iXGridNo * a_3491.a_1080 + 30;
                     tempY2 = stStartField.m_iYGridNo * a_3491.a_1081 + 30;
                     this.m_arrDragonFruitBaseShotArray.push(stLastWaitShot);
                     stLastWaitShot.a_1797(0,a_1312,a_1311,tempX2,tempY2,stStartField.m_stCurrentBattbleFieldView,stStartField);
                     stStartField.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
                  }
               }
            }
         }
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var i:int = 0;
         var j:int = 0;
         var a_1598:a_3491 = null;
         var k:int = 0;
         if(stFieldGrid == null)
         {
            return;
         }
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var iDefenseCount:int = 0;
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(this.m_CardIDArr.indexOf(iDefenseTypeID) != -1 && tempFieldGrid != null)
         {
            for(k = 0; k < this.m_CardIDArr.length; k++)
            {
               iDefenseCount += stFieldGrid.m_stCurrentBattbleFieldView.a_3422(this.m_CardIDArr[k]);
            }
            if(iDefenseCount >= 7 && (stFieldGrid.m_iXGridNo == tempFieldGrid.m_iXGridNo && tempFieldGrid.m_iYGridNo == stFieldGrid.m_iYGridNo))
            {
               for(i = 0; i < BattleFieldView.a_1012; i++)
               {
                  for(j = 0; j < BattleFieldView.a_1011; j++)
                  {
                     a_1598 = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[i][j];
                     if(a_1598 != null && a_1598.m_stAttackFighter != null && this.m_CardIDArr.indexOf(a_1598.m_stAttackFighter.a_3512()) != -1)
                     {
                        if(a_1598 == stFieldGrid)
                        {
                           trace("稍后处理...");
                        }
                        else
                        {
                           a_1598.m_stAttackFighter.a_3969(a_1598.m_stAttackFighter.iLifeValue);
                        }
                     }
                  }
               }
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
      }
      
      override protected function a_3964() : int
      {
         return DragonFruitDefence.a_3964(m_iSkillDegree);
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
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == 31)
            {
               this.a_4210();
            }
            else if(a_1273 == a_1274 && a_1275 == 2)
            {
               this.a_3969(a_1339);
            }
            else if(a_1273 == a_1274)
            {
               gotoAndStop(a_1307);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stDragonFruitBaseShot:DragonFruitBaseShot = null;
         super.a_3940();
         for each(stDragonFruitBaseShot in this.m_arrDragonFruitBaseShotArray)
         {
            stDragonFruitBaseShot.m_isParentAttackDie = true;
         }
         this.m_arrDragonFruitBaseShotArray = [];
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         return true;
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
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

