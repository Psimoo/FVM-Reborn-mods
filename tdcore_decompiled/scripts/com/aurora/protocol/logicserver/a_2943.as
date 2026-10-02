package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.a_2855;
   import flash.utils.ByteArray;
   
   public class a_2943 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoomID:int;
      
      public var m_iUin:int;
      
      public var m_nCardCount:int;
      
      public var m_arrCardInfos:Array;
      
      public var m_nCardBuyCount:int;
      
      public var m_arrCardBuyInfos:Array;
      
      public var m_nCardComposeCount:int;
      
      public var m_arrCardComposeInfos:Array;
      
      public var m_nCardStoreCount:int;
      
      public var m_arrCardStore:Array;
      
      public var m_nCardListCount:int;
      
      public var m_aryCardList:Array;
      
      public var m_nSkillCount:int;
      
      public var m_arrSkillInfos:Array;
      
      private var a_862:a_2898;
      
      private var a_866:a_2897;
      
      private var a_874:a_2900;
      
      private var a_869:CCardList;
      
      private var a_863:a_2855;
      
      public function a_2943()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var cardInfo:a_2898 = null;
         var props:a_2897 = null;
         var other:a_2897 = null;
         var cardStore:a_2900 = null;
         var cardList:CCardList = null;
         var skill:a_2855 = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iRoomID = a_2664.decode_int32(byte_array);
            this.m_iUin = a_2664.decode_int32(byte_array);
            index = 0;
            this.m_arrCardInfos = [];
            this.m_nCardCount = a_2664.decode_int16(byte_array);
            for(index = 0; index < this.m_nCardCount; index++)
            {
               cardInfo = new a_2898();
               cardInfo.decode(byte_array,decode_length);
               this.m_arrCardInfos.push(cardInfo);
            }
            this.m_nCardBuyCount = a_2664.decode_int16(byte_array);
            this.m_arrCardBuyInfos = [];
            for(index = 0; index < this.m_nCardBuyCount; index++)
            {
               props = new a_2897();
               props.decode(byte_array,decode_length);
               this.m_arrCardBuyInfos.push(props);
            }
            this.m_nCardComposeCount = a_2664.decode_int16(byte_array);
            this.m_arrCardComposeInfos = [];
            for(index = 0; index < this.m_nCardComposeCount; index++)
            {
               other = new a_2897();
               other.decode(byte_array,decode_length);
               this.m_arrCardComposeInfos.push(other);
            }
            this.m_nCardStoreCount = a_2664.decode_int16(byte_array);
            this.m_arrCardStore = [];
            for(index = 0; index < this.m_nCardStoreCount; index++)
            {
               cardStore = new a_2900();
               cardStore.decode(byte_array,decode_length);
               this.m_arrCardStore.push(cardStore);
            }
            this.m_nCardListCount = a_2664.decode_int16(byte_array);
            this.m_aryCardList = [];
            for(index = 0; index < this.m_nCardListCount; index++)
            {
               cardList = new CCardList();
               cardList.decode(byte_array,decode_length);
               this.m_aryCardList.push(cardList);
            }
            this.m_nSkillCount = a_2664.decode_int16(byte_array);
            this.m_arrSkillInfos = [];
            for(index = 0; index < this.m_nSkillCount; index++)
            {
               skill = new a_2855();
               skill.decode(byte_array,decode_length);
               this.m_arrSkillInfos.push(skill);
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

