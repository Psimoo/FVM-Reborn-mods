package com.aurora.protocol.hallserver.compose
{
   import a_4716.b_154;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.a_2738;
   import com.aurora.protocol.logicserver.CCardUpdateInfoRes;
   import flash.utils.ByteArray;
   
   public class SCResponseFusionCard extends b_154
   {
      
      public var m_nResultID:int;
      
      public var m_iSrcUin:int;
      
      public var m_nCardCount:int;
      
      public var m_arrFusionCard:Array;
      
      public var m_nAssMaterialCount:int;
      
      public var m_arrMaterial:Array;
      
      public var m_iCardLevel:int;
      
      public var m_cGradeLevel:int;
      
      public var m_stNewCardInfo:CCardUpdateInfoRes;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseFusionCard()
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
         var temp:a_2738 = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_nCardCount = a_2664.decode_int16(byte_array);
         this.m_arrFusionCard = [];
         for(i = 0; i < this.m_nCardCount; i++)
         {
            temp = new a_2738();
            temp.decode(byte_array,decode_length);
            this.m_arrFusionCard.push(temp);
         }
         this.m_nAssMaterialCount = a_2664.decode_int16(byte_array);
         this.m_arrMaterial = [];
         for(i = 0; i < this.m_nAssMaterialCount; i++)
         {
            temp = new a_2738();
            temp.decode(byte_array,decode_length);
            this.m_arrMaterial.push(temp);
         }
         this.m_stNewCardInfo = new CCardUpdateInfoRes();
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_stNewCardInfo.decode(byte_array,decode_length);
         this.m_iCardLevel = a_2664.decode_int16(byte_array);
         this.m_cGradeLevel = a_2664.decode_int16(byte_array);
         if(this.m_nResultID != 0)
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

