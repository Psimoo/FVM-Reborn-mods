package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWebBaseInfo implements CMessageBody
   {
      
      public var m_szNickName:String;
      
      public var m_nFlag:int;
      
      public var m_nFaceID:int;
      
      public var m_iFaceVersion:int;
      
      public var m_szSmallFaceURL:String;
      
      public var m_szMiddleFaceURL:String;
      
      public var m_szLargeFaceURL:String;
      
      public function CWebBaseInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_szNickName","string",64],["m_nFlag","int16"],["m_nFaceID","int16"],["m_iFaceVersion","int32"],["m_szSmallFaceURL","string",256],["m_szMiddleFaceURL","string",256],["m_szLargeFaceURL","string",256]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_szNickName","string",64],["m_nFlag","int16"],["m_nFaceID","int16"],["m_iFaceVersion","int32"],["m_szSmallFaceURL","string",256],["m_szMiddleFaceURL","string",256],["m_szLargeFaceURL","string",256]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

