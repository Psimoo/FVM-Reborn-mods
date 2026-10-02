package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseMsgGetWorldBossShop implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCookieT:int;
      
      public var m_iCookieM:int;
      
      public var m_iCookieY:int;
      
      public var m_iCrossCount:int;
      
      public var m_aCrossItemID:Array;
      
      public var m_aCrossNumber:Array;
      
      public var m_iCount:int;
      
      public var m_aItemID:Array;
      
      public var m_aNumber:Array;
      
      public function CResponseMsgGetWorldBossShop()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var temp:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iCookieT = a_2664.decode_int32(byte_array);
         this.m_iCookieM = a_2664.decode_int32(byte_array);
         this.m_iCookieY = a_2664.decode_int32(byte_array);
         this.m_iCrossCount = a_2664.decode_int32(byte_array);
         this.m_aCrossItemID = [];
         this.m_aCrossNumber = [];
         for(i = 0; i < this.m_iCrossCount; i++)
         {
            temp = a_2664.decode_int32(byte_array);
            this.m_aCrossItemID.push(temp);
            temp = a_2664.decode_int32(byte_array);
            this.m_aCrossNumber.push(temp);
         }
         this.m_aItemID = [];
         this.m_aNumber = [];
         this.m_iCount = a_2664.decode_int32(byte_array);
         for(i = 0; i < this.m_iCount; i++)
         {
            temp = a_2664.decode_int32(byte_array);
            this.m_aItemID.push(temp);
            temp = a_2664.decode_int32(byte_array);
            this.m_aNumber.push(temp);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

