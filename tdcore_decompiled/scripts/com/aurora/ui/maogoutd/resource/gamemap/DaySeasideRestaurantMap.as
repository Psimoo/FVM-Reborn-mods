package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class DaySeasideRestaurantMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function DaySeasideRestaurantMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      public function SetBattleFieldView(stBattleFieldView:BattleFieldView) : void
      {
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

