package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2703 implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_uiTickCount:uint;
      
      public var m_byTeamNo:int;
      
      public var m_byEnemyCount:int;
      
      public var m_arrVanishEnemy:Array;
      
      private var a_858:CVanishEnemy;
      
      public function a_2703()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_uiTickCount","uint32"],["m_byTeamNo","int8"],["m_byEnemyCount","int8"],["m_arrVanishEnemy",["object","com.aurora.protocol.game.maogoutd.CVanishEnemy","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iDecodeSize:int = 0;
         var stVanishEnemy:CVanishEnemy = null;
         this.m_bySeatID = a_2664.decode_int8(byte_array);
         this.m_uiTickCount = a_2664.decode_uint32(byte_array);
         this.m_byTeamNo = a_2664.decode_int8(byte_array);
         this.m_byEnemyCount = a_2664.decode_int8(byte_array);
         this.m_arrVanishEnemy = [];
         for(var i:int = 0; i < this.m_byEnemyCount; i++)
         {
            stVanishEnemy = new CVanishEnemy();
            stVanishEnemy.decode(byte_array,iDecodeSize);
            this.m_arrVanishEnemy[i] = stVanishEnemy;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

