package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2726 implements CMessageBody
   {
      
      public var m_byCardsCount:int;
      
      public var m_arrCardIDInfos:Array;
      
      public var m_nPropCount:int;
      
      public var m_arrSelectProp:Array;
      
      public var m_nAvatarInfoSize:int;
      
      public var m_stAvatarInfoByteArray:ByteArray;
      
      public var m_nAvaterDefenseValue:int;
      
      public var m_nExpirenceAddition:int;
      
      public var m_nDropPropAddition:int;
      
      public var m_nSkillAddition:int;
      
      public var m_nGoldCoinAddition:int;
      
      public var m_iConistraID:int;
      
      public var m_iGunType:int;
      
      public var m_iGunSequence:int;
      
      public var m_iShieldType:int;
      
      public var m_iSuperGunType:int;
      
      public var m_iPetCount:int;
      
      public var m_iPetCheckInfo:int;
      
      public function a_2726()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         if(null == this.m_stAvatarInfoByteArray)
         {
            this.m_stAvatarInfoByteArray = new ByteArray();
         }
         this.m_stAvatarInfoByteArray.compress();
         this.m_nAvatarInfoSize = this.m_stAvatarInfoByteArray.length;
         var propertyArray:Array = [["m_byCardsCount","uint8"],["m_arrCardIDInfos",["object","com.aurora.protocol.game.maogoutd.CCardIDInfo","nosize"]],["m_nPropCount","int16"],["m_arrSelectProp",["object","com.aurora.protocol.game.maogoutd.CCardIDInfo","nosize"]],["m_nAvatarInfoSize","int16"],["m_stAvatarInfoByteArray","memory"],["m_nAvaterDefenseValue","int16"],["m_nExpirenceAddition","int16"],["m_nDropPropAddition","int16"],["m_nSkillAddition","int16"],["m_nGoldCoinAddition","int16"],["m_iConistraID","int32"],["m_iGunType","int32"],["m_iGunSequence","int32"],["m_iShieldType","int32"],["m_iSuperGunType","int32"],["m_iPetCount","int16"],["m_iPetCheckInfo","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byCardsCount","uint8"],["m_arrCardIDInfos",["object","com.aurora.protocol.game.maogoutd.CCardIDInfo","nosize"]],["m_nPropCount","int16"],["m_arrSelectProp",["object","com.aurora.protocol.game.maogoutd.CCardIDInfo","nosize"]],["m_nAvatarInfoSize","int16"],["m_stAvatarInfoByteArray","memory"],["m_nAvaterDefenseValue","int16"],["m_nExpirenceAddition","int16"],["m_nDropPropAddition","int16"],["m_nSkillAddition","int16"],["m_nGoldCoinAddition","int16"],["m_iConistraID","int32"],["m_iGunType","int32"],["m_iGunSequence","int32"],["m_iShieldType","int32"],["m_iSuperGunType","int32"],["m_iPetCount","int16"],["m_iPetCheckInfo","int32"]];
         a_2664.a_2666(this,propertyArray,byte_array,decode_length);
         this.m_stAvatarInfoByteArray.uncompress();
         this.m_nAvatarInfoSize = this.m_stAvatarInfoByteArray.length;
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

