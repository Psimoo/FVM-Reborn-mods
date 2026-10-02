package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class CookingPotEffect extends BaseGameEffect
   {
      
      private var iRaceCount:int = 0;
      
      private var iTick:int = 0;
      
      private var iLastAttackTick:int = -1;
      
      private var iState:int = 0;
      
      private var a_1334:a_3491;
      
      private var m_stBattleView:BattleFieldView;
      
      public function CookingPotEffect()
      {
         super();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(this.iState == 0)
         {
            if(this.iRaceCount == 1)
            {
               if(this.iLastAttackTick == -1 || this.iTick > this.iLastAttackTick + 14)
               {
                  if(this.CanAttack1())
                  {
                     this.iLastAttackTick = this.iTick;
                     SetAnimationOnce2Loop(3,2);
                  }
               }
            }
            else if(this.iRaceCount == 2)
            {
               if(this.iLastAttackTick == -1 || this.iTick > this.iLastAttackTick + 18)
               {
                  if(this.CanAttack2())
                  {
                     this.iLastAttackTick = this.iTick;
                     SetAnimationOnce2Loop(6,5);
                  }
               }
            }
            else if(this.iRaceCount == 3)
            {
               if(this.iLastAttackTick == -1 || this.iTick > this.iLastAttackTick + 31)
               {
                  if(this.CanAttack3())
                  {
                     this.iLastAttackTick = this.iTick;
                     SetAnimationOnce2Loop(9,8);
                  }
               }
            }
         }
         else if(a_1273 == 17 || a_1273 == 52 || a_1273 == 91)
         {
            this.iState = 0;
            this.iLastAttackTick = -1;
         }
         super.a_4109(a_4730);
         if(a_1273 == 33 || a_1273 == 36)
         {
            this.DoAttack1();
         }
         else if(a_1273 == 69 || a_1273 == 72)
         {
            this.DoAttack2();
         }
         else if(a_1273 == 110 || a_1273 == 115)
         {
            this.DoAttack3();
         }
         ++this.iTick;
      }
      
      private function CanAttack1() : Boolean
      {
         return this.CheckHasAttacker2(this.a_1334);
      }
      
      private function CanAttack2() : Boolean
      {
         var iNoX:int = this.a_1334.m_iXGridNo;
         var iNoY:int = this.a_1334.m_iYGridNo;
         if(this.CheckHasAttacker(iNoX + 2,iNoY))
         {
            return true;
         }
         if(this.CheckHasAttacker(iNoX + 1,iNoY))
         {
            return true;
         }
         if(this.CheckHasAttacker(iNoX,iNoY))
         {
            return true;
         }
         return false;
      }
      
      private function CheckHasAttacker(iNoX:int, iNoY:int) : Boolean
      {
         var grid:a_3491 = this.m_stBattleView.a_3438(iNoX,iNoY);
         return this.CheckHasAttacker3(grid);
      }
      
      private function CheckHasAttacker2(grid:a_3491) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         if(grid == null)
         {
            return false;
         }
         for each(stMoveIntruder in grid.a_1511.slice())
         {
            if(8388624 == stMoveIntruder.m_stMoveIntruderTypeID || 8389123 == stMoveIntruder.m_stMoveIntruderTypeID || 8389017 == stMoveIntruder.m_stMoveIntruderTypeID || 8389644 == stMoveIntruder.m_stMoveIntruderTypeID)
            {
               return true;
            }
            if(stMoveIntruder.iSpaceState == 0)
            {
               return true;
            }
         }
         return false;
      }
      
      private function CheckHasAttacker3(grid:a_3491) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         if(grid == null)
         {
            return false;
         }
         for each(stMoveIntruder in grid.a_1511.slice())
         {
            if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 3)
            {
               return true;
            }
         }
         return false;
      }
      
      private function CanAttack3() : Boolean
      {
         var grid:a_3491 = null;
         var j:int = 0;
         var iNoX:int = this.a_1334.m_iXGridNo;
         var iNoY:int = this.a_1334.m_iYGridNo;
         loop0:
         for(var i:int = -1; i <= 1; )
         {
            j = -1;
            while(true)
            {
               if(j > 1)
               {
                  i++;
                  continue loop0;
               }
               grid = this.m_stBattleView.a_3438(iNoX + i,iNoY + j);
               if(grid != null && grid.a_1511.length > 0)
               {
                  break;
               }
               j++;
            }
            return true;
         }
         return false;
      }
      
      private function DoAttack1() : void
      {
         var stMoveIntruder:a_4206 = null;
         for each(stMoveIntruder in this.a_1334.a_1511.slice())
         {
            if(8388624 == stMoveIntruder.m_stMoveIntruderTypeID || 8389123 == stMoveIntruder.m_stMoveIntruderTypeID || 8389017 == stMoveIntruder.m_stMoveIntruderTypeID || 8389644 == stMoveIntruder.m_stMoveIntruderTypeID)
            {
               stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
            }
            else if(stMoveIntruder.iSpaceState == 0)
            {
               if(stMoveIntruder.IsBossIntruder)
               {
                  stMoveIntruder.a_3969(20000);
               }
               else
               {
                  stMoveIntruder.a_3969(2000);
               }
               stMoveIntruder.a_4208(b_182.a_432,1);
            }
         }
      }
      
      private function DoAttack2() : void
      {
         this.DoAttackGrid2(this.a_1334);
         this.DoAttackGrid2(this.m_stBattleView.a_3438(this.a_1334.m_iXGridNo + 1,this.a_1334.m_iYGridNo));
         this.DoAttackGrid2(this.m_stBattleView.a_3438(this.a_1334.m_iXGridNo + 2,this.a_1334.m_iYGridNo));
      }
      
      private function DoAttackGrid2(grid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(grid == null)
         {
            return;
         }
         for each(stMoveIntruder in grid.a_1511.slice())
         {
            if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 3)
            {
               if(stMoveIntruder.IsBossIntruder)
               {
                  stMoveIntruder.a_3969(10000);
               }
               else
               {
                  stMoveIntruder.a_4209(2000);
               }
               stMoveIntruder.a_4208(b_182.a_432,1);
            }
         }
      }
      
      private function DoAttack3() : void
      {
         var j:int = 0;
         var iNoX:int = this.a_1334.m_iXGridNo;
         var iNoY:int = this.a_1334.m_iYGridNo;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               this.DoAttackGrid3(iNoX + i,iNoY + j);
            }
         }
      }
      
      private function DoAttackGrid3(iNoX:int, iNoY:int) : void
      {
         var stMoveIntruder:a_4206 = null;
         var grid:a_3491 = this.m_stBattleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         for each(stMoveIntruder in grid.a_1511.slice())
         {
            if(stMoveIntruder.IsBossIntruder)
            {
               stMoveIntruder.a_4209(4000);
            }
            else
            {
               stMoveIntruder.a_4209(2000);
            }
            stMoveIntruder.a_4208(b_182.a_432,1);
         }
      }
      
      public function InitData(grid:a_3491) : void
      {
         this.iRaceCount = 0;
         this.iTick = 0;
         this.iState = 0;
         this.iLastAttackTick = -1;
         this.a_1334 = grid;
         this.m_stBattleView = grid.m_stCurrentBattbleFieldView;
         SetAnimation(0);
      }
      
      public function AddPot() : void
      {
         ++this.iRaceCount;
         if(this.iRaceCount > 3)
         {
            this.iRaceCount = 3;
            return;
         }
         if(this.iRaceCount == 1)
         {
            SetAnimationOnce2Loop(1,2);
            this.iState = 1;
         }
         else if(this.iRaceCount == 2)
         {
            SetAnimationOnce2Loop(4,5);
            this.iState = 1;
         }
         else if(this.iRaceCount == 3)
         {
            SetAnimationOnce2Loop(7,8);
            this.iState = 1;
         }
      }
   }
}

