package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CEntityStateChange implements CMessageBody
   {
      
      public var m_iGlobalID:int;
      
      public var m_iType:int;
      
      public var m_iTypeID:int;
      
      public var key:int;
      
      public var value:int;
      
      public function CEntityStateChange()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iGlobalID);
         a_2664.encode_int8(byte_array,this.m_iType);
         a_2664.encode_int32(byte_array,this.m_iTypeID);
         a_2664.encode_int32(byte_array,this.key);
         a_2664.encode_int32(byte_array,this.value);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iGlobalID = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int8(byte_array);
         this.m_iTypeID = a_2664.decode_int32(byte_array);
         this.key = a_2664.decode_int32(byte_array);
         this.value = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

