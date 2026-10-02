package com.aurora.ui.maogoutd.resource.defender.CattleYear.DeepWaterBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class DeepWaterBombBaseAttackFighter extends a_3960
   {
      
      public function DeepWaterBombBaseAttackFighter()
      {
         super();
         a_1095 = DeepWaterBombDefine.SECONDTRANS_DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(DeepWaterBombBaseAttackFighter) as DeepWaterBombBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeepWaterBombBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = DeepWaterBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DeepWaterBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stOilBottleBoomEffect:DeepWaterBombEffect = null;
         var stFieldGridVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stFieldGrid:a_3491 = null;
         var iYGridNo:int = 0;
         super.a_3961(iCurrentTime);
         if(iCurrentTime % 2 == 0)
         {
            return false;
         }
         if(a_1273 == a_1274 - 6)
         {
            stOilBottleBoomEffect = DeepWaterBombEffect.a_3926();
            stOilBottleBoomEffect.IsHasColumn = true;
            stOilBottleBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334.m_stCurrentBattbleFieldView);
         }
         if(a_1273 == a_1274)
         {
            BattleFieldView.a_1047.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for each(stFieldGrid in stFieldGridVector[a_1334.m_iYGridNo])
            {
               for each(stMoveIntruder in stFieldGrid.a_1511.slice())
               {
                  stMoveIntruder.a_4210();
                  stMoveIntruder.PowerfulBombReduceLifeRate();
               }
            }
            for(iYGridNo = 0; iYGridNo < BattleFieldView.a_1012; iYGridNo++)
            {
               if(iYGridNo != a_1334.m_iYGridNo)
               {
                  for each(stMoveIntruder in stFieldGridVector[iYGridNo][a_1334.m_iXGridNo].a_1511.slice())
                  {
                     stMoveIntruder.a_4210();
                     stMoveIntruder.PowerfulBombReduceLifeRate();
                  }
               }
            }
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
   }
}

