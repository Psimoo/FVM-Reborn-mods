package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   
   public class CResponseGetWeddingRoomWelfare extends CResponseBase
   {
      
      public var m_iUin:int;
      
      public var m_iWelfareType:int;
      
      public var m_iAwardType:int;
      
      public var m_iWelfareID:int;
      
      public var m_iSendUin:int;
      
      public var m_iGetUin:int;
      
      public var m_iWelfareLevel:int;
      
      public var m_iAwardCount:int;
      
      public var m_vAwardID:Vector.<int>;
      
      public var m_strSendName:String;
      
      public var m_strGetName:String;
      
      public function CResponseGetWeddingRoomWelfare()
      {
         super();
         this.m_vAwardID = new Vector.<int>();
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iLen:int = 0;
         var i:int = 0;
         var iID:int = 0;
         m_nResultID = a_2664.decode_int16(byte_array);
         if(m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iWelfareType = a_2664.decode_int8(byte_array);
            this.m_iAwardType = a_2664.decode_int8(byte_array);
            this.m_iWelfareID = a_2664.decode_int32(byte_array);
            this.m_iSendUin = a_2664.decode_int32(byte_array);
            this.m_iGetUin = a_2664.decode_int32(byte_array);
            this.m_iWelfareLevel = a_2664.decode_int8(byte_array);
            this.m_iAwardCount = a_2664.decode_int8(byte_array);
            this.m_vAwardID.length = 0;
            for(i = 0; i < this.m_iAwardCount; i++)
            {
               iID = a_2664.decode_int16(byte_array);
               this.m_vAwardID.push(iID);
            }
            this.m_strSendName = a_2664.decode_string(byte_array,2048);
            this.m_strGetName = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
   }
}

