package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.maka.MakaDefence;
   
   public class DragonSuppressingPillar1Effect extends DragonSuppressingPillarEffect
   {
      
      public function DragonSuppressingPillar1Effect()
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
               if(grid != null && grid.m_stAttackFighter != null)
               {
                  grid.m_stAttackFighter.SleepTime2(10 * 20);
               }
            }
         }
      }
      
      override protected function DoRealDownSkill() : void
      {
         var grid:a_3491 = null;
         var j:int = 0;
         for(var i:int = -2; i <= 2; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + i,stFieldGrid.m_iYGridNo + j);
               if(grid != null && grid.m_stAttackFighter != null)
               {
                  grid.m_stAttackFighter.a_3970();
                  MakaDefence.AddAwakeBuff(grid.m_stAttackFighter,20 * 10,grid);
               }
            }
         }
      }
   }
}

