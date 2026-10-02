package com.aurora.ui.maogoutd.doctor
{
   public class ConnectionRandomNumber
   {
      
      private static var _instance:ConnectionRandomNumber;
      
      public var randomID:Number = 0;
      
      public function ConnectionRandomNumber()
      {
         super();
         this.randomID = Math.random() * 999999;
      }
      
      public static function get instance() : ConnectionRandomNumber
      {
         if(_instance == null)
         {
            _instance = new ConnectionRandomNumber();
         }
         return _instance;
      }
   }
}

