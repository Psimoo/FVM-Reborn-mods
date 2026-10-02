package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2905 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iGodID:int;
      
      public var m_nReasonID:int;
      
      public var m_szReasonMsg:String;
      
      public function a_2905()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoomID","int32"],["m_iGodID","int32"],["m_nReasonID","int16"],["m_szReasonMsg","string",2048]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoomID","int32"],["m_iGodID","int32"],["m_nReasonID","int16"],["m_szReasonMsg","string",2048]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

