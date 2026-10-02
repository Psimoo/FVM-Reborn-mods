package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   
   public class NineNetherBaseGameMap extends BaseGameMoveMap
   {
      
      protected var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_WaterArray:Array = new Array();
      
      protected var m_OutArray:Array = new Array();
      
      protected var m_TotalObstaclePos:Array = new Array();
      
      public function NineNetherBaseGameMap()
      {
         super();
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
      }
      
      override public function a_4177() : void
      {
         IsLandLineManager.getInstance().a_4158();
         ReleaseMoveMap();
         if(m_vMoveBlockMap != null)
         {
            m_vMoveBlockMap.length = 0;
            m_vMoveBlockMap = null;
         }
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var enterRoom:Object = null;
         var grid:a_3491 = null;
         var i:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               i = 0;
               for(i = 0; i < this.m_OutArray.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][1]][this.m_OutArray[i][0]].m_iFieldGridType = 8;
               }
               for(i = 0; i < this.m_TotalObstaclePos.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[i][1]][this.m_TotalObstaclePos[i][0]].m_iFieldGridType = 4;
               }
               for(i = 0; i < this.m_WaterArray.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_WaterArray[i][1]][this.m_WaterArray[i][0]].m_isNeedTray = true;
               }
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
   }
}

