package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2855 implements CMessageBody
   {
      
      public var m_iSkillID:int;
      
      public var m_iSkillUsed:int;
      
      public var m_iSkillOpened:int;
      
      public var m_nSkillLevel:int;
      
      public function a_2855()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSkillID","int32"],["m_iSkillUsed","int32"],["m_iSkillOpened","int32"],["m_nSkillLevel","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iSkillID = a_2664.decode_int32(byte_array);
         this.m_iSkillUsed = a_2664.decode_int32(byte_array);
         this.m_iSkillOpened = a_2664.decode_int32(byte_array);
         this.m_nSkillLevel = a_2664.decode_int16(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

