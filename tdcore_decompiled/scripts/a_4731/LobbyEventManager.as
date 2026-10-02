package a_4731
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public final class LobbyEventManager extends EventDispatcher
   {
      
      private static var ms_instance:LobbyEventManager;
      
      public function LobbyEventManager(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public static function Get() : LobbyEventManager
      {
         return ms_instance || (ms_instance = new LobbyEventManager());
      }
   }
}

