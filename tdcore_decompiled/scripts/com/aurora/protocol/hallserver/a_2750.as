package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2750 implements CMessageBody
   {
      
      public var m_iActorUIN:int;
      
      public var m_szActorAccount:String;
      
      public var m_nReasonID:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2750()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iActorUIN","int32"],["m_szActorAccount","string",32],["m_nReasonID","int16"],["m_szReasonMessage","string",4096]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iActorUIN","int32"],["m_szActorAccount","string",32],["m_nReasonID","int16"],["m_szReasonMessage","string",4096]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

