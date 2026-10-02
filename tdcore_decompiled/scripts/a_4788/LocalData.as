package a_4788
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   
   public class LocalData extends EventDispatcher
   {
      
      private static const FILE_NAME:String = "msdzls";
      
      private static const REQUEST_SIZE:int = 5 * 1024 * 1024;
      
      public function LocalData(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function writeAndSave(data:Object, fn:String, path:String = null) : void
      {
         var flushStatus:String;
         var mySo:SharedObject = null;
         var size:int = REQUEST_SIZE;
         try
         {
            fn = this.getLawfulName(fn);
            mySo = SharedObject.getLocal(FILE_NAME,path);
         }
         catch(e:Error)
         {
            return;
         }
         mySo.data[fn] = data;
         flushStatus = null;
         try
         {
            flushStatus = mySo.flush(size);
         }
         catch(error:Error)
         {
         }
         if(flushStatus != null)
         {
            switch(flushStatus)
            {
               case SharedObjectFlushStatus.PENDING:
                  mySo.addEventListener(NetStatusEvent.NET_STATUS,this.onFlushStatus);
                  break;
               case SharedObjectFlushStatus.FLUSHED:
            }
         }
      }
      
      public function read(fn:String, path:String = null) : Object
      {
         var mySo:SharedObject = null;
         var d:Object = null;
         try
         {
            fn = this.getLawfulName(fn);
            mySo = SharedObject.getLocal(FILE_NAME,path);
            if(mySo.data[fn] != undefined || mySo.data[fn] != null)
            {
               d = mySo.data[fn];
            }
            else
            {
               d = {};
            }
            mySo.close();
         }
         catch(e:Error)
         {
         }
         return d;
      }
      
      private function onFlushStatus(a_4730:NetStatusEvent) : void
      {
         switch(a_4730.info.code)
         {
            case "SharedObject.Flush.Success":
            case "SharedObject.Flush.Failed":
         }
         a_4730.target.removeEventListener(NetStatusEvent.NET_STATUS,this.onFlushStatus);
      }
      
      private function getLawfulName(n:String) : String
      {
         var reg:RegExp = /[\~\%\&\\\;\:\"\'\,\<\>\?\#]/ig;
         return n.replace(reg,"-");
      }
   }
}

