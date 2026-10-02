package com.aurora.ui.maogoutd.resource.gamemap
{
   public class SpringFestivalSimpleMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function SpringFestivalSimpleMap()
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
   }
}

