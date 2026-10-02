package com.aurora.ui.maogoutd.resource.energy
{
   public class a_4169 extends a_4157
   {
      
      private static var a_1441:Array = new Array();
      
      public function a_4169()
      {
         super();
      }
      
      public static function a_4165() : a_4157
      {
         var stFlameSmallEnergy:a_4169 = a_1441.pop();
         if(null == stFlameSmallEnergy)
         {
            stFlameSmallEnergy = new a_4169();
         }
         return stFlameSmallEnergy;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameSmallEnergyMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         a_1441.push(this);
         return true;
      }
   }
}

