package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWeddingRoomPlayer implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iSex:int;
      
      public var m_iSeat:int;
      
      public var m_iGag:int;
      
      public var m_strName:String;
      
      public function CWeddingRoomPlayer()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var arrPropertyArray:Array = [];
         arrPropertyArray.push(["m_iUin","int32"]);
         arrPropertyArray.push(["m_iSex","int8"]);
         arrPropertyArray.push(["m_iSeat","int8"]);
         arrPropertyArray.push(["m_iGag","int8"]);
         arrPropertyArray.push(["m_strName","string",2048]);
         return a_2664.a_2666(this,arrPropertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

