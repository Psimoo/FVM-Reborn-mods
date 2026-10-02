package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDivideAward implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_cDistributePlayerCount:int;
      
      public var m_aryDistributeInfo:Array;
      
      public function CRequestDivideAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var distribute:CWBDistributeInfo = null;
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int8(byte_array,this.m_cDistributePlayerCount);
         for(var i:int = 0; i < this.m_aryDistributeInfo.length; i++)
         {
            distribute = this.m_aryDistributeInfo[i];
            distribute.encode(byte_array,0);
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

