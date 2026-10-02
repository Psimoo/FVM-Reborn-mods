package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class ZiranDuanqiao2Map extends ZiranDuanqiaoMap
   {
      
      public function ZiranDuanqiao2Map()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return m_stMapInfoData;
      }
   }
}

