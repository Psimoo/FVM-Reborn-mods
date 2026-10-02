package a_4789
{
   public interface IModulesBridge
   {
      
      function addListener(param1:Object, param2:Boolean = false) : void;
      
      function removeListener(param1:Object) : void;
      
      function removeAll() : void;
      
      function destroy() : void;
      
      function execute(param1:String, param2:Object, ... rest) : *;
   }
}

