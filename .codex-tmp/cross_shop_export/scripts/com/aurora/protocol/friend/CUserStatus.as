package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CUserStatus implements CMessageBody
   {
      
      public var m_iGameID:int;
      
      public var m_nServerID:int;
      
      public var m_nRoomID:int;
      
      public var m_nTableID:int;
      
      public var m_iSeatID:int;
      
      public var m_iState:int;
      
      public var m_szPath:String;
      
      public function CUserStatus()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iGameID","int16"],["m_nServerID","int32"],["m_nRoomID","int32"],["m_nTableID","int32"],["m_iSeatID","int8"],["m_iState","int8"],["m_szPath","string",256]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var size:int = a_2664.decode_int16(byte_array);
         this.m_iGameID = a_2664.decode_int16(byte_array);
         this.m_nServerID = a_2664.decode_int32(byte_array);
         this.m_nRoomID = a_2664.decode_int32(byte_array);
         this.m_nTableID = a_2664.decode_int32(byte_array);
         this.m_iSeatID = a_2664.decode_int8(byte_array);
         this.m_iState = a_2664.decode_int8(byte_array);
         this.m_szPath = a_2664.decode_string(byte_array,256);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

