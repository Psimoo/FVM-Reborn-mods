package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.a_2897;
   import flash.utils.ByteArray;
   
   public class SCResponseItemGemDecompose implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iSrcUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nDecomposeCount:int;
      
      public var m_astDecomposeInfo:Array;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseItemGemDecompose()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var objCardBuyInfo:a_2897 = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_iItemID = a_2664.decode_int32(byte_array);
         this.m_iItemSeq = a_2664.decode_int32(byte_array);
         this.m_nDecomposeCount = a_2664.decode_int16(byte_array);
         this.m_astDecomposeInfo = [];
         for(var i:int = 0; i < this.m_nDecomposeCount; i++)
         {
            objCardBuyInfo = new a_2897();
            objCardBuyInfo.decode(byte_array,0);
            this.m_astDecomposeInfo.push(objCardBuyInfo);
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

