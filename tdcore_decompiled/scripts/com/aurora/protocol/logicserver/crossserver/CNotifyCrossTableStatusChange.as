package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.u321.go.xutils.ObjectPool;
   import flash.utils.ByteArray;
   
   public class CNotifyCrossTableStatusChange implements CMessageBody
   {
      
      public var m_nCount:int;
      
      public var m_vTableStatusInfo:Vector.<TableStatusInfo>;
      
      public function CNotifyCrossTableStatusChange()
      {
         super();
         this.m_vTableStatusInfo = new Vector.<TableStatusInfo>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stTableStatusInfo:TableStatusInfo = null;
         this.m_nCount = a_2664.decode_int16(byte_array);
         this.m_vTableStatusInfo.length = 0;
         for(var i:int = 0; i < this.m_nCount; i++)
         {
            stTableStatusInfo = ObjectPool.CheckOut(TableStatusInfo) as TableStatusInfo;
            stTableStatusInfo.decode(byte_array,0);
            this.m_vTableStatusInfo.push(stTableStatusInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

