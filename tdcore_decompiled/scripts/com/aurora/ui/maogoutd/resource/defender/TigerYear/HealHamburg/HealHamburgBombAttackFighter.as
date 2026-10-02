package com.aurora.ui.maogoutd.resource.defender.TigerYear.HealHamburg
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow.CureEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class HealHamburgBombAttackFighter extends a_3960
   {
      
      public function HealHamburgBombAttackFighter()
      {
         super();
         a_1095 = HealHamburgBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(HealHamburgBombAttackFighter) as HealHamburgBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return HealHamburgBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = HealHamburgBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return HealHamburgBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         if(iCurrentTime % 2 == 0)
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 8)
         {
            this.CureSkill();
            for each(stMoveIntruder in a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
            {
               if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.parent) && stMoveIntruder.iLifeValue > 0)
               {
                  stMoveIntruder.a_3969(100);
               }
            }
         }
         else if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function addCureEffect() : void
      {
         var stLastWaitShot:a_4348 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 0,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 0,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 0,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(yIndex = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               stLastWaitShot = CureEffect.a_4344();
               (stLastWaitShot as CureEffect).m_ishowType = 2;
               stLastWaitShot.a_1797(0,0,0,x,y,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
               parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
               stLastWaitShot.x = xIndex * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width);
               stLastWaitShot.y = yIndex * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height);
            }
         }
      }
      
      protected function CureSkill() : void
      {
         var xIndex:int = 0;
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.CureFieldGridDefense(stFieldGridVector[yIndex][xIndex],-20);
            }
         }
      }
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         return HealHamburgBombGridCure.CureFieldGridDefenseForHealHamburgBomb(stFieldGrid,value,0);
      }
   }
}

