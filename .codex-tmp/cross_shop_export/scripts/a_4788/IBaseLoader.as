package a_4788
{
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public interface IBaseLoader extends IEventDispatcher
   {
      
      function load(param1:URLRequest = null, param2:String = null, param3:LoaderContext = null) : void;
      
      function close() : void;
      
      function set requestTimeout(param1:int) : void;
      
      function get requestTimeout() : int;
      
      function set tempData(param1:Object) : void;
      
      function get tempData() : Object;
   }
}

