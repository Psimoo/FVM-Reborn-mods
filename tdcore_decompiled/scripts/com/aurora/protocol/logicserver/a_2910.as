package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2910 implements CMessageBody
   {
      
      public var m_nSkillCount:int;
      
      public var m_arrUpdateSkillPoint:Array;
      
      private var stUpdateSkill:CUpdateSkillPoint;
      
      public function a_2910()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nSkillCount","int16"],["m_arrUpdateSkillPoint",["object","com.aurora.protocol.logicserver.CUpdateSkillPoint"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nSkillCount","int16"],["m_arrUpdateSkillPoint",["object","com.aurora.protocol.logicserver.CUpdateSkillPoint"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

