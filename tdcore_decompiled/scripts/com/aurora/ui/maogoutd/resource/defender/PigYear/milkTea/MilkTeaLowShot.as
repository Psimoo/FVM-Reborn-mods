package com.aurora.ui.maogoutd.resource.defender.PigYear.milkTea
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class MilkTeaLowShot extends a_4348
   {
      
      public var m_isHighShot:Boolean;
      
      public function MilkTeaLowShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stMilkTeaLowShot:MilkTeaLowShot = PoolManager.getInstance().CheckOutOne(MilkTeaLowShot,MilkTeaLowShotMovie) as MilkTeaLowShot;
         stMilkTeaLowShot.m_isShotHighSkySpace = false;
         return stMilkTeaLowShot;
      }
   }
}

