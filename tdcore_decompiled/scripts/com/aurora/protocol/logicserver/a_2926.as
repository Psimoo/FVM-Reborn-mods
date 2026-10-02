package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2926 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_nGameDataLength:int;
      
      public var m_szGameData:ByteArray;
      
      public function a_2926()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iRoomID);
         a_2664.encode_int32(byte_array,this.m_iTableID);
         a_2664.encode_int16(byte_array,this.m_nGameDataLength);
         a_2664.encode_memory(byte_array,this.m_szGameData,4096);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoomID","int32"],["m_iTableID","int32"],["m_nGameDataLength","int16"],["m_szGameData","memory",4096]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

