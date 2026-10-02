package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSRequestItemGemInlay implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nGemCount:int;
      
      public var m_astGemInlay:Array;
      
      public function CSRequestItemGemInlay()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var gemInlay:TagGemInlayInfo = null;
         var obj:Object = null;
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iItemSeq);
         a_2664.encode_int16(byte_array,this.m_nGemCount);
         for(var i:int = 0; i < this.m_nGemCount; i++)
         {
            gemInlay = new TagGemInlayInfo();
            obj = this.m_astGemInlay[i];
            gemInlay.m_iGemID = obj.m_iGemID;
            gemInlay.m_iGemSeq = obj.m_iGemSeq;
            gemInlay.m_iAttrLevel = obj.m_iAttrLevel;
            gemInlay.m_iPosition = obj.m_iPosition;
            gemInlay.m_cAttrType = obj.m_cAttrType;
            gemInlay.encode(byte_array,0);
         }
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

