package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2902 implements CMessageBody
   {
      
      public var m_nCtrlCmd:int;
      
      public var m_iSrcUin:int;
      
      public var m_szSrcAccount:String;
      
      public var m_szMessage:String;
      
      public function a_2902()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nCtrlCmd","int16"],["m_iSrcUin","int32"],["m_szSrcAccount","string",32],["m_szMessage","string",1024]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nCtrlCmd","int16"],["m_iSrcUin","int32"],["m_szSrcAccount","string",32],["m_szMessage","string",1024]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

