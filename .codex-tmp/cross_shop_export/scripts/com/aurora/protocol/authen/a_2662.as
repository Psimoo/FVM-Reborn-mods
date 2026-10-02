package com.aurora.protocol.authen
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2662 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_szReasonMsg:String;
      
      public function a_2662()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID != 0)
         {
            propertyArray.push(["m_szReasonMsg","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID != 0)
         {
            propertyArray = [["m_szReasonMsg","string",2048]];
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

