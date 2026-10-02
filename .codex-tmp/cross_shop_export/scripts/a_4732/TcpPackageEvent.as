package a_4732
{
   import a_4722.a_1765;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class TcpPackageEvent extends Event
   {
      
      public var a_787:a_1765;
      
      public var m_stKeyInfo:ByteArray;
      
      public var packageBytes:ByteArray;
      
      public function TcpPackageEvent(type:String, stServerInfo:a_1765, stKeyInfo:ByteArray, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this.packageBytes = new ByteArray();
         this.a_787 = new a_1765();
         this.a_787.m_iServerType = stServerInfo.m_iServerType;
         this.a_787.m_iServerID = stServerInfo.m_iServerID;
         this.m_stKeyInfo = stKeyInfo;
      }
      
      override public function clone() : Event
      {
         var newPackageEvent:TcpPackageEvent = new TcpPackageEvent(this.type,this.a_787,this.m_stKeyInfo,this.bubbles,this.cancelable);
         this.packageBytes.writeBytes(newPackageEvent.packageBytes,0,this.packageBytes.bytesAvailable);
         return newPackageEvent;
      }
   }
}

