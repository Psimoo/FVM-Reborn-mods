package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2956 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoomID:int;
      
      public var m_iSrcUin:int;
      
      public var m_nCardListCount:int;
      
      public var m_aryCardList:Array;
      
      private var a_869:CCardList;
      
      public function a_2956()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var cardList:CCardList = null;
         var propertyArray:Array = [];
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iRoomID = a_2664.decode_int32(byte_array);
            this.m_iSrcUin = a_2664.decode_int32(byte_array);
            this.m_nCardListCount = a_2664.decode_int16(byte_array);
            this.m_aryCardList = [];
            for(index = 0; index < this.m_nCardListCount; index++)
            {
               cardList = new CCardList();
               cardList.decode(byte_array,decode_length);
               this.m_aryCardList.push(cardList);
            }
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

