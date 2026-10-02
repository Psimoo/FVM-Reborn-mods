package a_4752
{
   import a_4754.a_2159;
   import a_4788.LocalData;
   import com.aurora.ui.maogoutd.component.ButtonClickSound;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class a_2050
   {
      
      private static const LOOP_CNT:int = 10000;
      
      private var a_742:Sound;
      
      private var a_730:Boolean;
      
      private var a_743:Boolean;
      
      private var a_744:Boolean;
      
      private var m_stSoundChannel:SoundChannel;
      
      private var effectVolume:Object;
      
      private var m_strCurrentPlayType:String;
      
      private var m_dictSound:Dictionary;
      
      private var m_strSoundName:String;
      
      private var m_strPath:String;
      
      public function a_2050()
      {
         super();
         this.m_dictSound = new Dictionary(true);
         this.a_730 = false;
         this.a_743 = true;
         this.a_744 = true;
         a_2159.e.register(this);
         this.initializeSound();
         var effectData:LocalData = new LocalData();
         this.effectVolume = effectData.read("effectVolume","/");
         if(this.effectVolume == null)
         {
            this.effectVolume = new Object();
         }
         if(isNaN(this.effectVolume.m_bgVolume) || isNaN(this.effectVolume.m_effectVolume) || isNaN(this.effectVolume.m_FightBgVolume))
         {
            this.effectVolume.m_bgVolume = 0.3;
            this.effectVolume.m_effectVolume = 0.3;
            this.effectVolume.m_FightBgVolume = 0.5;
         }
      }
      
      private function initializeSound() : void
      {
         if(!this.a_730)
         {
            this.a_742 = new ButtonClickSound();
            this.a_730 = true;
         }
      }
      
      private function playButtonClickSound() : void
      {
         try
         {
            if(this.a_744 && this.a_730)
            {
               this.playSound(this.a_742);
            }
         }
         catch(e:Event)
         {
         }
      }
      
      private function playSound(sound:Sound) : void
      {
         if(this.a_744 && sound != null)
         {
            sound.play(0,1,new SoundTransform(this.effectVolume.m_effectVolume));
         }
      }
      
      public function onButtonClick() : void
      {
         this.playButtonClickSound();
      }
      
      private function ClearPlayNextSound() : void
      {
         if(this.m_stSoundChannel.hasEventListener(Event.SOUND_COMPLETE))
         {
            this.m_stSoundChannel.removeEventListener(Event.SOUND_COMPLETE,this.OnPlayNextSoundHandler);
         }
         this.m_strSoundName = null;
         this.m_strPath = null;
      }
      
      private function OnPlayNextSoundHandler(e:Event) : void
      {
         if(null == this.m_strSoundName)
         {
            return;
         }
         this.OnPlaySound(this.m_strSoundName,this.m_strPath);
         this.ClearPlayNextSound();
      }
      
      private function OnPlaySound(strSoundName:String, strPath:String = "", bIsWaitEnd:Boolean = false, iLoops:int = 10000) : void
      {
         var stSound:Sound = null;
         var request:URLRequest = null;
         if(!this.a_743 || null != this.m_stSoundChannel && this.m_strCurrentPlayType == strSoundName)
         {
            return;
         }
         if(bIsWaitEnd)
         {
            this.m_strSoundName = strSoundName;
            this.m_strPath = strPath;
            this.m_stSoundChannel.addEventListener(Event.SOUND_COMPLETE,this.OnPlayNextSoundHandler);
            return;
         }
         this.StopChannel();
         if(this.m_dictSound[strSoundName] == null)
         {
            stSound = new Sound();
            this.m_dictSound[strSoundName] = stSound;
            request = new URLRequest("./resource/sound/" + strPath + strSoundName + ".mp3");
            stSound.addEventListener(IOErrorEvent.IO_ERROR,this.SoundLoadIoErrorHandler);
            stSound.addEventListener(Event.COMPLETE,this.SoundLoadCompeleteHandler);
            stSound.load(request);
         }
         this.m_strCurrentPlayType = strSoundName;
         this.m_stSoundChannel = this.StartPlaySound(this.m_dictSound[strSoundName],iLoops);
      }
      
      public function onPlayWeddingSound(strSoundName:String, bIsWaitEnd:Boolean = false, iLoops:int = 10000) : void
      {
         this.OnPlaySound(strSoundName,"wedding/",bIsWaitEnd,iLoops);
      }
      
      public function onPlayWorldBossSound() : void
      {
         this.OnPlaySound("wb_hall");
      }
      
      public function onPlayLobbyBgSound() : void
      {
         this.OnPlaySound("chengzhen_01");
      }
      
      public function onPlayGameReadySound() : void
      {
         this.OnPlaySound("dengdai_02");
      }
      
      public function onPlayVacationSound() : void
      {
         this.OnPlaySound("flashcity_ui");
      }
      
      private function StartPlaySound(stSound:Sound, iLoops:int = 10000) : SoundChannel
      {
         return stSound.play(0,iLoops,new SoundTransform(this.effectVolume.m_bgVolume));
      }
      
      private function SoundLoadCompeleteHandler(e:Event) : void
      {
         this.RemoveEventListener(e);
      }
      
      private function SoundLoadIoErrorHandler(e:Event) : void
      {
         var key:String = null;
         trace("SoundLoadIoErrorHandler: " + e);
         this.RemoveEventListener(e);
         var stTarget:Object = e.target;
         for(key in this.m_dictSound)
         {
            if(stTarget == this.m_dictSound[key])
            {
               this.m_dictSound[key] = null;
               break;
            }
         }
      }
      
      private function RemoveEventListener(e:Event) : void
      {
         e.target.removeEventListener(IOErrorEvent.IO_ERROR,this.SoundLoadIoErrorHandler);
         e.target.removeEventListener(Event.COMPLETE,this.SoundLoadCompeleteHandler);
      }
      
      private function StopChannel() : void
      {
         if(this.m_stSoundChannel != null)
         {
            this.ClearPlayNextSound();
            this.m_stSoundChannel.stop();
            this.m_stSoundChannel = null;
         }
      }
      
      public function onStopBgSound() : void
      {
         if(this.a_743)
         {
            this.StopChannel();
         }
      }
      
      public function onSetBgVolume(volume:Number) : void
      {
         this.effectVolume.m_bgVolume = volume;
         if(this.effectVolume.m_bgVolume == 0)
         {
            this.onStopBgSound();
            this.a_743 = false;
         }
         else
         {
            this.a_743 = true;
         }
         if(this.m_stSoundChannel != null)
         {
            this.m_stSoundChannel.soundTransform = new SoundTransform(this.effectVolume.m_bgVolume);
         }
         else if(null == this.m_strCurrentPlayType || this.m_strCurrentPlayType.length < 1)
         {
            this.onPlayGameReadySound();
         }
         else
         {
            this.OnPlaySound(this.m_strCurrentPlayType);
         }
      }
      
      public function onSetEffectVolume(volume:Number) : void
      {
         this.effectVolume.m_effectVolume = volume;
         if(volume == 0)
         {
            this.a_744 = false;
         }
         else
         {
            this.a_744 = true;
         }
      }
   }
}

