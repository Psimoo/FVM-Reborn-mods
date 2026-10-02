package com.aurora.protocol.game.maogoutd
{
   import a_4715.EncrypIntEx;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CGameCardInfo implements CMessageBody
   {
      
      private var m_iCardIDEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_byCardDegreeLevelEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_byCardSkillLevelEx:EncrypIntEx = new EncrypIntEx(0);
      
      public var m_byCardGradeLevel:int;
      
      public function CGameCardInfo()
      {
         super();
      }
      
      public function get m_iCardID() : int
      {
         return this.m_iCardIDEx.Value;
      }
      
      public function set m_iCardID(iValue:int) : void
      {
         this.m_iCardIDEx.Value = iValue;
      }
      
      public function get m_byCardDegreeLevel() : int
      {
         return this.m_byCardDegreeLevelEx.Value;
      }
      
      public function set m_byCardDegreeLevel(iValue:int) : void
      {
         this.m_byCardDegreeLevelEx.Value = iValue;
      }
      
      public function get m_byCardSkillLevel() : int
      {
         return this.m_byCardSkillLevelEx.Value;
      }
      
      public function set m_byCardSkillLevel(iValue:int) : void
      {
         this.m_byCardSkillLevelEx.Value = iValue;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_byCardDegreeLevel","int8"],["m_byCardSkillLevel","int8"],["m_byCardGradeLevel","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_byCardDegreeLevel","int8"],["m_byCardSkillLevel","int8"],["m_byCardGradeLevel","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

