package a_4754
{
   import a_4739.a_1828;
   
   public class a_2159 extends a_1828
   {
      
      public static var e:a_2159 = new a_2159();
      
      public function a_2159()
      {
         super();
      }
      
      public function onButtonClick() : void
      {
         notify("onButtonClick");
      }
      
      public function onPlayLobbyBgSound() : void
      {
         notify("onPlayLobbyBgSound");
      }
      
      public function onStopBgSound() : void
      {
         notify("onStopBgSound");
      }
      
      public function onPlayGameReadySound() : void
      {
         notify("onPlayGameReadySound");
      }
      
      public function onPlayVacationSound() : void
      {
         notify("onPlayVacationSound");
      }
      
      public function onPlayWorldBossSound() : void
      {
         notify("onPlayWorldBossSound");
      }
      
      public function onSetBgVolume(volume:Number) : void
      {
         notify("onSetBgVolume",volume);
      }
      
      public function onSetEffectVolume(volume:Number) : void
      {
         notify("onSetEffectVolume",volume);
      }
   }
}

