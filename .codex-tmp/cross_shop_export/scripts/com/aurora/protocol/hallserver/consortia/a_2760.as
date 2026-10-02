package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2760 implements CMessageBody
   {
      
      public var m_nCount:int;
      
      public var m_aryItem:Array;
      
      public function a_2760()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var item:a_2784 = null;
         this.m_nCount = a_2664.decode_int16(byte_array);
         this.m_aryItem = new Array();
         for(var i:int = 0; i < this.m_nCount; i++)
         {
            item = new a_2784();
            item.decode(byte_array,0);
            this.m_aryItem.push(item);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

