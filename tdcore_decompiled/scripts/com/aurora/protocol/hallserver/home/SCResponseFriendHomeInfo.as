package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseFriendHomeInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iSrcUin:int;
      
      public var m_nDstCount:int;
      
      public var m_astHomeState:Array;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseFriendHomeInfo()
      {
         super();
         this.m_astHomeState = [];
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var obj:Object = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResultID)
         {
            this.m_iSrcUin = a_2664.decode_int32(byte_array);
            this.m_nDstCount = a_2664.decode_int16(byte_array);
            for(i = 0; i < this.m_nDstCount; i++)
            {
               a_2664.decode_int16(byte_array);
               obj = {};
               obj.m_iUin = a_2664.decode_int16(byte_array);
               obj.m_cStateFlag = a_2664.decode_int16(byte_array);
               this.m_astHomeState.push(obj);
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

