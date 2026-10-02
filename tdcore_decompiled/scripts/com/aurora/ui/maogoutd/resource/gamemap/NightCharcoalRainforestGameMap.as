package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class NightCharcoalRainforestGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function NightCharcoalRainforestGameMap()
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
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][2].m_isNeedTray = true;
            stCurrentBattleFieldView.stFieldGridsVector[2][5].m_isNeedTray = true;
            stCurrentBattleFieldView.stFieldGridsVector[3][5].m_isNeedTray = true;
            stCurrentBattleFieldView.stFieldGridsVector[5][1].m_isNeedTray = true;
         }
         return true;
      }
   }
}

