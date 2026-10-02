package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestGetDiyPlayerMapData implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iMapIDCount:int;
      
      public var m_vMapID:Vector.<int>;
      
      public function CRequestGetDiyPlayerMapData()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int16(byte_array,this.m_iMapIDCount);
         for(var i:int = 0; i < this.m_iMapIDCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_vMapID[i]);
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

