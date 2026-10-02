package com.aurora.protocol.hallserver.auction
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.mail.CMailItem;
   import flash.utils.ByteArray;
   
   public class CTradeItem implements CMessageBody
   {
      
      public var m_iTradeIDHigh:int;
      
      public var m_iTradeIDLow:int;
      
      public var m_iSrcGroupID:int;
      
      public var m_iSrcUin:int;
      
      public var m_szSrcName:String;
      
      public var m_iDstGroupID:int;
      
      public var m_iDstUin:int;
      
      public var m_szDstName:String;
      
      public var m_stMailItem:CMailItem;
      
      public var m_iMoneyType:int;
      
      public var a_1074:int;
      
      public var m_iTradeType:int;
      
      public var m_iCreateTimestamp:int;
      
      public var m_iExpiredTimestamp:int;
      
      public var m_iOperatedTimestampBuy:int;
      
      public var m_iOperatedTimestampCancel:int;
      
      public function CTradeItem()
      {
         super();
         this.m_stMailItem = new CMailItem();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iTradeIDHigh);
         a_2664.encode_int32(byte_array,this.m_iTradeIDLow);
         a_2664.encode_int32(byte_array,this.m_iSrcGroupID);
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_string(byte_array,this.m_szSrcName,32);
         a_2664.encode_int32(byte_array,this.m_iDstGroupID);
         a_2664.encode_int32(byte_array,this.m_iDstUin);
         a_2664.encode_string(byte_array,this.m_szDstName,32);
         this.m_stMailItem.encode(byte_array,0);
         a_2664.encode_int32(byte_array,this.m_iMoneyType);
         a_2664.encode_int32(byte_array,this.a_1074);
         a_2664.encode_int32(byte_array,this.m_iTradeType);
         a_2664.encode_int32(byte_array,this.m_iCreateTimestamp);
         a_2664.encode_int32(byte_array,this.m_iExpiredTimestamp);
         a_2664.encode_int32(byte_array,this.m_iOperatedTimestampBuy);
         a_2664.encode_int32(byte_array,this.m_iOperatedTimestampCancel);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iTradeIDHigh = a_2664.decode_int32(byte_array);
         this.m_iTradeIDLow = a_2664.decode_int32(byte_array);
         this.m_iSrcGroupID = a_2664.decode_int32(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_szSrcName = a_2664.decode_string(byte_array,32);
         this.m_szSrcName = null != this.m_szSrcName ? this.m_szSrcName : "";
         this.m_iDstGroupID = a_2664.decode_int32(byte_array);
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_szDstName = a_2664.decode_string(byte_array,32);
         this.m_szDstName = null != this.m_szDstName ? this.m_szDstName : "";
         this.m_stMailItem.decode(byte_array,0);
         this.m_iMoneyType = a_2664.decode_int32(byte_array);
         this.a_1074 = a_2664.decode_int32(byte_array);
         this.m_iTradeType = a_2664.decode_int32(byte_array);
         this.m_iCreateTimestamp = a_2664.decode_int32(byte_array);
         this.m_iExpiredTimestamp = a_2664.decode_int32(byte_array);
         this.m_iOperatedTimestampBuy = a_2664.decode_int32(byte_array);
         this.m_iOperatedTimestampCancel = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

