package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class NightZhongQiuGuangHanGongGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function NightZhongQiuGuangHanGongGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               stCurrentBattleFieldView.stFieldGridsVector[1][i].m_isNeedTray = true;
               stCurrentBattleFieldView.stFieldGridsVector[2][i].m_isNeedTray = true;
               stCurrentBattleFieldView.stFieldGridsVector[4][i].m_isNeedTray = true;
               stCurrentBattleFieldView.stFieldGridsVector[5][i].m_isNeedTray = true;
            }
         }
         return true;
      }
      
      override public function a_4175() : a_4450
      {
         return a_4454.a_3926();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

