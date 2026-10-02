package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CFriendInfo implements CMessageBody
   {
      
      public var m_iFriendUIN:int;
      
      public var m_szFriendAccount:String;
      
      public var m_iTimestamp:int;
      
      public var m_nTagCount:int;
      
      public var m_astTag:Array;
      
      public var m_szRemarks:String;
      
      public var m_iGroupFlag:int;
      
      private var stTaginfo:CTagInfo;
      
      public function CFriendInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var tag:CTagInfo = null;
         var size:int = a_2664.decode_int16(byte_array);
         this.m_iFriendUIN = a_2664.decode_int32(byte_array);
         this.m_szFriendAccount = a_2664.decode_string(byte_array,48);
         this.m_nTagCount = a_2664.decode_int16(byte_array);
         for(this.m_astTag = []; index < this.m_nTagCount; )
         {
            tag = new CTagInfo();
            tag.decode(byte_array,decode_length);
            this.m_astTag.push(tag);
            index++;
         }
         this.m_szRemarks = a_2664.decode_string(byte_array,16);
         this.m_iGroupFlag = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

