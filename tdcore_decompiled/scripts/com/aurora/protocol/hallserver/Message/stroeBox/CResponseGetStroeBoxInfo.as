package com.aurora.protocol.hallserver.Message.stroeBox
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.CHeroItem;
   import com.aurora.ui.maogoutd.pag.StorageRoom.StroeBoxRes;
   import flash.utils.ByteArray;
   
   public class CResponseGetStroeBoxInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_arrStroeBoxInfo:Vector.<StroeBoxRes>;
      
      public var m_szReasonMessage:String;
      
      public function CResponseGetStroeBoxInfo()
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
         var vo:StroeBoxRes = null;
         var m_nCardCount:int = 0;
         var index:int = 0;
         var cardInfo:CHeroItem = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_arrStroeBoxInfo = new Vector.<StroeBoxRes>(6,true);
            for(i = 0; i < 6; i++)
            {
               vo = new StroeBoxRes();
               vo.iStoreCount = a_2664.decode_int16(byte_array);
               vo.iStoreName = a_2664.decode_string(byte_array,32);
               m_nCardCount = a_2664.decode_int16(byte_array);
               for(index = 0; index < m_nCardCount; index++)
               {
                  cardInfo = new CHeroItem();
                  a_2664.decode_int16(byte_array);
                  cardInfo.decode(byte_array,decode_length);
                  vo.m_arrCardInfos.push(cardInfo);
               }
               this.m_arrStroeBoxInfo[i] = vo;
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

