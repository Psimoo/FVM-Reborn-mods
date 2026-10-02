package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetDiyPlayerMapData implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iMapCount:int;
      
      public var m_vDiyMapInfo:Vector.<DiyMapInfo>;
      
      public function CResponseGetDiyPlayerMapData()
      {
         super();
         this.m_vDiyMapInfo = new Vector.<DiyMapInfo>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stDiyMapInfo:DiyMapInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iMapCount = a_2664.decode_int16(byte_array);
         this.m_vDiyMapInfo.length = 0;
         for(var i:int = 0; i < this.m_iMapCount; i++)
         {
            stDiyMapInfo = new DiyMapInfo();
            stDiyMapInfo.decode(byte_array,0);
            this.m_vDiyMapInfo.push(stDiyMapInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

