package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.stardome.StarDomeHorseDefence;
   
   public class DragonSuppressingPillar2Effect extends DragonSuppressingPillarEffect
   {
      
      public function DragonSuppressingPillar2Effect()
      {
         super();
      }
      
      override protected function DoRealUpSkill() : void
      {
         var grid:a_3491 = null;
         var j:int = 0;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + i,stFieldGrid.m_iYGridNo + j);
               if(grid != null)
               {
                  BattleDestroyUtil.ClearOneGrid(grid);
               }
            }
         }
      }
      
      override protected function DoRealDownSkill() : void
      {
         StarDomeHorseDefence.TatalRangeFangyuSkill2(stFieldGrid,1,2,10 * 15);
      }
   }
}

