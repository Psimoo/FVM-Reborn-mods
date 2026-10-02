package com.aurora.ui.maogoutd.resource.defender.PigYear.FryMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class FryMeowBaseBoomAttackFighter extends a_3960
   {
      
      public function FryMeowBaseBoomAttackFighter()
      {
         super();
         a_1095 = FryMeowBoomDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1337 = -15;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(FryMeowBaseBoomAttackFighter) as FryMeowBaseBoomAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FryMeowBaseBoomAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = FryMeowBoomDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FryMeowBoomDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 4)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = 0;
            xStart = 0;
            yEnd = BattleFieldView.a_1012 - 1;
            xEnd = BattleFieldView.a_1011 - 1;
            for(y = yStart; y <= yEnd; y++)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  arrMoveIntruder = stFieldGridVector[y][x].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iSpaceState == 1 || stMoveIntruder.iSpaceState == 2)
                     {
                        stMoveIntruder.a_4212();
                     }
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

