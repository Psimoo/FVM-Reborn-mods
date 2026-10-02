package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCardList implements CMessageBody
   {
      
      public var m_nCardListID:int;
      
      public var m_szCardListName:String;
      
      public var m_szCardListContent:String;
      
      public function CCardList()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nCardListID","int32"],["m_szCardListName","string",64],["m_szCardListContent","string",512]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_nCardListID = a_2664.decode_int32(byte_array);
         this.m_szCardListName = a_2664.decode_string(byte_array,64);
         this.m_szCardListContent = a_2664.decode_string(byte_array,512);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

