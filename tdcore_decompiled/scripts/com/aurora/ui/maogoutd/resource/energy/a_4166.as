package com.aurora.ui.maogoutd.resource.energy
{
   public class a_4166 extends a_4157
   {
      
      private static var a_1440:Array = new Array();
      
      public function a_4166()
      {
         super();
      }
      
      public static function a_4165() : a_4157
      {
         var stFlameCommonEnergy:a_4166 = a_1440.pop();
         if(null == stFlameCommonEnergy)
         {
            stFlameCommonEnergy = new a_4166();
         }
         return stFlameCommonEnergy;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameCommonEnergyMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         a_1440.push(this);
         return true;
      }
   }
}

