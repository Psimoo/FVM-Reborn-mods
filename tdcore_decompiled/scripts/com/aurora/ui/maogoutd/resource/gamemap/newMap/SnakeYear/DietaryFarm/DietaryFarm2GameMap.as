package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   public class DietaryFarm2GameMap extends DietaryFarmBaseGameMap
   {
      
      private var randomArr:Array = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[7,0],[8,0],[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[7,1],[8,1],[0,2],[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2],[0,3],[1,3],[2,3],[3,3],[4,3],[5,3],[7,3],[8,3],[0,4],[1,4],[2,4],[3,4],[4,4],[5,6],[6,4],[7,4],[8,4],[0,5],[1,5],[2,5],[3,5],[4,5],[5,5],[7,5],[8,5],[0,6],[1,6],[2,6],[3,6],[4,6],[5,6],[7,6],[8,6]];
      
      public function DietaryFarm2GameMap()
      {
         super();
         m_OutArray = [[6,0,null],[6,1,null],[6,5,null],[6,6,null]];
         m_Barrier2Array = [[6,3]];
         m_WaterArray = [[0,2],[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2],[5,3],[7,3],[0,4],[1,4],[2,4],[3,4],[4,4],[5,4],[6,4],[7,4],[8,4]];
         a_1445.m_iBattleFieldStageType = 1;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         ++m_iRunTick;
         if(m_iRunTick == 60 * 20)
         {
            CreateMouse(120000,30000,this.randomArr,15 * 20);
         }
         super.OnTimeInterval(iTimeNum);
      }
   }
}

