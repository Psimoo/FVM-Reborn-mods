package com.aurora.ui.maogoutd.resource.energy
{
   public class FlameGoldGeminiEnergy extends a_4157
   {
      
      private static var ms_stFlameGoldGeminiEnergyVector:Array = new Array();
      
      public function FlameGoldGeminiEnergy()
      {
         super();
         a_1279 = -39;
         m_iYDisplayCenterPos = -40;
      }
      
      public static function a_4165() : a_4157
      {
         var stFlameGoldGeminiEnergy:FlameGoldGeminiEnergy = ms_stFlameGoldGeminiEnergyVector.pop();
         if(null == stFlameGoldGeminiEnergy)
         {
            stFlameGoldGeminiEnergy = new FlameGoldGeminiEnergy();
         }
         return stFlameGoldGeminiEnergy;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameGoldGeminiEnergyMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stFlameGoldGeminiEnergyVector.indexOf(this))
         {
            ms_stFlameGoldGeminiEnergyVector.push(this);
         }
         return true;
      }
   }
}

