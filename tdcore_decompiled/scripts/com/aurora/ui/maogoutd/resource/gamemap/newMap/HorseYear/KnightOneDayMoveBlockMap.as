package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class KnightOneDayMoveBlockMap extends MoveBlockMap
   {
      
      private var m_stMap:KnightOneDay4GameMap;
      
      private var m_lMoveDir:Array;
      
      private var m_iIndex:int = 0;
      
      public function KnightOneDayMoveBlockMap(iOffsetX:int = 0, iOffsetY:int = 0)
      {
         super(iOffsetX,iOffsetY);
      }
      
      override protected function OnArriedBound() : void
      {
         var arr:Array = null;
         ++this.m_iIndex;
         if(this.m_iIndex < this.m_lMoveDir.length)
         {
            arr = this.m_lMoveDir[this.m_iIndex];
            m_stMoveBlockData.m_iStartXGridNo = arr[0];
            m_stMoveBlockData.m_iStartYGridNo = arr[1];
            m_stMoveBlockData.m_iEndXGridNo = arr[2];
            m_stMoveBlockData.m_iEndYGridNo = arr[3];
            m_stMoveBlockFieldGrid.m_iDirection = arr[4];
         }
         else
         {
            this.m_stMap.RemoveTargetgrid(this);
         }
      }
      
      private function ChangeGridType(type:int) : void
      {
         var m_iXGridNo:int = getMoveBlockFieldGrid().m_iXGridNo;
         var m_iYGridNo:int = getMoveBlockFieldGrid().m_iYGridNo;
         var grid:a_3491 = this.m_stMap.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         grid.m_iFieldGridType = type;
         this.a_3502(grid);
      }
      
      public function CreateBlock(map:KnightOneDay4GameMap, arr:Array) : void
      {
         this.m_lMoveDir = arr;
         this.m_stMap = map;
         SetBattleFieldView(map.m_stCurrentBattleFieldView);
         MoveStart();
         this.ChangeGridType(0);
         this.m_iIndex = 0;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
      }
      
      override public function ReleaseMoveMap() : void
      {
         this.ChangeGridType(8);
         super.ReleaseMoveMap();
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,true,true,2);
      }
   }
}

