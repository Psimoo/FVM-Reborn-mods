package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2789 implements CMessageBody
   {
      
      public var m_iConsortiaID:int;
      
      public var m_nEventCount:int;
      
      public var m_stEvent:Array;
      
      public function a_2789()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stEvent:a_2761 = null;
         this.m_iConsortiaID = a_2664.decode_int32(byte_array);
         this.m_nEventCount = a_2664.decode_int16(byte_array);
         this.m_stEvent = new Array();
         for(var i:int = 0; i < this.m_nEventCount; i++)
         {
            stEvent = new a_2761();
            stEvent.decode(byte_array,decode_length);
            this.m_stEvent.push(stEvent);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

