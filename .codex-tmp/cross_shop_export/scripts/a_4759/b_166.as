package a_4759
{
   import com.aurora.protocol.common.a_2667;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class b_166 extends b_167
   {
      
      public function b_166(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function a_2224(authenPackageHeader:a_2667, protocalBuffer:ByteArray) : void
      {
         if(authenPackageHeader == null || authenPackageHeader == null)
         {
            trace("authenPackageHeader is null or protocalBuffer is null, OnReceiveAuthenPackage  failed");
         }
         if(null != mapDecodeRoutines[authenPackageHeader.shMessageID])
         {
            mapDecodeRoutines[authenPackageHeader.shMessageID](authenPackageHeader,protocalBuffer);
         }
         else
         {
            trace("Can\'t find the decodeRoutine for MessageID:" + authenPackageHeader.shMessageID);
         }
         authenPackageHeader = null;
         protocalBuffer = null;
      }
   }
}

