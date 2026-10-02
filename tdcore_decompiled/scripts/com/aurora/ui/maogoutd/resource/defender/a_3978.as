package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_3978 extends a_3972
   {
      
      public function a_3978()
      {
         super();
         a_1095 = 0;
      }
      
      public static function a_3926() : a_3972
      {
         return PoolManager.getInstance().CheckOutOne(a_3978,BigCatInsuranceDefenseMovie) as a_3978;
      }
   }
}

