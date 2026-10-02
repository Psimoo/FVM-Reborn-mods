package com.aurora.ui.maogoutd.resource.defender.RabbitYear.CandyPot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class CandyPotBombAttackFighter extends a_3960
   {
      
      private var m_AppearedTimes:int = 0;
      
      private var m_disappearFrame:int;
      
      private var stHurtPower:int;
      
      public function CandyPotBombAttackFighter()
      {
         super();
         a_1095 = CandyPotBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1337 = 3;
         a_1338 = 10;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(CandyPotBombAttackFighter) as CandyPotBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CandyPotBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = CandyPotBombDefine.MAX_LIFE_VALUE;
         this.m_AppearedTimes = -1;
         this.stHurtPower = CandyPotBombDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CandyPotBombDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var randomNum:int = 0;
         var FrameIndex:int = 0;
         super.a_3961(iCurrentTime);
         if(this.m_AppearedTimes == -1)
         {
            randomNum = BattleFieldView.m_stRandomSeed.nextInt(9) + 1;
            if(randomNum <= 3)
            {
               FrameIndex = 2;
            }
            else if(randomNum <= 5)
            {
               FrameIndex = 4;
            }
            else if(randomNum <= 8)
            {
               FrameIndex = 1;
            }
            else if(randomNum <= 10)
            {
               FrameIndex = 3;
            }
            a_1275 = FrameIndex;
            this.m_AppearedTimes = iCurrentTime;
            this.m_disappearFrame = a_1275 + 1 >= a_1276.length ? a_1274 : int((a_1276[a_1275 + 1] as FrameLabel).frame - 1);
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 26 || a_1273 == 51 || a_1273 == 79 || a_1273 == 107)
            {
               BattleFieldView.a_1048.play();
               a_1334.m_stCurrentBattbleFieldView.a_3466();
            }
            if(a_1273 == 108)
            {
               this.addBoomEffect();
            }
            else if(a_1273 == 110)
            {
               this.RowColumnBoom(a_1334);
            }
            else if(a_1273 == 52)
            {
               this.ThreeCrossRangeBoom(a_1334,1);
            }
            else if(a_1273 == 82)
            {
               this.TatalRangeBoom(a_1334,8);
            }
            else if(a_1273 == 27)
            {
               this.TatalRangeBoom(a_1334,1);
            }
         }
         if(a_1273 == this.m_disappearFrame)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function addBoomEffect() : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         var stCandyPotBoomEffect:CandyPotBoomEffect = CandyPotBoomEffect.a_3926();
         stCandyPotBoomEffect.IsHasColumn = true;
         stCandyPotBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334.m_stCurrentBattbleFieldView);
      }
      
      private function RowColumnBoom(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         var tempFieldGrid:a_3491 = null;
         var iYGridNo:int = 0;
         if(stFieldGrid == null)
         {
            return;
         }
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for each(tempFieldGrid in stFieldGridVector[stFieldGrid.m_iYGridNo])
         {
            for each(stMoveIntruder in tempFieldGrid.a_1511.slice())
            {
               if(!stMoveIntruder.IsElite)
               {
                  stMoveIntruder.a_4210();
               }
               else if(stMoveIntruder.iLifeValue - this.stHurtPower <= 0)
               {
                  stMoveIntruder.iDIYLife = 0;
                  stMoveIntruder.ShowBoomDieEffect();
                  stMoveIntruder.a_3432();
               }
               else
               {
                  stMoveIntruder.a_4209(this.stHurtPower);
               }
            }
         }
         for(iYGridNo = 0; iYGridNo < BattleFieldView.a_1012; iYGridNo++)
         {
            if(iYGridNo != stFieldGrid.m_iYGridNo)
            {
               for each(stMoveIntruder in stFieldGridVector[iYGridNo][stFieldGrid.m_iXGridNo].a_1511.slice())
               {
                  if(!stMoveIntruder.IsElite)
                  {
                     stMoveIntruder.a_4210();
                  }
                  else if(stMoveIntruder.iLifeValue - this.stHurtPower <= 0)
                  {
                     stMoveIntruder.iDIYLife = 0;
                     stMoveIntruder.ShowBoomDieEffect();
                     stMoveIntruder.a_3432();
                  }
                  else
                  {
                     stMoveIntruder.a_4209(this.stHurtPower);
                  }
               }
            }
         }
      }
      
      private function ThreeCrossRangeBoom(stFieldGrid:a_3491, range:int) : void
      {
         var stCurFieldGrid:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         this.BoomDamage(stFieldGrid);
         for(var i:int = 1; i <= range; i++)
         {
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo - i);
            this.BoomDamage(stCurFieldGrid);
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo + i);
            this.BoomDamage(stCurFieldGrid);
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo - i,stFieldGrid.m_iYGridNo);
            this.BoomDamage(stCurFieldGrid);
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + i,stFieldGrid.m_iYGridNo);
            this.BoomDamage(stCurFieldGrid);
         }
      }
      
      private function TatalRangeBoom(stFieldGrid:a_3491, range:int) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!stMoveIntruder.IsElite)
                  {
                     stMoveIntruder.a_4210();
                  }
                  else if(stMoveIntruder.iLifeValue - this.stHurtPower <= 0)
                  {
                     stMoveIntruder.iDIYLife = 0;
                     stMoveIntruder.ShowBoomDieEffect();
                     stMoveIntruder.a_3432();
                  }
                  else
                  {
                     stMoveIntruder.a_4209(this.stHurtPower);
                  }
               }
            }
         }
      }
      
      private function BoomDamage(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(!stMoveIntruder.IsElite)
            {
               stMoveIntruder.a_4210();
            }
            else if(stMoveIntruder.iLifeValue - this.stHurtPower <= 0)
            {
               stMoveIntruder.iDIYLife = 0;
               stMoveIntruder.ShowBoomDieEffect();
               stMoveIntruder.a_3432();
            }
            else
            {
               stMoveIntruder.a_4209(this.stHurtPower);
            }
         }
      }
   }
}

