package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.resource.wave.ThreeRowWaterWaveMovie;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   
   public class DayMouseDitchGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function DayMouseDitchGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 2;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4175() : a_4450
      {
         var stBaseMapWaterWave:a_4450 = null;
         stBaseMapWaterWave = a_4450.a_3926(ThreeRowWaterWaveMovie) as a_4450;
         stBaseMapWaterWave.x = -238;
         stBaseMapWaterWave.y = 13;
         return stBaseMapWaterWave;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

