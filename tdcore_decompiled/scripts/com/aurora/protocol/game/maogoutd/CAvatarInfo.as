package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CAvatarInfo implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_nMemorySize:uint;
      
      public var m_byarrPlayerAvatarInfoByteArray:ByteArray;
      
      public var m_byCardsCount:int;
      
      public var m_arrGameCardInfoArray:Array;
      
      public var m_isAutoPickUpEnergy:Boolean;
      
      public var m_isAutoPickUpProps:Boolean;
      
      public var m_nWeaponSkillCount:int;
      
      public var m_arrWeaponSkillInfo:Array;
      
      private var a_851:CGameCardInfo;
      
      private var m_stWeaponSkillInfo:CWeaponSkillInfo;
      
      public function CAvatarInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         this.m_byarrPlayerAvatarInfoByteArray.compress();
         this.m_nMemorySize = this.m_byarrPlayerAvatarInfoByteArray.length;
         var propertyArray:Array = [["m_bySeatID","int8"],["m_nMemorySize","uint16"],["m_byarrPlayerAvatarInfoByteArray","memory"],["m_byCardsCount","int8"],["m_arrGameCardInfoArray",["object","com.aurora.protocol.game.maogoutd.CGameCardInfo","nosize"]],["m_isAutoPickUpEnergy","int8"],["m_isAutoPickUpProps","int8"],["m_nWeaponSkillCount","int16"],["m_arrWeaponSkillInfo",["object","com.aurora.protocol.game.maogoutd.CWeaponSkillInfo","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_nMemorySize","uint16"],["m_byarrPlayerAvatarInfoByteArray","memory"],["m_byCardsCount","int8"],["m_arrGameCardInfoArray",["object","com.aurora.protocol.game.maogoutd.CGameCardInfo","nosize"]],["m_isAutoPickUpEnergy","int8"],["m_isAutoPickUpProps","int8"],["m_nWeaponSkillCount","int16"],["m_arrWeaponSkillInfo",["object","com.aurora.protocol.game.maogoutd.CWeaponSkillInfo","nosize"]]];
         a_2664.a_2666(this,propertyArray,byte_array,decode_length);
         this.m_byarrPlayerAvatarInfoByteArray.uncompress();
         this.m_nMemorySize = this.m_byarrPlayerAvatarInfoByteArray.length;
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

