package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CUpdateHeroInfo implements CMessageBody
   {
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nItemCount:int;
      
      public var m_nItemUsedCount:int;
      
      public var m_cTimeFlag:int;
      
      public var m_iExpiredTime:int;
      
      public var m_cUpdateMode:int;
      
      public var m_cIsBind:int;
      
      public var m_cItemColor:int;
      
      public var m_nItemExtraAttrCount:int;
      
      public var m_arrExtraAttr:Array;
      
      private var stHeroItemExtraAttr:CHeroItemExtraAttr;
      
      public function CUpdateHeroInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_iItemSeq","int32"],["m_nItemCount","int16"],["m_nItemUsedCount","int16"],["m_cTimeFlag","int8"],["m_iExpiredTime","int32"],["m_cUpdateMode","int8"],["m_cIsBind","int8"],["m_cItemColor","int8"],["m_nItemExtraAttrCount","int16"],["m_arrExtraAttr",["object","com.aurora.protocol.hallserver.CHeroItemExtraAttr"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_iItemSeq","int32"],["m_nItemCount","int16"],["m_nItemUsedCount","int16"],["m_cTimeFlag","int8"],["m_iExpiredTime","int32"],["m_cUpdateMode","int8"],["m_cIsBind","int8"],["m_cItemColor","int8"],["m_nItemExtraAttrCount","int16"],["m_arrExtraAttr",["object","com.aurora.protocol.hallserver.CHeroItemExtraAttr"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

