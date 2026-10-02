package com.aurora.ui.maogoutd.resource.gamemap
{
   public class a_4178 extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function a_4178()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 8;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
   }
}

