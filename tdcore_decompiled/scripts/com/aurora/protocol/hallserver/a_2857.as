package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2857 implements CMessageBody
   {
      
      public var m_nItemCount:int;
      
      public var m_iSrcUIN:int;
      
      public var m_szSrcAccount:String;
      
      public var m_szSrcNick:String;
      
      public var m_cSrcGender:int;
      
      public var m_nGameID:int;
      
      public var m_szMessageString:String;
      
      public function a_2857()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nItemCount","int16"],["m_iSrcUIN","int32"],["m_szSrcAccount","string",48],["m_szSrcNick","string",64],["m_cSrcGender","int8"],["m_nGameID","int16"],["m_szMessageString","string",302]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nItemCount","int16"],["m_iSrcUIN","int32"],["m_szSrcAccount","string",48],["m_szSrcNick","string",64],["m_cSrcGender","int8"],["m_nGameID","int16"],["m_szMessageString","string",302]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

