package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSRequestFriendHomeInfo implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_nDstCount:int;
      
      public var m_aiDstUin:Array;
      
      public function CSRequestFriendHomeInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int16(byte_array,this.m_nDstCount);
         for(var i:int = 0; i < this.m_nDstCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_aiDstUin[i]);
         }
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

