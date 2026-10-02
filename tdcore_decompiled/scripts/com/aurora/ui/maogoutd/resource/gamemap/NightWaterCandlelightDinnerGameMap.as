package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.resource.wave.ThreeRowWaterWave5Movie;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   
   public class NightWaterCandlelightDinnerGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function NightWaterCandlelightDinnerGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 2;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4175() : a_4450
      {
         if(szMapIDStr == "0xE003F1")
         {
            return null;
         }
         return a_4450.a_3926(ThreeRowWaterWave5Movie) as a_4450;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

