package a_4759
{
   import a_4722.a_1765;
   import a_4722.a_1771;
   import a_4788.a_4648;
   import com.aurora.protocol.common.a_2670;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class b_167 extends b_168 implements IProtocal
   {
      
      protected var mapDecodeRoutines:a_1771 = new a_1771();
      
      protected var pBaseProtocol:b_169;
      
      protected var a_787:a_1765 = new a_1765();
      
      public function b_167(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function a_2247(messageID:uint, fnRoutine:Function) : void
      {
         if(!this.mapDecodeRoutines.insert(messageID,fnRoutine))
         {
            trace("MessageId:" + messageID + " has been binded decode routine, insert failed");
         }
      }
      
      public function a_2246(baseProtocol:b_169) : void
      {
         if(null == baseProtocol)
         {
            this.pBaseProtocol = null;
            return;
         }
         this.pBaseProtocol = baseProtocol;
         this.pBaseProtocol.a_2202(this,this.mapDecodeRoutines.protocalMessageIDs);
      }
      
      public function a_2204(csPackageHeader:a_2670, protocalBuffer:ByteArray, stServerInfo:a_1765) : void
      {
         if(csPackageHeader == null || protocalBuffer == null)
         {
            trace("csPackageHeader is null or protocalBuffer is null, OnReceivePackage  failed");
         }
         this.a_787.m_iServerType = stServerInfo.m_iServerType;
         this.a_787.m_iServerID = stServerInfo.m_iServerID;
         if(null != this.mapDecodeRoutines[csPackageHeader.shMessageID])
         {
            this.mapDecodeRoutines[csPackageHeader.shMessageID](csPackageHeader,protocalBuffer);
            a_4648.a_4649("解析MessageID:" + csPackageHeader.shMessageID.toString(16) + "nPackageLength:" + csPackageHeader.nPackageLength);
            trace("解析MessageID:" + csPackageHeader.shMessageID.toString(16));
         }
         else
         {
            trace("Can\'t find the decodeRoutine for MessageID:" + csPackageHeader.shMessageID);
         }
         csPackageHeader = null;
         protocalBuffer = null;
      }
   }
}

