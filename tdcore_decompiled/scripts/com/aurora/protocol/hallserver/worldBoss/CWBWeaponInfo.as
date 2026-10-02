package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CWBWeaponInfo
   {
      
      public var m_iWeaponID:int;
      
      public var gemIdList:Array;
      
      public var gemLvList:Array;
      
      public function CWBWeaponInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iWeaponID = a_2664.decode_int32(byte_array);
         this.gemIdList = [];
         this.gemLvList = [];
         var i:int = 0;
         for(i = 0; i < 4; i++)
         {
            this.gemIdList.push(a_2664.decode_int32(byte_array));
         }
         for(i = 0; i < 4; i++)
         {
            this.gemLvList.push(a_2664.decode_int8(byte_array));
         }
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

