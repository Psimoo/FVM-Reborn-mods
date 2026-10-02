package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2687 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iMyUIN:int;
      
      public var m_nFriendCount:int;
      
      public var m_astFriendInfo:Array;
      
      public var m_szReasonMessage:String;
      
      private var stCFriendInfo:CFriendInfo;
      
      public function a_2687()
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
         var info:CFriendInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            this.m_iMyUIN = a_2664.decode_int32(byte_array);
            this.m_nFriendCount = a_2664.decode_int16(byte_array);
            this.m_astFriendInfo = [];
            for(index = 0; index < this.m_nFriendCount; index++)
            {
               info = new CFriendInfo();
               info.decode(byte_array,decode_length);
               this.m_astFriendInfo.push(info);
            }
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

