package com.aurora.protocol.hallserver.monopoly
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseMonopolyPlay implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iStepCount:int;
      
      public var m_iStep:Array;
      
      public var m_iPoolID:int;
      
      public var m_iAwardID:int;
      
      public function CResponseMonopolyPlay()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var temp:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iStepCount = a_2664.decode_int32(byte_array);
         this.m_iStep = [];
         for(var i:int = 0; i < this.m_iStepCount; i++)
         {
            temp = a_2664.decode_int32(byte_array);
            this.m_iStep.push(temp);
         }
         this.m_iPoolID = a_2664.decode_int32(byte_array);
         this.m_iAwardID = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

