package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class NightWineBarGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function NightWineBarGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 3;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4175() : a_4450
      {
         return a_4454.a_3926();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
         }
         return true;
      }
   }
}

