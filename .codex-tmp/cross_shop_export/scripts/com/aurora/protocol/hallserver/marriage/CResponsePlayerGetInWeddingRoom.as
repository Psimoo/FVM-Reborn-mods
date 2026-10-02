package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   
   public class CResponsePlayerGetInWeddingRoom extends CResponseBase
   {
      
      public var m_iUin:int;
      
      public var m_stPlayer:CWeddingRoomPlayer;
      
      public function CResponsePlayerGetInWeddingRoom()
      {
         super();
         this.m_stPlayer = new CWeddingRoomPlayer();
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iLen:int = 0;
         m_nResultID = a_2664.decode_int16(byte_array);
         if(m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_stPlayer.decode(byte_array,iLen);
         }
         return true;
      }
   }
}

