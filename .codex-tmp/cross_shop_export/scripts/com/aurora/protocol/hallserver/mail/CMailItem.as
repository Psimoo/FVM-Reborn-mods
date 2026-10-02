package com.aurora.protocol.hallserver.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CMailItem implements CMessageBody
   {
      
      public var m_iItemID:int;
      
      public var m_iSequence:int;
      
      public var m_iTime:int;
      
      public var m_iLevel:int;
      
      public var m_iNum:int;
      
      public function CMailItem()
      {
         super();
         this.m_iItemID = 0;
         this.m_iSequence = 0;
         this.m_iTime = 0;
         this.m_iLevel = 0;
         this.m_iNum = 0;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iSequence);
         a_2664.encode_int32(byte_array,this.m_iTime);
         a_2664.encode_int32(byte_array,this.m_iLevel);
         a_2664.encode_int32(byte_array,this.m_iNum);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iItemID = a_2664.decode_int32(byte_array);
         this.m_iSequence = a_2664.decode_int32(byte_array);
         this.m_iTime = a_2664.decode_int32(byte_array);
         this.m_iLevel = a_2664.decode_int32(byte_array);
         this.m_iNum = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
      
      public function a_4158() : void
      {
         this.m_iItemID = 0;
         this.m_iSequence = 0;
         this.m_iTime = 0;
         this.m_iLevel = 0;
         this.m_iNum = 0;
      }
   }
}

