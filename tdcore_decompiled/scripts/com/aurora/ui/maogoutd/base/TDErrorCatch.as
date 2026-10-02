package com.aurora.ui.maogoutd.base
{
   import flash.events.UncaughtErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class TDErrorCatch
   {
      
      public function TDErrorCatch()
      {
         super();
      }
      
      public static function onUncaughtError(e:UncaughtErrorEvent) : void
      {
         var err:Error = null;
         trace("发生全局异常3");
         if(e.error is Error)
         {
            err = Error(e.error);
            trace(err.name);
            trace(err.message);
            trace(err.getStackTrace());
            UploadError(err);
         }
         else
         {
            trace(e.error);
         }
      }
      
      public static function UploadError(err:Error) : void
      {
         var request:URLRequest = new URLRequest("http://10.80.0.2:8080/log");
         request.method = URLRequestMethod.POST;
         var vars:URLVariables = new URLVariables();
         vars.name = err.name;
         vars.message = err.message;
         vars.stack = err.getStackTrace();
         request.data = vars;
         new URLLoader().load(request);
      }
   }
}

