package com.aurora.protocol.hallserver.limitstore
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseQueryLimitItem implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCount:int;
      
      public var m_arrItemID:Array;
      
      public var m_arrNum:Array;
      
      public function CResponseQueryLimitItem()
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
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iCount = a_2664.decode_int32(byte_array);
         var temp:int = 0;
         this.m_arrItemID = [];
         this.m_arrNum = [];
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            temp = a_2664.decode_int32(byte_array);
            this.m_arrItemID.push(temp);
            temp = a_2664.decode_int32(byte_array);
            this.m_arrNum.push(temp);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

