package com.aurora.protocol.hallserver.Message.stroeBox
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestUpdateStoreBox implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_icBoxIndex:int;
      
      public var m_nCardCount:int;
      
      public var m_arrCardUpdatePosition:Array;
      
      public function CRequestUpdateStoreBox()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_icBoxIndex","int8"]);
         propertyArray.push(["m_nCardCount","int16"]);
         propertyArray.push(["m_arrCardUpdatePosition",["object","com.aurora.protocol.hallserver.Message.stroeBox.CUpdateBoxInfo"]]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_icBoxIndex","int8"]);
         propertyArray.push(["m_nCardCount","int16"]);
         propertyArray.push(["m_arrCardUpdatePosition",["object","com.aurora.protocol.hallserver.Message.stroeBox.CUpdateBoxInfo"]]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

