package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2864 implements CMessageBody
   {
      
      public var m_nItemCount:int = 1;
      
      public var m_nGameID:int;
      
      public var m_szSpeakerMessage:String;
      
      public var m_cCryptSize:int = 0;
      
      public var m_szCryptString:String = "";
      
      public function a_2864()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nItemCount","int16"],["m_nGameID","int16"],["m_szSpeakerMessage","string",302],["m_cCryptSize","int8"],["m_szCryptString","string",128]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

