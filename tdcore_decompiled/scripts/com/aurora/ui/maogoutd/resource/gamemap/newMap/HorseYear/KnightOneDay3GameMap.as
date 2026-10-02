package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   
   public class KnightOneDay3GameMap extends BaseGameMap
   {
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_OutArray:Array = [[0,0],[0,1],[0,7],[0,8],[1,1],[1,7],[2,2],[2,6],[3,2],[3,6],[4,2],[4,6],[5,2],[5,6],[6,3],[6,4],[6,5]];
      
      private var m_TotalObstaclePos:Array = [[0,4],[2,1],[2,7],[3,4],[6,2],[6,6]];
      
      public function KnightOneDay3GameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 1;
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
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][0]][this.m_OutArray[i][1]].m_iFieldGridType = 8;
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

