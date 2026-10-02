package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.ValorMemory
{
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.wave.ThreeRowWaterWave6Movie;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   
   public class DayValorMemoryMouseDitchGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function DayValorMemoryMouseDitchGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 2;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4175() : a_4450
      {
         var stBaseMapWaterWave:a_4450 = null;
         stBaseMapWaterWave = a_4450.a_3926(ThreeRowWaterWave6Movie) as a_4450;
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

