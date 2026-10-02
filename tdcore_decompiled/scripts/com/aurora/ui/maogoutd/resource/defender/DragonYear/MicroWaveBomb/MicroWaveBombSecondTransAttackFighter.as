package com.aurora.ui.maogoutd.resource.defender.DragonYear.MicroWaveBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class MicroWaveBombSecondTransAttackFighter extends a_3960
   {
      
      private var m_AppearTime:int;
      
      public function MicroWaveBombSecondTransAttackFighter()
      {
         super();
         a_1095 = MicroWaveBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(MicroWaveBombSecondTransAttackFighter) as MicroWaveBombSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MicroWaveBombSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MicroWaveBombDefine.MAX_LIFE_VALUE;
         this.m_AppearTime = 3.5 * 20;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MicroWaveBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
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
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 2,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 2,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
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
                  if(stTargetFieldGrid.m_stAttackFighter != null && stTargetFieldGrid.m_stAttackFighter.m_iDefenseStateType == 1)
                  {
                     stTargetFieldGrid.m_stAttackFighter.SpecialSkillCallBack();
                  }
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
   }
}

