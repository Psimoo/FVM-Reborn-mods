package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2822 implements CMessageBody
   {
      
      public var m_iLobbyVersion:int;
      
      public var m_szAccount:String;
      
      public var m_cClientType:int;
      
      public var m_nFlag:int;
      
      public var m_lMacAddr:int;
      
      public var m_iLoginDuration:int;
      
      public var m_szCurrentTime:String;
      
      public var m_szExtSign:String;
      
      public function a_2822()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         trace("1111111");
         var propertyArray:Array = [["m_iLobbyVersion","int32"],["m_szAccount","string",64],["m_cClientType","int8"],["m_nFlag","int16"],["m_lMacAddr","int64"],["m_iLoginDuration","int32"],["m_szCurrentTime","string",64],["m_szExtSign","string",64]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iLobbyVersion","int32"],["m_szAccount","string",64],["m_cClientType","int8"],["m_nFlag","int16"],["m_lMacAddr","int64"],["m_iLoginDuration","int32"],["m_szCurrentTime","string",64],["m_szExtSign","string",64]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

