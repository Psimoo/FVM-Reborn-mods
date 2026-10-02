package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.a_2738;
   import flash.utils.ByteArray;
   
   public class CSRequestTransfer implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nMaterialCount:int;
      
      public var m_arrMaterial:Array;
      
      public var m_cBuyInsuranceFlag:int;
      
      public function CSRequestTransfer()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var i:int = 0;
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int32(byte_array,this.m_iCardID);
         a_2664.encode_int32(byte_array,this.m_iCardSeq);
         a_2664.encode_int16(byte_array,this.m_nMaterialCount);
         for(i = 0; i < this.m_nMaterialCount; i++)
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

