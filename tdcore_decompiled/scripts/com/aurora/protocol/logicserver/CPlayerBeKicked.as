package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPlayerBeKicked implements CMessageBody
   {
      
      public var m_byKickReason:int;
      
      public var m_iKickerID:int;
      
      public var m_iVictimID:int;
      
      public var m_iTableID:int;
      
      public var m_bySeat:int;
      
      public var m_byMMCount:int;
      
      public var m_bySeatCount:int;
      
      public var m_byValidCount:int;
      
      public var m_szReasonMessage:String;
      
      public function CPlayerBeKicked()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byKickReason","int8"],["m_iKickerID","int32"],["m_iVictimID","int32"],["m_iTableID","int32"],["m_bySeat","int8"],["m_byMMCount","int8"],["m_bySeatCount","int8"],["m_byValidCount","int8"],["m_szReasonMessage","string",64]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_byKickReason = a_2664.decode_int8(byte_array);
         this.m_iKickerID = a_2664.decode_int32(byte_array);
         this.m_iVictimID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_bySeat = a_2664.decode_int8(byte_array);
         this.m_byMMCount = a_2664.decode_int8(byte_array);
         this.m_bySeatCount = a_2664.decode_int8(byte_array);
         this.m_byValidCount = a_2664.decode_int8(byte_array);
         this.m_szReasonMessage = a_2664.decode_string(byte_array,64);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

