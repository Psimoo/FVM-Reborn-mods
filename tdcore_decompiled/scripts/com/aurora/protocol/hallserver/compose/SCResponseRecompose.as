package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.a_2738;
   import flash.utils.ByteArray;
   
   public class SCResponseRecompose implements CMessageBody
   {
      
      public var m_iAct:int;
      
      public var m_nResult:int;
      
      public var m_iValidTime:int;
      
      public var m_iSrcUin:int;
      
      public var m_stNewCardInfo:a_2738;
      
      public var m_nSubCount:int;
      
      public var m_arrSub:Array;
      
      public var m_nAssMaterialCount:int;
      
      public var m_arrAssMaterial:Array;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseRecompose()
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
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iValidTime = a_2664.decode_int32(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_stNewCardInfo = new a_2738();
         this.m_stNewCardInfo.decode(byte_array,decode_length);
         this.m_nSubCount = a_2664.decode_int16(byte_array);
         this.m_arrSub = new Array();
         for(i = 0; i < this.m_nSubCount; i++)
         {
            temp = new a_2738();
            temp.decode(byte_array,decode_length);
            this.m_arrSub.push(temp);
         }
         this.m_nAssMaterialCount = a_2664.decode_int16(byte_array);
         this.m_arrAssMaterial = new Array();
         for(i = 0; i < this.m_nAssMaterialCount; i++)
         {
            temp = new a_2738();
            temp.decode(byte_array,decode_length);
            this.m_arrAssMaterial.push(temp);
         }
         if(this.m_nResult != 0)
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

