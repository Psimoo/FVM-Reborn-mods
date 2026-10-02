package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class LuliaoHuayuanMap extends BaseGameMoveMap
   {
      
      private var a_1445:a_4187 = new a_4187();
      
      public function LuliaoHuayuanMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 1;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var stMoveBlockMap:MoveBlockMap = new MoveBlockMap();
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 0;
         stMoveBlockData.m_iDefultYGridNo = 0;
         stMoveBlockData.m_iHeight = 7;
         stMoveBlockData.m_iWidth = 6;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 3;
         stMoveBlockData.m_iEndYGridNo = 0;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         ReleaseMoveMap();
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 3;
         }
         return true;
      }
   }
}

