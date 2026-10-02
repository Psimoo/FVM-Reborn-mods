package a_4764
{
   import a_4716.b_154;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4759.b_167;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.hallserver.consortia.a_2789;
   import com.aurora.protocol.hallserver.consortia.a_2790;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class b_173 extends b_167
   {
      
      private static var _instance:b_173;
      
      public function b_173(target:IEventDispatcher = null)
      {
         super(target);
         this.init();
      }
      
      public static function getInstance() : b_173
      {
         if(null == _instance)
         {
            _instance = new b_173();
         }
         return _instance;
      }
      
      private function init() : void
      {
         a_2247(b_154.a_196,this.a_2308);
         a_2247(b_154.a_198,this.OnNotifyTransferConsortiaMsg);
      }
      
      private function a_2308(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2789 = new a_2789();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCNotifyConsortiaEvent failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_682);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnNotifyTransferConsortiaMsg(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2790 = new a_2790();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCNotifyTransferConsortiaMsg failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_684);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
   }
}

