package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetRoleSmallRoom implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_nItemCount:int;
      
      public var m_arrInfo:Array;
      
      public var m_szReasonMessage:String;
      
      public function CResponseGetRoleSmallRoom()
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
         var stAch:CSmallRoomItemVO = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_nItemCount = a_2664.decode_int16(byte_array);
            this.m_arrInfo = [];
            for(i = 0; i < this.m_nItemCount; i++)
            {
               stAch = new CSmallRoomItemVO();
               stAch.decode(byte_array,decode_length);
               this.m_arrInfo.push(stAch);
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

