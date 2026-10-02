package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifyPlayerUseSkill implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_iUseTimeNum:int;
      
      public var m_uiSkillID:uint;
      
      public var m_iRandomNum:int;
      
      public function CNotifyPlayerUseSkill()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_iUseTimeNum","int32"],["m_uiSkillID","uint32"],["m_iRandomNum","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_iUseTimeNum","int32"],["m_uiSkillID","uint32"],["m_iRandomNum","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

