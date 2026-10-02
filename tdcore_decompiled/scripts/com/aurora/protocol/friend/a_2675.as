package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2675 implements CMessageBody
   {
      
      public var m_nDstUin:int;
      
      public var m_szDstAccount:String;
      
      public var m_stPlayerStatus:CPlayerStatusInfo;
      
      private var stPalyerStatus:CPlayerStatusInfo;
      
      public function a_2675()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nDstUin","int32"]);
         propertyArray.push(["m_szDstAccount","string",32]);
         propertyArray.push(["m_stPlayerStatus","object","com.aurora.protocol.friend.CPlayerStatusInfo"]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nDstUin = a_2664.decode_int32(byte_array);
         this.m_szDstAccount = a_2664.decode_string(byte_array,32);
         this.m_stPlayerStatus = new CPlayerStatusInfo();
         this.m_stPlayerStatus.decode(byte_array,decode_length);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

