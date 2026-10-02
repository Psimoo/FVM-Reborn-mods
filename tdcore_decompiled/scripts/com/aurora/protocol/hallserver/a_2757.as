package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2757 implements CMessageBody
   {
      
      public var m_iDstUin:int;
      
      public var m_nCardDataCount:int;
      
      public var m_arrCardData:Array;
      
      public var m_nHeroItemDataCount:int;
      
      public var m_arrHeroItemData:Array;
      
      public function a_2757()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var update:a_2737 = null;
         var hero:CUpdateHeroInfoRes = null;
         var size:int = 0;
         var propertyArray:Array = [];
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_nCardDataCount = a_2664.decode_int16(byte_array);
         var index:int = 0;
         this.m_arrCardData = [];
         for(index = 0; index < this.m_nCardDataCount; index++)
         {
            update = new a_2737();
            update.decode(byte_array,decode_length);
            this.m_arrCardData.push(update);
         }
         this.m_nHeroItemDataCount = a_2664.decode_int16(byte_array);
         this.m_arrHeroItemData = [];
         for(index = 0; index < this.m_nHeroItemDataCount; index++)
         {
            hero = new CUpdateHeroInfoRes();
            size = a_2664.decode_int16(byte_array);
            hero.decode(byte_array,decode_length);
            this.m_arrHeroItemData.push(hero);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

