package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.CCardUpdatePosition;
   import flash.utils.ByteArray;
   
   public class a_2825 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_nItemCount:int;
      
      public var m_arrCardUpdatePosition:Array;
      
      private var stCardUpdatePosition:CCardUpdatePosition;
      
      public function a_2825()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_nItemCount","int16"]);
         propertyArray.push(["m_arrCardUpdatePosition",["object","com.aurora.protocol.logicserver.CCardUpdatePosition"]]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_nItemCount","int16"]);
         propertyArray.push(["m_arrCardUpdatePosition",["object","com.aurora.protocol.logicserver.CCardUpdatePosition"]]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

