package com.aurora.protocol.authen
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2663 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUIN:int;
      
      public var m_szAccount:String;
      
      public var m_nUserType:uint;
      
      public var m_szSessionKey:ByteArray;
      
      public var m_bySignatureLen:int;
      
      public var m_szPlayerSignature:ByteArray;
      
      public var m_szReasonMsg:String;
      
      public var m_szUrl:String;
      
      public function a_2663()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = null;
         if(this.m_nResultID == 0)
         {
            propertyArray = [["m_nResultID","int16"],["m_iUIN","int32"],["m_szAccount","string",64],["m_nUserType","int16"],["m_szSessionKey","memory",16,"nosize"],["m_bySignatureLen","int16"],["m_szPlayerSignature","memory"]];
         }
         else
         {
            propertyArray = [["m_nResultID","int16"],["m_szReasonMsg","string",2048],["m_szUrl","string",64]];
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray = [["m_iUIN","int32"],["m_szAccount","string",64],["m_nUserType","int16"],["m_szSessionKey","memory",16,"nosize"],["m_bySignatureLen","int16"],["m_szPlayerSignature","memory"]];
         }
         else
         {
            propertyArray = [["m_szReasonMsg","string",2048],["m_szUrl","string",64]];
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

