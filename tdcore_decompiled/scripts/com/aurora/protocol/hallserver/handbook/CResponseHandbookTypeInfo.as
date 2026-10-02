package com.aurora.protocol.hallserver.handbook
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseHandbookTypeInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iTargetUin:int;
      
      public var m_nType:int;
      
      public var m_aryCollectProgress:Array;
      
      public var m_aryCardCollection:Array;
      
      public function CResponseHandbookTypeInfo()
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
         var collectProgressCnt:int = 0;
         var collectProgressVo:HandbookCollectProgress = null;
         var collectCardCnt:int = 0;
         var collectCardVo:HandbookCollectCard = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iTargetUin = a_2664.decode_int32(byte_array);
            this.m_nType = a_2664.decode_int16(byte_array);
            this.m_aryCollectProgress = [];
            collectProgressCnt = a_2664.decode_int8(byte_array);
            for(i = 0; i < collectProgressCnt; i++)
            {
               collectProgressVo = new HandbookCollectProgress();
               collectProgressVo.decode(byte_array,0);
               this.m_aryCollectProgress.push(collectProgressVo);
            }
            this.m_aryCardCollection = [];
            collectCardCnt = a_2664.decode_int16(byte_array);
            for(i = 0; i < collectCardCnt; i++)
            {
               collectCardVo = new HandbookCollectCard();
               collectCardVo.decode(byte_array,0);
               this.m_aryCardCollection.push(collectCardVo);
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

