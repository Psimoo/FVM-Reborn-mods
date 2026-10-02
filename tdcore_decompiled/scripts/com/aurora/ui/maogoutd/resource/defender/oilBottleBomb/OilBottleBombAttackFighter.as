package com.aurora.ui.maogoutd.resource.defender.oilBottleBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.effect.a_4138;
   
   public class OilBottleBombAttackFighter extends a_3960
   {
      
      public function OilBottleBombAttackFighter()
      {
         super();
         a_1095 = OilBottleBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(OilBottleBombAttackFighter) as OilBottleBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilBottleBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = OilBottleBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return OilBottleBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stOilBottleBoomEffect:a_4138 = null;
         var stFieldGridVector:Array = null;
         var stFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 4)
         {
            stOilBottleBoomEffect = a_4138.a_3926();
            stOilBottleBoomEffect.IsHasColumn = false;
            stOilBottleBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334.m_stCurrentBattbleFieldView);
         }
         if(a_1273 == a_1274 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1047.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for each(stFieldGrid in stFieldGridVector[a_1334.m_iYGridNo])
            {
               for each(stMoveIntruder in stFieldGrid.a_1511.slice())
               {
                  stMoveIntruder.a_4210();
               }
            }
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
   }
}

