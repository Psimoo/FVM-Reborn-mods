package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class GameResult
   {
      
      public var m_iMapID:int;
      
      public var m_iGrade:int;
      
      public function GameResult()
      {
         super();
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_iGrade = a_2664.decode_int32(byte_array);
         return true;
      }
   }
}

