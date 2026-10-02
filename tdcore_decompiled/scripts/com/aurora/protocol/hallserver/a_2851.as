package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.CCardUpdateInfoRes;
   import flash.utils.ByteArray;
   
   public class a_2851 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_nCardDataCount:int;
      
      public var m_arrCardData:Array;
      
      public var m_nHeroItemCount:int;
      
      public var m_arrHeroItemData:Array;
      
      public var m_nCardAttrCount:int;
      
      public var m_arrCardAttr:Array;
      
      public var m_szReasonMessage:String;
      
      public function a_2851()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var update:CCardUpdateInfoRes = null;
         var hero:CUpdateHeroInfoRes = null;
         var attr:a_2746 = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            this.m_nCardDataCount = a_2664.decode_int16(byte_array);
            index = 0;
            this.m_arrCardData = [];
            for(index = 0; index < this.m_nCardDataCount; index++)
            {
               update = new CCardUpdateInfoRes();
               a_2664.decode_int16(byte_array);
               update.decode(byte_array,decode_length);
               this.m_arrCardData.push(update);
            }
            this.m_nHeroItemCount = a_2664.decode_int16(byte_array);
            this.m_arrHeroItemData = [];
            for(index = 0; index < this.m_nHeroItemCount; index++)
            {
               hero = new CUpdateHeroInfoRes();
               a_2664.decode_int16(byte_array);
               hero.decode(byte_array,decode_length);
               this.m_arrHeroItemData.push(hero);
            }
            this.m_nCardAttrCount = a_2664.decode_int16(byte_array);
            this.m_arrCardAttr = [];
            for(index = 0; index < this.m_nCardAttrCount; index++)
            {
               attr = new a_2746();
               a_2664.decode_int16(byte_array);
               attr.decode(byte_array,decode_length);
               this.m_arrCardAttr.push(attr);
            }
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

