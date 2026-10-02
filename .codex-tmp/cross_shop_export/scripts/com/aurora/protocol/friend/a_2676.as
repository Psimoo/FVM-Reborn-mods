package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2676 implements CMessageBody
   {
      
      public var m_nUin:int;
      
      public var m_szAccount:String;
      
      public var m_byClassCount:int;
      
      public var m_arrStateData:Array;
      
      private var stStateData:CStateData;
      
      public function a_2676()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nUin","int32"],["m_szAccount","string",32],["m_byClassCount","int8"],["m_arrStateData",["object","com.aurora.protocol.friend.CStateData"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nUin","int32"],["m_szAccount","string",32],["m_byClassCount","int8"],["m_arrStateData",["object","com.aurora.protocol.friend.CStateData"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

