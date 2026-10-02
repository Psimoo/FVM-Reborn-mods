package com.aurora.protocol.hallserver.changename
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2748 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iRoleUin:int;
      
      public var m_szOldRoleName:String;
      
      public var m_szNewRoleName:String;
      
      public var m_szReasonMessage:String;
      
      public function a_2748()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         if(0 == this.m_nResultID)
         {
            this.m_iRoleUin = a_2664.decode_int32(byte_array);
            this.m_szOldRoleName = a_2664.decode_string(byte_array,32);
            this.m_szNewRoleName = a_2664.decode_string(byte_array,32);
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

