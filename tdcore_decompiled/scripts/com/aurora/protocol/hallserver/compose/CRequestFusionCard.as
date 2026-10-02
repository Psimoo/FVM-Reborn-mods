package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.a_2738;
   import flash.utils.ByteArray;
   
   public class CRequestFusionCard implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_itype:int;
      
      public var m_nCardCount:int;
      
      public var m_arrFusionCard:Array;
      
      public var m_nAssMaterialCount:int;
      
      public var m_arrMaterial:Array;
      
      public var m_cBuyInsuranceFlag:int;
      
      public function CRequestFusionCard()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var i:int = 0;
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int16(byte_array,this.m_itype);
         a_2664.encode_int16(byte_array,this.m_nCardCount);
         for(i = 0; i < this.m_nCardCount; i++)
         {
            a_2738(this.m_arrFusionCard[i]).encode(byte_array,encode_length);
         }
         a_2664.encode_int16(byte_array,this.m_nAssMaterialCount);
         for(i = 0; i < this.m_nAssMaterialCount; i++)
         {
            a_2738(this.m_arrMaterial[i]).encode(byte_array,encode_length);
         }
         a_2664.encode_int16(byte_array,this.m_cBuyInsuranceFlag);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

