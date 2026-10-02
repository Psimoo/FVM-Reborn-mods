package com.aurora.protocol.hallserver.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDistributeIslandAward implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public var m_iConsortiaID:int;
      
      public var m_iDesUin:int;
      
      public var m_iCount:int;
      
      public var m_arrAwardInfo:Array;
      
      public function CRequestDistributeIslandAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iMapID);
         a_2664.encode_int32(byte_array,this.m_iConsortiaID);
         a_2664.encode_int32(byte_array,this.m_iDesUin);
         a_2664.encode_int32(byte_array,this.m_iCount);
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_arrAwardInfo[i].iMapID);
            a_2664.encode_int32(byte_array,this.m_arrAwardInfo[i].iConsortiaID);
            a_2664.encode_int32(byte_array,this.m_arrAwardInfo[i].iItemID);
            a_2664.encode_int32(byte_array,this.m_arrAwardInfo[i].iNum);
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

