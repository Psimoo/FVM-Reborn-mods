package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2934 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iSrcUin:int;
      
      public var m_iDstUin:int;
      
      public var m_nCardCount:int;
      
      public var m_arrUpdateCardInfo:Array;
      
      private var a_872:CCardUpdateInfo;
      
      public function a_2934()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iRoomID","int32"]);
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_iDstUin","int32"]);
         propertyArray.push(["m_nCardCount","int16"]);
         propertyArray.push(["m_arrUpdateCardInfo",["object","com.aurora.protocol.logicserver.CCardUpdateInfo"]]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iRoomID","int32"]);
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_iDstUin","int32"]);
         propertyArray.push(["m_nCardCount","int16"]);
         propertyArray.push(["m_arrUpdateCardInfo",["object","com.aurora.protocol.logicserver.CCardUpdateInfo"]]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

