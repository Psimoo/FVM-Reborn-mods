package com.aurora.protocol.hallserver.handbook
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseHandbookLightOrReceiveInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cOpt:int;
      
      public var m_cType:int;
      
      public var m_nAwardType:int;
      
      public var m_cAwardLevel:int;
      
      public var m_iTime:int;
      
      public var m_aryCollectProgress:Array;
      
      public var m_aryCardCollection:Array;
      
      public function CResponseHandbookLightOrReceiveInfo()
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
         var activeCardVo:HandbookActiveCard = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_cOpt = a_2664.decode_int8(byte_array);
            this.m_cType = a_2664.decode_int8(byte_array);
            this.m_nAwardType = a_2664.decode_int16(byte_array);
            this.m_cAwardLevel = a_2664.decode_int8(byte_array);
            this.m_iTime = a_2664.decode_int32(byte_array);
            this.m_aryCollectProgress = [];
            collectProgressCnt = a_2664.decode_int8(byte_array);
            for(i = 0; i < collectProgressCnt; i++)
            {
               collectProgressVo = new HandbookCollectProgress();
               collectProgressVo.decode(byte_array,0);
               this.m_aryCollectProgress.push(collectProgressVo);
            }
            this.m_aryCardCollection = [];
            collectCardCnt = a_2664.decode_int8(byte_array);
            for(i = 0; i < collectCardCnt; i++)
            {
               activeCardVo = new HandbookActiveCard();
               activeCardVo.decode(byte_array,0);
               this.m_aryCardCollection.push(activeCardVo);
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

