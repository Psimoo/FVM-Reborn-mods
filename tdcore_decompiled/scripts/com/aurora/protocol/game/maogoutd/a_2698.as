package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2698 implements CMessageBody
   {
      
      public var m_nGameMode:int;
      
      public var m_nSelectCardIDCount:int;
      
      public var m_arrSelectCardIDs:Array;
      
      public var m_nSelectPropIDCount:int;
      
      public var m_arrSelectPropIDs:Array;
      
      public var m_nAvatarInfoCount:int;
      
      public var m_arrAvatarInfoArray:Array;
      
      private var a_855:CAvatarInfo;
      
      public var m_RandomSeed:int;
      
      public function a_2698()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nGameMode","int16"],["m_nSelectCardIDCount","int16"],["m_arrSelectCardIDs",["uint32"]],["m_nSelectPropIDCount","int16"],["m_arrSelectPropIDs",["uint32"]],["m_nAvatarInfoCount","int16"],["m_arrAvatarInfoArray",["object","com.aurora.protocol.game.maogoutd.CAvatarInfo","nosize"]],["m_RandomSeed","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nGameMode","int16"],["m_nSelectCardIDCount","int16"],["m_arrSelectCardIDs",["uint32"]],["m_nSelectPropIDCount","int16"],["m_arrSelectPropIDs",["uint32"]],["m_nAvatarInfoCount","int16"],["m_arrAvatarInfoArray",["object","com.aurora.protocol.game.maogoutd.CAvatarInfo","nosize"]],["m_RandomSeed","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

