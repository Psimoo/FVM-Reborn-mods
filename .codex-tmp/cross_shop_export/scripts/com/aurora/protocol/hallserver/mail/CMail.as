package com.aurora.protocol.hallserver.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CMail implements CMessageBody
   {
      
      public var m_iMailIDHigh:int;
      
      public var m_iMailIDLow:int;
      
      public var m_iSrcGroupID:int;
      
      public var m_iSrcUin:int;
      
      public var m_szSrcName:String;
      
      public var m_iDstGroupID:int;
      
      public var m_iDstUin:int;
      
      public var m_szDstName:String;
      
      public var m_szMailTitle:String;
      
      public var m_szMailMsg:String;
      
      public var m_iCreateTimestamp:int;
      
      public var m_iExpiredTimestamp:int;
      
      public var m_iDeleteTimestampSrc:int;
      
      public var m_iDeleteTimestampDst:int;
      
      public var m_iReadTimestamp:int;
      
      public var m_iFetchItemTimestamp:int;
      
      public var m_iMoneyType:int;
      
      public var a_1074:int;
      
      public var m_stMailItem:CMailItem;
      
      public function CMail()
      {
         super();
         this.m_stMailItem = new CMailItem();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iMailIDHigh);
         a_2664.encode_int32(byte_array,this.m_iMailIDLow);
         a_2664.encode_int32(byte_array,this.m_iSrcGroupID);
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_string(byte_array,this.m_szSrcName,32);
         a_2664.encode_int32(byte_array,this.m_iDstGroupID);
         a_2664.encode_int32(byte_array,this.m_iDstUin);
         a_2664.encode_string(byte_array,this.m_szDstName,32);
         a_2664.encode_string(byte_array,this.m_szMailTitle,128);
         a_2664.encode_string(byte_array,this.m_szMailMsg,1024);
         a_2664.encode_int32(byte_array,this.m_iCreateTimestamp);
         a_2664.encode_int32(byte_array,this.m_iExpiredTimestamp);
         a_2664.encode_int32(byte_array,this.m_iDeleteTimestampSrc);
         a_2664.encode_int32(byte_array,this.m_iDeleteTimestampDst);
         a_2664.encode_int32(byte_array,this.m_iReadTimestamp);
         a_2664.encode_int32(byte_array,this.m_iFetchItemTimestamp);
         a_2664.encode_int32(byte_array,this.m_iMoneyType);
         a_2664.encode_int32(byte_array,this.a_1074);
         this.m_stMailItem.encode(byte_array,0);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iMailIDHigh = a_2664.decode_int32(byte_array);
         this.m_iMailIDLow = a_2664.decode_int32(byte_array);
         this.m_iSrcGroupID = a_2664.decode_int32(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_szSrcName = a_2664.decode_string(byte_array,32);
         this.m_szSrcName = null != this.m_szSrcName ? this.m_szSrcName : "";
         this.m_iDstGroupID = a_2664.decode_int32(byte_array);
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_szDstName = a_2664.decode_string(byte_array,32);
         this.m_szDstName = null != this.m_szDstName ? this.m_szDstName : "";
         this.m_szMailTitle = a_2664.decode_string(byte_array,128);
         this.m_szMailTitle = null != this.m_szMailTitle ? this.m_szMailTitle : "";
         this.m_szMailMsg = a_2664.decode_string(byte_array,1024);
         this.m_szMailMsg = null != this.m_szMailMsg ? this.m_szMailMsg : "";
         this.m_iCreateTimestamp = a_2664.decode_int32(byte_array);
         this.m_iExpiredTimestamp = a_2664.decode_int32(byte_array);
         this.m_iDeleteTimestampSrc = a_2664.decode_int32(byte_array);
         this.m_iDeleteTimestampDst = a_2664.decode_int32(byte_array);
         this.m_iReadTimestamp = a_2664.decode_int32(byte_array);
         this.m_iFetchItemTimestamp = a_2664.decode_int32(byte_array);
         this.m_iMoneyType = a_2664.decode_int32(byte_array);
         this.a_1074 = a_2664.decode_int32(byte_array);
         this.m_stMailItem.decode(byte_array,0);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

