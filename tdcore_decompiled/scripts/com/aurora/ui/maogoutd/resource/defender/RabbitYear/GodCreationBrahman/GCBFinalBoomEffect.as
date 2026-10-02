package com.aurora.ui.maogoutd.resource.defender.RabbitYear.GodCreationBrahman
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class GCBFinalBoomEffect extends BaseGameEffect
   {
      
      private var a_1334:a_3491;
      
      public function GCBFinalBoomEffect()
      {
         super();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         if(a_1273 == 3)
         {
            this.boomDie();
         }
      }
      
      public function InitData(grid:a_3491) : void
      {
         this.a_1334 = grid;
      }
      
      override public function a_3940() : Boolean
      {
         this.a_1334 = null;
         return super.a_3940();
      }
      
      private function boomDie() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!this.a_1334)
         {
            return;
         }
         BattleFieldView.a_1048.play();
         this.a_1334.m_stCurrentBattbleFieldView.a_3466();
         var yStart:int = this.a_1334.m_iYGridNo - 2 < 0 ? 0 : int(this.a_1334.m_iYGridNo - 2);
         var xStart:int = this.a_1334.m_iXGridNo - 2 < 0 ? 0 : int(this.a_1334.m_iXGridNo - 2);
         var yEnd:int = this.a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.a_1334.m_iYGridNo + 2);
         var xEnd:int = this.a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.a_1334.m_iXGridNo + 2);
         var xEffectStart:int = Math.max(this.a_1334.m_iXGridNo - 1,0);
         var stFieldGridVector:Array = this.a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = this.a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
   }
}

