package com.aurora.protocol.hallserver.mota
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CGetTowPlayerInfo implements CMessageBody
   {
      
      public var m_cCardNum:int;
      
      public var m_cardList:Array;
      
      public var m_cItemNum:int;
      
      public var m_WeaponeList:Array;
      
      public function CGetTowPlayerInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var cardInfo:CGetTowCardInfo = null;
         var weaponeInfo:CGetTowWeaponInfo = null;
         this.m_cardList = [];
         this.m_WeaponeList = [];
         this.m_cCardNum = a_2664.decode_int8(byte_array);
         var i:int = 0;
         for(i = 0; i < this.m_cCardNum; i++)
         {
            cardInfo = new CGetTowCardInfo();
            cardInfo.decode(byte_array,0);
            if(cardInfo.m_iCardID)
            {
               this.m_cardList.push(cardInfo);
            }
         }
         this.m_cItemNum = a_2664.decode_int8(byte_array);
         for(i = 0; i < this.m_cItemNum; i++)
         {
            weaponeInfo = new CGetTowWeaponInfo();
            weaponeInfo.decode(byte_array,0);
            if(weaponeInfo.m_iWeaponID)
            {
               this.m_WeaponeList.push(weaponeInfo);
            }
         }
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

