package a_4789
{
   import flash.external.ExternalInterface;
   
   public class AS2JSBridge
   {
      
      public function AS2JSBridge()
      {
         super();
      }
      
      public static function addCallback(listener:Object, funName:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback(funName,listener[funName]);
         }
      }
      
      public static function callFunction(funName:String, ... args) : *
      {
         if(args == null)
         {
            args = [];
         }
         args.unshift(funName);
         if(ExternalInterface.available)
         {
            return ExternalInterface.call.apply(null,args);
         }
         return null;
      }
   }
}

