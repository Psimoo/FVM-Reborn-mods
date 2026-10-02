package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2856 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iSrcUin:int;
      
      public var m_cUserSex:int;
      
      public var m_iHeroScore:int;
      
      public var m_iHeroAttack:int;
      
      public var m_iHeroDefense:int;
      
      public var m_byShowCard:int;
      
      public var m_szHeroName:String;
      
      public var m_nHeroItemCount:int;
      
      public var m_arrHeroInfo:Array;
      
      public var m_szHeroItem:String;
      
      public var m_szReasonMessage:String;
      
      private var m_HeroItem:CHeroItem;
      
      public function a_2856()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stItem:CHeroItem = null;
         var i:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_cUserSex = a_2664.decode_int8(byte_array);
            this.m_iHeroScore = a_2664.decode_int32(byte_array);
            this.m_iHeroAttack = a_2664.decode_int32(byte_array);
            this.m_iHeroDefense = a_2664.decode_int32(byte_array);
            this.m_byShowCard = a_2664.decode_int8(byte_array);
            this.m_szHeroName = a_2664.decode_string(byte_array,64);
            this.m_nHeroItemCount = a_2664.decode_int16(byte_array);
            this.m_arrHeroInfo = [];
            for(i = 0; i < this.m_nHeroItemCount; i++)
            {
               stItem = new CHeroItem();
               a_2664.decode_int16(byte_array);
               stItem.decode(byte_array,decode_length);
               this.m_arrHeroInfo.push(stItem);
            }
            this.m_szHeroItem = a_2664.decode_string(byte_array,512);
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

