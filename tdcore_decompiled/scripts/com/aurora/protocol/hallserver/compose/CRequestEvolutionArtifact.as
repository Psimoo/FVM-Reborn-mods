package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestEvolutionArtifact implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iItemID:int;
      
      public var m_iCostGemLv:int;
      
      public var m_nDelCount:int;
      
      public var m_vDelInfo:Vector.<DelItemInfo>;
      
      public function CRequestEvolutionArtifact()
      {
         super();
         this.m_vDelInfo = new Vector.<DelItemInfo>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iCostGemLv);
         a_2664.encode_int16(byte_array,this.m_nDelCount);
         for(var i:int = 0; i < this.m_nDelCount; i++)
         {
            this.m_vDelInfo[i].encode(byte_array,0);
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

