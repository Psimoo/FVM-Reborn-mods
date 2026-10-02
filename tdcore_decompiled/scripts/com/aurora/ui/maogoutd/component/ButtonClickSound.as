package com.aurora.ui.maogoutd.component
{
   import flash.media.Sound;
   import flash.media.SoundLoaderContext;
   import flash.net.URLRequest;
   
   [Embed(source="/_assets/1_com.aurora.ui.maogoutd.component.ButtonClickSound.mp3")]
   public class ButtonClickSound extends Sound
   {
      
      public function ButtonClickSound(stream:URLRequest = null, context:SoundLoaderContext = null)
      {
         super(stream,context);
      }
   }
}

