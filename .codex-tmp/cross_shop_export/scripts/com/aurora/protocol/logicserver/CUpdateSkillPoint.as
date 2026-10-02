package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CUpdateSkillPoint implements CMessageBody
   {
      
      public var m_iSkillID:int;
      
      public var m_iPoint:int;
      
      public var m_cUpdateMode:int;
      
      public function CUpdateSkillPoint()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSkillID","int32"],["m_iPoint","int32"],["m_cUpdateMode","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSkillID","int32"],["m_iPoint","int32"],["m_cUpdateMode","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

