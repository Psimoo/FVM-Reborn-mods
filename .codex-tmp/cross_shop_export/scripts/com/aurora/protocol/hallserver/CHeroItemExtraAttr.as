package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CHeroItemExtraAttr implements CMessageBody
   {
      
      public var m_cItemType:int;
      
      public var m_iItemAdd:int;
      
      public var m_iSkillID:int;
      
      public var m_iPosition:int;
      
      public function CHeroItemExtraAttr()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_cItemType = a_2664.decode_int8(byte_array);
         this.m_iItemAdd = a_2664.decode_int32(byte_array);
         this.m_iSkillID = a_2664.decode_int32(byte_array);
         this.m_iPosition = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

