package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   
   public class KnightOneDay2GameMap extends BaseGameMap
   {
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_OutArray:Array = [[0,5],[0,6],[0,7],[2,4],[2,5],[3,5],[4,1],[4,2],[4,3],[5,1],[5,3],[5,5],[5,6],[6,1],[6,3],[6,4],[6,5]];
      
      private var m_TotalObstaclePos:Array = new Array();
      
      public function KnightOneDay2GameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(i = 0; i < this.m_OutArray.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][0]][this.m_OutArray[i][1]].m_isNeedTray = true;
               }
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 4;
               }
            }
         }
         return true;
      }
   }
}

