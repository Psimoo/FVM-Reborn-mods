package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2699 implements CMessageBody
   {
      
      public var m_byAppearRatHoleCount:int;
      
      public var m_byAppearRatHole:int;
      
      public var m_byWaveProgress:int;
      
      public var m_byWaveStatus:int;
      
      public var m_nEnemyNum:int;
      
      public var m_arrEnmeyInfo:Array;
      
      private var a_856:CPendingEnemy;
      
      public function a_2699()
      {
         super();
         this.m_arrEnmeyInfo = [];
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byAppearRatHoleCount","int8"],["m_byAppearRatHole","int8"],["m_byWaveProgress","int8"],["m_byWaveStatus","int8"],["m_nEnemyNum","int16"],["m_arrEnmeyInfo",["object","com.aurora.protocol.game.maogoutd.CPendingEnemy","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var enemy:CPendingEnemy = null;
         this.m_byAppearRatHoleCount = byte_array.readByte();
         this.m_byAppearRatHole = byte_array.readByte();
         this.m_byWaveProgress = byte_array.readByte();
         this.m_byWaveStatus = byte_array.readByte();
         this.m_nEnemyNum = byte_array.readShort();
         for(var i:uint = 0; i < this.m_nEnemyNum; i++)
         {
            enemy = new CPendingEnemy();
            enemy.m_nEnemySequence = byte_array.readUnsignedShort();
            enemy.m_uiEnemyTypeID = byte_array.readUnsignedInt();
            enemy.m_byAppearType = byte_array.readUnsignedByte();
            enemy.m_byRow = byte_array.readUnsignedByte();
            enemy.m_byAppearFlag = byte_array.readUnsignedByte();
            enemy.m_uiTimeTickCount = byte_array.readUnsignedInt();
            this.m_arrEnmeyInfo.push(enemy);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

