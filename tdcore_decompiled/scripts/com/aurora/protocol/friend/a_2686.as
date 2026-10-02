package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2686 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iMyUin:int;
      
      public var m_nCount:int;
      
      public var m_astPlayerStatus:Array;
      
      private var stPlayerStatusInfo:CPlayerStatusInfo;
      
      public function a_2686()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iMyUin","int32"]);
            propertyArray.push(["m_nCount","int16"]);
            propertyArray.push(["m_astPlayerStatus",["object","com.aurora.protocol.friend.CPlayerStatusInfo"]]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var status:CPlayerStatusInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iMyUin = a_2664.decode_int32(byte_array);
            this.m_nCount = a_2664.decode_int16(byte_array);
            this.m_astPlayerStatus = [];
            for(index = 0; index < this.m_nCount; index++)
            {
               status = new CPlayerStatusInfo();
               status.decode(byte_array,decode_length);
               this.m_astPlayerStatus.push(status);
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

