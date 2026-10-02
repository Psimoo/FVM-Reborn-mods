package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseCrossRoomList implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iSearchID:int;
      
      public var m_iRoomCount:int;
      
      public var m_vRoomInfo:Vector.<CrossRoomInfo>;
      
      public function CResponseCrossRoomList()
      {
         super();
         this.m_vRoomInfo = new Vector.<CrossRoomInfo>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stRoomInfo:CrossRoomInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_iSearchID = a_2664.decode_int32(byte_array);
         this.m_iRoomCount = a_2664.decode_int16(byte_array);
         this.m_vRoomInfo.length = 0;
         for(var i:int = 0; i < this.m_iRoomCount; i++)
         {
            stRoomInfo = new CrossRoomInfo();
            stRoomInfo.decode(byte_array,0);
            this.m_vRoomInfo.push(stRoomInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

