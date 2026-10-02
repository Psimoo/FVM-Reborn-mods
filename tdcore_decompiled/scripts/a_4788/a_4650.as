package a_4788
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class a_4650 extends EventDispatcher
   {
      
      private static var sign:Boolean;
      
      private static var _instance:a_4650;
      
      public static const KICK_OUT:String = "kickOut";
      
      private var conn:LocalConnection;
      
      private var test_conn:LocalConnection;
      
      private var host_id:int;
      
      private var isConnected:Boolean = false;
      
      private var sitetype:String;
      
      public function a_4650()
      {
         super(null);
         if(!sign)
         {
            throw new Error("请通过getInstance()方法获取引用！");
         }
      }
      
      public static function getInstance() : a_4650
      {
         if(null == _instance)
         {
            sign = true;
            _instance = new a_4650();
            sign = false;
         }
         return _instance;
      }
      
      public function detect(sitetype:String) : void
      {
         if(sitetype == "123u")
         {
            return;
         }
         if(null == this.conn)
         {
            this.lcInit();
            setTimeout(this.detect,1000,sitetype);
            this.conecting(sitetype);
            return;
         }
         if(null == this.test_conn)
         {
            this.test_conn = new LocalConnection();
            this.test_conn.addEventListener(StatusEvent.STATUS,this.onSendStatus);
         }
         this.test_conn.send("_" + sitetype + "1888","kickOutHandle",this.host_id);
      }
      
      public function kickOutHandle(id:int) : void
      {
         if(id != this.host_id)
         {
            this.conn.close();
            dispatchEvent(new Event(KICK_OUT));
         }
      }
      
      private function lcInit() : void
      {
         this.conn = new LocalConnection();
         this.conn.allowDomain("*");
         this.conn.allowInsecureDomain("*");
         this.conn.client = this;
      }
      
      private function conecting(sitetype:String) : void
      {
         if(!this.isConnected)
         {
            try
            {
               this.conn.connect("_" + sitetype + "1888");
            }
            catch(error:ArgumentError)
            {
               trace("Can\'t connect...the connection name is already being used by another SWF");
               setTimeout(conecting,1000,sitetype);
               return;
            }
            this.isConnected = true;
            this.host_id = getTimer();
         }
      }
      
      private function onSendStatus(a_4730:StatusEvent) : void
      {
         switch(a_4730.level)
         {
            case "status":
               trace("LocalConnection.send() succeeded");
               break;
            case "error":
               trace("LocalConnection.send() failed");
         }
      }
   }
}

