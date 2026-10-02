package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2903 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_nEventCount:int;
      
      public var m_stGameEvents:Array;
      
      public function a_2903()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoomID","int32"],["m_iTableID","int32"],["m_nEventCount","int16"],["m_stGameEvents",["object","com.aurora.protocol.logicserver.CGameEvent","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stCGameEvent:CGameEvent = null;
         var iDecodeSize:int = 0;
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_nEventCount = a_2664.decode_int16(byte_array);
         this.m_stGameEvents = new Array();
         for(var i:int = 0; i < this.m_nEventCount; i++)
         {
            stCGameEvent = new CGameEvent();
            stCGameEvent.decode(byte_array,iDecodeSize);
            this.m_stGameEvents[i] = stCGameEvent;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

