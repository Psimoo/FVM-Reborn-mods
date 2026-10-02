package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CrossRoomInfo implements CMessageBody
   {
      
      public var m_iPriority:int;
      
      public var m_iRoomID:int;
      
      public var m_iMapID:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_szName:String;
      
      public var m_bLock:Boolean;
      
      public var m_strPassword:String;
      
      public var m_iGameState:int;
      
      public var m_iTeamState:int;
      
      public var m_iCreateTime:int;
      
      public var m_szMapName:String;
      
      public function CrossRoomInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iPriority = 0;
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_szName = a_2664.decode_string(byte_array,32);
         this.m_bLock = Boolean(a_2664.decode_int8(byte_array) == 1);
         this.m_strPassword = a_2664.decode_string(byte_array,32);
         this.m_iGameState = a_2664.decode_int32(byte_array);
         this.m_iTeamState = a_2664.decode_int32(byte_array);
         this.m_iCreateTime = a_2664.decode_int32(byte_array);
         this.m_szMapName = a_2664.decode_string(byte_array,32);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

