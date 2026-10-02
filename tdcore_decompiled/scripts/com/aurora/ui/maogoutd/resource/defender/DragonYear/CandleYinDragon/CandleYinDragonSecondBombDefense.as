package com.aurora.ui.maogoutd.resource.defender.DragonYear.CandleYinDragon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class CandleYinDragonSecondBombDefense extends a_3960
   {
      
      private var m_AppearTime:int;
      
      private var m_BoomRange:int = 2;
      
      private var a_1579:Number = 0;
      
      public function CandleYinDragonSecondBombDefense()
      {
         super();
         a_1095 = CandleYinDragonBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         this.a_1579 = CandleYinDragonBombDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(CandleYinDragonSecondBombDefense) as CandleYinDragonSecondBombDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return CandleYinDragonSecondBombDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = CandleYinDragonBombDefine.MAX_LIFE_VALUE;
         this.a_1579 = CandleYinDragonBombDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CandleYinDragonBombDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 13)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            this.AddFireBurnBuff();
         }
         else if(a_1329 == iCurrentTime && a_1273 == a_1274 - 10)
         {
            this.SkillBoom();
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
      
      private function AddFireBurnBuff() : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            xStart = 0;
            xEnd = BattleFieldView.a_1011 - 1;
            yStart = 0;
            yEnd = BattleFieldView.a_1012 - 1;
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4208(b_182.a_435,50);
                     stMoveIntruder.AddFireBurnBuff(this.a_1579);
                  }
               }
            }
         }
      }
      
      private function SkillBoom() : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            xStart = Math.max(a_1334.m_iXGridNo - this.m_BoomRange,0);
            xEnd = Math.min(a_1334.m_iXGridNo + this.m_BoomRange,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - this.m_BoomRange,0);
            yEnd = Math.min(a_1334.m_iYGridNo + this.m_BoomRange,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
   }
}

