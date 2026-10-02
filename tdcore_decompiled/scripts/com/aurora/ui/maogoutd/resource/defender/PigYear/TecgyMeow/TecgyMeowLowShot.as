package com.aurora.ui.maogoutd.resource.defender.PigYear.TecgyMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class TecgyMeowLowShot extends a_4348
   {
      
      public var m_isHighShot:Boolean;
      
      public function TecgyMeowLowShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = true;
         a_1588 = true;
         a_1587 = 0;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stTecgyMeowLowShot:TecgyMeowLowShot = PoolManager.getInstance().CheckOutOne(TecgyMeowLowShot,TecgyMeowLowShotMovie) as TecgyMeowLowShot;
         stTecgyMeowLowShot.m_isShotHighSkySpace = false;
         return stTecgyMeowLowShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         var stTecgyMeowLowShot:TecgyMeowLowShot = PoolManager.getInstance().CheckOutOne(TecgyMeowLowShot,TecgyMeowLowShot1Movie) as TecgyMeowLowShot;
         stTecgyMeowLowShot.m_isShotHighSkySpace = false;
         return stTecgyMeowLowShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         var stTecgyMeowLowShot:TecgyMeowLowShot = null;
         stTecgyMeowLowShot = PoolManager.getInstance().CheckOutOne(TecgyMeowLowShot,TecgyMeowLowShot2Movie) as TecgyMeowLowShot;
         stTecgyMeowLowShot.m_isShotHighSkySpace = false;
         return stTecgyMeowLowShot;
      }
   }
}

