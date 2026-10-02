package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSRequestAppraiseDIYMap implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iOpt:int;
      
      public var m_iMapID:int;
      
      public function CCSRequestAppraiseDIYMap()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int8(byte_array,this.m_iOpt);
         a_2664.encode_int32(byte_array,this.m_iMapID);
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

