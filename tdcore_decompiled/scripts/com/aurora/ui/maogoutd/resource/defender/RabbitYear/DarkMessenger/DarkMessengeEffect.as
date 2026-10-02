package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DarkMessenger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class DarkMessengeEffect extends a_4108
   {
      
      public function DarkMessengeEffect()
      {
         super();
         a_1279 = -17;
         m_iYDisplayCenterPos = -21;
      }
      
      public static function a_3926() : DarkMessengeEffect
      {
         return PoolManager.getInstance().CheckOutOne(DarkMessengeEffect,DarkMessengeEffectMovie) as DarkMessengeEffect;
      }
      
      public static function GetFreeInstance1() : DarkMessengeEffect
      {
         return PoolManager.getInstance().CheckOutOne(DarkMessengeEffect,DarkMessengeEffect1Movie) as DarkMessengeEffect;
      }
      
      public static function GetFreeInstance2() : DarkMessengeEffect
      {
         return PoolManager.getInstance().CheckOutOne(DarkMessengeEffect,DarkMessengeEffect2Movie) as DarkMessengeEffect;
      }
      
      public static function GetFreeInstance3() : DarkMessengeEffect
      {
         return PoolManager.getInstance().CheckOutOne(DarkMessengeEffect,DarkMessengeEffect3Movie) as DarkMessengeEffect;
      }
   }
}

