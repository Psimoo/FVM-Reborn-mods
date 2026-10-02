package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestSaveRoleSmallRoomInfo implements CMessageBody
   {
      
      public var m_iRoleUin:int;
      
      public var m_nItemCount:int;
      
      public var m_arrInfo:Array;
      
      public function CRequestSaveRoleSmallRoomInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var data:CSmallRoomItemVO = null;
         a_2664.encode_int32(byte_array,this.m_iRoleUin);
         a_2664.encode_int16(byte_array,this.m_nItemCount);
         trace("16");
         for(var i:int = 0; i < this.m_nItemCount; i++)
         {
            data = this.m_arrInfo[i] as CSmallRoomItemVO;
            a_2664.encode_int32(byte_array,data.m_iTypeID);
            a_2664.encode_int32(byte_array,data.m_iID);
            a_2664.encode_int32(byte_array,data.m_iPositonX);
            a_2664.encode_int32(byte_array,data.m_iPositonY);
            a_2664.encode_int32(byte_array,data.m_iDirection);
            a_2664.encode_int32(byte_array,data.m_iBuyTime);
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

