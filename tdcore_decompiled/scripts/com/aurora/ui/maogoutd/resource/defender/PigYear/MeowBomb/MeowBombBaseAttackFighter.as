package com.aurora.ui.maogoutd.resource.defender.PigYear.MeowBomb
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.effect.a_4126;
   
   public class MeowBombBaseAttackFighter extends a_3960
   {
      
      public function MeowBombBaseAttackFighter()
      {
         super();
         a_1095 = MeowBomDefine.DEFENSE_PRICE;
         a_1330 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(MeowBombBaseAttackFighter) as MeowBombBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MeowBombBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MeowBomDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MeowBomDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 4)
         {
            this.FrozenEffect();
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function a_4360() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
                  stMoveIntruder.PowerfulBombReduceLifeRate();
               }
            }
         }
      }
      
      private function FrozenEffect() : void
      {
         var x:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stIceFreezeUpEffect:a_4126 = null;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         for(var y:int = yStart; y <= yEnd; y++)
         {
            for(x = xStart; x <= xEnd; x++)
            {
               arrMoveIntruder = stFieldGridVector[y][x].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.visible)
                  {
                     stIceFreezeUpEffect = a_4126.a_3926();
                  }
                  stMoveIntruder.a_4208(b_182.a_434,50,stIceFreezeUpEffect);
                  stMoveIntruder.a_4208(b_182.a_433,300);
               }
            }
         }
      }
   }
}

