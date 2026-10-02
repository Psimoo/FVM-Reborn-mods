package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2928 implements CMessageBody
   {
      
      public static const a_868:int = 6;
      
      public var m_byACT:int;
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_bySeatID:int;
      
      public var m_byCanAdjust:int;
      
      public var m_iFcm:int;
      
      public var m_szTableKey:String;
      
      public var m_szTableName:String;
      
      public var m_iGameMapID:int;
      
      public var m_byGameMod:int;
      
      public var m_bLevel:int;
      
      public var m_byPlayerCount:int;
      
      public var m_nMapListCount:int;
      
      public var m_aryMapList:Array;
      
      public function a_2928()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byACT","int8"],["m_iRoomID","int32"],["m_iTableID","int32"],["m_bySeatID","int8"],["m_byCanAdjust","int8"],["m_iFcm","int8"],["m_szTableKey","string",32],["m_szTableName","string",32],["m_iGameMapID","int32"],["m_byGameMod","int8"],["m_bLevel","int8"],["m_byPlayerCount","int8"],["m_nMapListCount","int16"],["m_aryMapList",["int32"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
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

