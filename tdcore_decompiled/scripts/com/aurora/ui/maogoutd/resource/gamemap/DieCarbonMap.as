package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class DieCarbonMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function DieCarbonMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            for(i = 0; i < 7; i++)
            {
               for(j = 0; j < 9; j++)
               {
                  if(i % 2 == 1 && j % 2 == 0 || i % 2 == 0 && j % 2 == 1)
                  {
                     stCurrentBattleFieldView.stFieldGridsVector[i][j].m_iFieldGridType = 3;
                  }
               }
            }
         }
         return true;
      }
   }
}

