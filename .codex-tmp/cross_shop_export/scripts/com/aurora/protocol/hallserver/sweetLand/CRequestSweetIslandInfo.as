package com.aurora.protocol.hallserver.sweetLand
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CRequestSweetIslandInfo
   {
      
      public var m_iUin:int;
      
      public function CRequestSweetIslandInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         return true;
      }
   }
}

