package com.aurora.ui.maogoutd.resource.sound
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundLoaderContext;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   
   public class a_4403 extends Sound
   {
      
      public static var a_1610:Number = 1;
      
      public var m_stSoundTransform:SoundTransform = new SoundTransform();
      
      public function a_4403(stream:URLRequest = null, context:SoundLoaderContext = null)
      {
         super(stream,context);
      }
      
      override public function play(startTime:Number = 0, loops:int = 0, sndTransform:SoundTransform = null) : SoundChannel
      {
         this.m_stSoundTransform.volume = a_1610;
         return super.play(startTime,loops,this.m_stSoundTransform);
      }
   }
}

