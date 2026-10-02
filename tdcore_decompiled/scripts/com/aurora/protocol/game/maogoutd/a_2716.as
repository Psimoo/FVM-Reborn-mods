package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2716 implements CMessageBody
   {
      
      public var m_iTimeNum:int;
      
      public var m_byTeamNo:int;
      
      public var m_byEnemyCount:int;
      
      public var m_arrVanishEnemy:Array;
      
      private var a_860:CVanishEnemy;
      
      public function a_2716()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var iEncodeLen:int = 0;
         a_2664.encode_int32(byte_array,this.m_iTimeNum);
         a_2664.encode_int8(byte_array,this.m_byTeamNo);
         a_2664.encode_int8(byte_array,this.m_byEnemyCount);
         for(var i:int = 0; i < this.m_byEnemyCount; i++)
         {
            (this.m_arrVanishEnemy[i] as CVanishEnemy).encode(byte_array,iEncodeLen);
         }
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iTimeNum","uint32"],["m_byTeamNo","int8"],["m_byEnemyCount","int8"],["m_arrVanishEnemy",["object","com.aurora.protocol.game.maogoutd.CVanishEnemy","nosize"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

