package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseItemGemInlay implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iSrcUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nGemCount:int;
      
      public var m_astGemInlay:Array;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseItemGemInlay()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var objGemInlayInfo:TagGemInlayInfo = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_iItemID = a_2664.decode_int32(byte_array);
         this.m_iItemSeq = a_2664.decode_int32(byte_array);
         this.m_nGemCount = a_2664.decode_int16(byte_array);
         this.m_astGemInlay = [];
         for(var i:int = 0; i < this.m_nGemCount; i++)
         {
            objGemInlayInfo = new TagGemInlayInfo();
            objGemInlayInfo.decode(byte_array,0);
            this.m_astGemInlay.push(objGemInlayInfo);
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

