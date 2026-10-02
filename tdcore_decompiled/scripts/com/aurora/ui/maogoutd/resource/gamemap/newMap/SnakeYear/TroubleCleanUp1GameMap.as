package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   public class TroubleCleanUp1GameMap extends TroubleCleanUpBaseGameMap
   {
      
      public function TroubleCleanUp1GameMap()
      {
         super();
         m_arrBox = new Array([2,3,null],[4,3,null],[0,6,null],[3,6,null],[6,6,null]);
         m_arrDirty = new Array([3,3,2,null],[0,5,1,null],[6,5,1,null],[3,7,1,null]);
         m_arrRag = new Array([3,2,null]);
      }
   }
}

