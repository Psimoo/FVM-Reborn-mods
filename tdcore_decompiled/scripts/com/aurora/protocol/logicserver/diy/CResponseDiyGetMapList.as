package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseDiyGetMapList implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iCount:int;
      
      public var m_astSampleMapInfo:Vector.<SampleMapInfo>;
      
      public function CResponseDiyGetMapList()
      {
         super();
         this.m_astSampleMapInfo = new Vector.<SampleMapInfo>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stSampleMapInfo:SampleMapInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_iCount = a_2664.decode_int32(byte_array);
         this.m_astSampleMapInfo.length = 0;
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            stSampleMapInfo = new SampleMapInfo();
            stSampleMapInfo.decode(byte_array,0);
            this.m_astSampleMapInfo.push(stSampleMapInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

