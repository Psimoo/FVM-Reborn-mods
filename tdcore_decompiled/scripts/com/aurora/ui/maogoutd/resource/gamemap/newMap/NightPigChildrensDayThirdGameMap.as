package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class NightPigChildrensDayThirdGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function NightPigChildrensDayThirdGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
         }
         return true;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

