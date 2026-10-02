package com.aurora.ui.maogoutd.resource.sound
{
   import flash.media.Sound;
   import flash.media.SoundLoaderContext;
   import flash.net.URLRequest;
   
   public class a_4405 extends Sound
   {
      
      private static var a_1120:a_4405;
      
      public function a_4405(stream:URLRequest = null, context:SoundLoaderContext = null)
      {
         super(stream,context);
      }
      
      public static function getInstance() : a_4405
      {
         if(null == a_1120)
         {
            a_1120 = new a_4405();
         }
         return a_1120;
      }
   }
}

