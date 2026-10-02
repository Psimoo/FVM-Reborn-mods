package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class BaseGameMap extends Sprite
   {
      
      public var szMapIDStr:String = "";
      
      private var dictCloneBitMap:Dictionary = new Dictionary();
      
      protected var m_stMapInfoData:a_4187 = new a_4187();
      
      public function BaseGameMap()
      {
         super();
      }
      
      public function a_4172() : BitmapData
      {
         return this.GetBitMapByClone("BattleFieldBackgroudBitmapData");
      }
      
      public function a_4173() : BitmapData
      {
         return this.GetBitMapByClone("SevenRightBattleFiledBitmapData");
      }
      
      public function a_4174() : BitmapData
      {
         return this.GetBitMapByClone("SevenLeftBattleFiledBitmapData");
      }
      
      protected function GetBitmapData(stMoveBlockData:MoveBlockData) : BitmapData
      {
         return this.GetBitMap("MoveBlockBitmapData_" + stMoveBlockData.m_iID);
      }
      
      private function get sMapID() : String
      {
         if(this.szMapIDStr.length == 0)
         {
            return BitMapManager.getInstance().lastMapID;
         }
         return this.szMapIDStr;
      }
      
      public function GetBitMapByClone(name:String) : BitmapData
      {
         var bitMapData:BitmapData = null;
         if(this.dictCloneBitMap[name] == null)
         {
            bitMapData = this.GetBitMap(name);
            if(bitMapData == null)
            {
               return null;
            }
            this.dictCloneBitMap[name] = bitMapData.clone();
         }
         return this.dictCloneBitMap[name];
      }
      
      public function GetBitMap(name:String) : BitmapData
      {
         return BitMapManager.getInstance().GetGameMapBit(this.sMapID,name);
      }
      
      public function a_4175() : a_4450
      {
         return null;
      }
      
      public function a_4176() : a_4187
      {
         return this.m_stMapInfoData;
      }
      
      public function a_4177() : void
      {
         var key:String = null;
         for(key in this.dictCloneBitMap)
         {
            this.dictCloneBitMap[key].dispose();
            delete this.dictCloneBitMap[key];
         }
      }
      
      public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         return false;
      }
      
      public function ChangeGameMap(stData:Object) : Boolean
      {
         return false;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
      }
      
      public function OnWaveStatusData(iWaveStatus:int) : void
      {
      }
      
      public function OnWaveStatusDataByServer(iWaveStatus:int) : void
      {
      }
   }
}

