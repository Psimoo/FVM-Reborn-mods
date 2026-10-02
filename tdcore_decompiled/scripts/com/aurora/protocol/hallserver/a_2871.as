package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2871 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iMoneyChange:int;
      
      public var m_nItemCount:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2871()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iMoneyChange","int32"]);
            propertyArray.push(["m_nItemCount","int16"]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

