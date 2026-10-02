package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.game.maogoutd.CPendingDIYEnemy;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesData;
   import flash.utils.ByteArray;
   
   public class CNotifyDIYNextEnmeyWave implements CMessageBody
   {
      
      public var m_byWaveProgress:int;
      
      public var m_byWaveStatus:int;
      
      public var m_nEnemyNum:int;
      
      public var m_arrEnmeyInfo:Array;
      
      public var m_stMouseLines:MouseLinesData;
      
      private var a_856:CPendingDIYEnemy;
      
      public function CNotifyDIYNextEnmeyWave()
      {
         super();
         this.m_arrEnmeyInfo = [];
         this.m_stMouseLines = new MouseLinesData();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byWaveProgress","int8"],["m_byWaveStatus","int8"],["m_nEnemyNum","int16"],["m_arrEnmeyInfo",["object","com.aurora.protocol.game.maogoutd.CPendingEnemy","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var enemy:CPendingDIYEnemy = null;
         this.m_byWaveProgress = byte_array.readByte();
         this.m_byWaveStatus = byte_array.readByte();
         this.m_nEnemyNum = byte_array.readShort();
         for(var i:uint = 0; i < this.m_nEnemyNum; i++)
         {
            enemy = new CPendingDIYEnemy();
            enemy.m_nEnemySequence = byte_array.readShort();
            enemy.m_uiEnemyTypeID = byte_array.readInt();
            enemy.m_byRow = byte_array.readByte();
            enemy.m_iLife = byte_array.readInt();
            enemy.m_uiTimeTickCount = byte_array.readShort();
            this.m_arrEnmeyInfo.push(enemy);
         }
         this.m_stMouseLines.Decode(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

