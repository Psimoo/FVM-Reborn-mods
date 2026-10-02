package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2679 implements CMessageBody
   {
      
      public var m_iMyUin:int;
      
      public var m_nCount:int;
      
      public var m_aiUin:Array;
      
      public function a_2679()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMyUin","int32"],["m_nCount","int16"],["m_aiUin",["int32"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMyUin","int32"],["m_nCount","int16"],["m_aiUin",["int32"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

