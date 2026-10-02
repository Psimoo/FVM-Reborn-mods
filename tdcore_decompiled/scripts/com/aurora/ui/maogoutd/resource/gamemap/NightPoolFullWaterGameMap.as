package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.resource.wave.ThreeRowWaterWave4Movie;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   
   public class NightPoolFullWaterGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function NightPoolFullWaterGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 6;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4175() : a_4450
      {
         return a_4450.a_3926(ThreeRowWaterWave4Movie) as a_4450;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

