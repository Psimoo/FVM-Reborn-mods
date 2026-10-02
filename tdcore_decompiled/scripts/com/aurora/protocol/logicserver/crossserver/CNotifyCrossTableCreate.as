package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.u321.go.xutils.ObjectPool;
   import flash.utils.ByteArray;
   
   public class CNotifyCrossTableCreate implements CMessageBody
   {
      
      public var m_nCount:int;
      
      public var m_vCrossRoomInfo:Vector.<CrossRoomInfo>;
      
      public function CNotifyCrossTableCreate()
      {
         super();
         this.m_vCrossRoomInfo = new Vector.<CrossRoomInfo>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var info:CrossRoomInfo = null;
         this.m_vCrossRoomInfo.length = 0;
         this.m_nCount = a_2664.decode_int16(byte_array);
         for(var i:int = 0; i < this.m_nCount; i++)
         {
            info = ObjectPool.CheckOut(CrossRoomInfo) as CrossRoomInfo;
            info.decode(byte_array,0);
            this.m_vCrossRoomInfo.push(info);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

