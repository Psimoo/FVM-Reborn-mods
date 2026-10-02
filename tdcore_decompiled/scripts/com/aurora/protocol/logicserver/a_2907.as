package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2907 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_nRoomEventCount:int;
      
      public var m_arrRoomEvents:Array;
      
      private var a_867:CRoomEvent;
      
      public function a_2907()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var roomEvent:CRoomEvent = null;
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         this.m_nRoomEventCount = a_2664.decode_int16(byte_array);
         this.m_arrRoomEvents = new Array();
         for(var i:int = 0; i < this.m_nRoomEventCount; i++)
         {
            roomEvent = new CRoomEvent();
            roomEvent.decode(byte_array,0);
            this.m_arrRoomEvents.push(roomEvent);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

