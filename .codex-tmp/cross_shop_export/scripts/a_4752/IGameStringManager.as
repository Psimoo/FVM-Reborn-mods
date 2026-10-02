package a_4752
{
   import flash.events.IEventDispatcher;
   
   public interface IGameStringManager extends IEventDispatcher
   {
      
      function getString(param1:int, param2:Array = null) : String;
      
      function getHolder() : String;
      
      function setString(param1:XML) : void;
      
      function loadString(param1:String) : void;
      
      function replaceString(param1:String, param2:Array = null, param3:String = null) : String;
      
      function GetServerCodeMessage(param1:int) : String;
   }
}

