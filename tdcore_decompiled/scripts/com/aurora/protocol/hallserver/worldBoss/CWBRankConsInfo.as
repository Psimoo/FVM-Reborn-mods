package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWBRankConsInfo implements CMessageBody
   {
      
      public var consID:int;
      
      public var platform:int;
      
      public var groupID:int;
      
      public var consName:String;
      
      public var consLevel:int;
      
      public var sumBossHP:Number;
      
      public var chairmanName:String;
      
      public var chairmanSex:int;
      
      public var unionPoint:Number;
      
      public function CWBRankConsInfo()
      {
         super();
         this.chairmanSex = -1;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.consID = a_2664.decode_int32(byte_array);
         this.platform = a_2664.decode_int8(byte_array);
         this.groupID = a_2664.decode_int16(byte_array);
         this.consName = a_2664.decode_string(byte_array,128);
         this.consLevel = a_2664.decode_int8(byte_array);
         this.sumBossHP = a_2664.decode_uint64(byte_array);
         this.chairmanName = a_2664.decode_string(byte_array,64);
         this.unionPoint = a_2664.decode_uint64(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

