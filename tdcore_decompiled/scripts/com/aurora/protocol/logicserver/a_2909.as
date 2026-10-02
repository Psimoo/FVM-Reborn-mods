package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2909 implements CMessageBody
   {
      
      public var m_iSkillID:int;
      
      public var m_iOpened:int;
      
      public var m_nSkillLevel:int;
      
      public function a_2909()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSkillID","int32"],["m_iOpened","int32"],["m_nSkillLevel","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSkillID","int32"],["m_iOpened","int32"],["m_nSkillLevel","int16"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

