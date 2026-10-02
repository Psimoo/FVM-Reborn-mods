package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseDiyGetMapMouse implements CMessageBody
   {
      
      public var m_iSize:int;
      
      public var m_iMouseID:Array;
      
      public function CResponseDiyGetMapMouse()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iSize = a_2664.decode_int16(byte_array);
         this.m_iMouseID = [];
         for(var i:int = 0; i < this.m_iSize; i++)
         {
            this.m_iMouseID.push(a_2664.decode_int32(byte_array).toString(16));
         }
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

