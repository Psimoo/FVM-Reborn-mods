package com.aurora.protocol.hallserver
{
   import a_4716.a_1731;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2751 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iFlag:int;
      
      public var m_iMoney:int;
      
      public var m_lHappyBean:Number;
      
      public var m_iCharming:int;
      
      public var m_iLottery:int;
      
      public var m_iLastOfflineCharming:int;
      
      public var m_iTotalCharm:int;
      
      public var m_iCharmCoin:int;
      
      public var m_nServerDataCount:int;
      
      public var m_arrServiceData:Array;
      
      public var m_stVIP:a_2872;
      
      public var m_nGameDataCount:int;
      
      public var m_arrGameData:Array;
      
      public var m_szReasonMsg:String;
      
      public var m_iWarriorProgress:int;
      
      public var m_iTotalMoneyConsume:int;
      
      public var m_iWishingTalisman:int;
      
      public var m_iDataReversed:int;
      
      public function a_2751()
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
         var serviceData:a_2854 = null;
         var dbGameData:a_2745 = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iFlag = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            index = 0;
            if(this.m_iFlag & a_1731.a_338)
            {
               this.m_iMoney = a_2664.decode_int32(byte_array);
               this.m_lHappyBean = a_2664.decode_int64(byte_array);
               this.m_iCharming = a_2664.decode_int32(byte_array);
               this.m_iLottery = a_2664.decode_int32(byte_array);
               this.m_iLastOfflineCharming = a_2664.decode_int32(byte_array);
               this.m_iTotalCharm = a_2664.decode_int32(byte_array);
               this.m_iCharmCoin = a_2664.decode_int32(byte_array);
            }
            if(this.m_iFlag & a_1731.a_339)
            {
               this.m_nServerDataCount = a_2664.decode_int16(byte_array);
               this.m_arrServiceData = [];
               for(index = 0; index < this.m_nServerDataCount; index++)
               {
                  serviceData = new a_2854();
                  serviceData.decode(byte_array,decode_length);
                  this.m_arrServiceData.push(serviceData);
               }
            }
            this.m_stVIP = new a_2872();
            this.m_stVIP.decode(byte_array,decode_length);
            this.m_iWarriorProgress = a_2664.decode_int32(byte_array);
            this.m_iTotalMoneyConsume = a_2664.decode_int32(byte_array);
            this.m_iWishingTalisman = a_2664.decode_int32(byte_array);
            this.m_iDataReversed = a_2664.decode_int32(byte_array);
            if(this.m_iFlag & a_1731.FLAG_GAME)
            {
               this.m_nGameDataCount = a_2664.decode_int16(byte_array);
               this.m_arrGameData = [];
               for(index = 0; index < this.m_nGameDataCount; index++)
               {
                  dbGameData = new a_2745();
                  dbGameData.decode(byte_array,decode_length,this.m_iFlag);
                  this.m_arrGameData.push(dbGameData);
               }
            }
         }
         else
         {
            this.m_szReasonMsg = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

