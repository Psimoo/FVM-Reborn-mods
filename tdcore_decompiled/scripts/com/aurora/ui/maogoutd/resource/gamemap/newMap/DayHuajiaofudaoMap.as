package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class DayHuajiaofudaoMap extends BaseGameMoveMap
   {
      
      private var a_1445:a_4187 = new a_4187();
      
      public function DayHuajiaofudaoMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 1;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var stMoveBlockMap:MoveBlockMap = new MoveBlockMap(0,4);
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 3;
         stMoveBlockData.m_iDefultYGridNo = 0;
         stMoveBlockData.m_iHeight = 2;
         stMoveBlockData.m_iWidth = 3;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 6;
         stMoveBlockData.m_iEndYGridNo = 0;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 500 - (stMoveBlockData.m_iEndXGridNo - stMoveBlockData.m_iStartXGridNo) * a_3491.a_1080;
         stMoveBlockData.m_iEndResideceTime = 500 - (stMoveBlockData.m_iEndXGridNo - stMoveBlockData.m_iStartXGridNo) * a_3491.a_1080;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(4,4);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 1;
         stMoveBlockData.m_iDefultXGridNo = 6;
         stMoveBlockData.m_iDefultYGridNo = 2;
         stMoveBlockData.m_iHeight = 3;
         stMoveBlockData.m_iWidth = 2;
         stMoveBlockData.m_iStartXGridNo = 6;
         stMoveBlockData.m_iStartYGridNo = 2;
         stMoveBlockData.m_iEndXGridNo = 6;
         stMoveBlockData.m_iEndYGridNo = 4;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 500 - (stMoveBlockData.m_iEndYGridNo - stMoveBlockData.m_iStartYGridNo) * a_3491.a_1081;
         stMoveBlockData.m_iEndResideceTime = 500 - (stMoveBlockData.m_iEndYGridNo - stMoveBlockData.m_iStartYGridNo) * a_3491.a_1081;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(0,4);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 2;
         stMoveBlockData.m_iDefultXGridNo = 3;
         stMoveBlockData.m_iDefultYGridNo = 5;
         stMoveBlockData.m_iHeight = 2;
         stMoveBlockData.m_iWidth = 3;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 5;
         stMoveBlockData.m_iEndXGridNo = 3;
         stMoveBlockData.m_iEndYGridNo = 5;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 500 - (stMoveBlockData.m_iEndXGridNo - stMoveBlockData.m_iStartXGridNo) * a_3491.a_1080;
         stMoveBlockData.m_iEndResideceTime = 500 - (stMoveBlockData.m_iEndXGridNo - stMoveBlockData.m_iStartXGridNo) * a_3491.a_1080;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(2,4);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 3;
         stMoveBlockData.m_iDefultXGridNo = 1;
         stMoveBlockData.m_iDefultYGridNo = 2;
         stMoveBlockData.m_iHeight = 3;
         stMoveBlockData.m_iWidth = 2;
         stMoveBlockData.m_iStartXGridNo = 1;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 1;
         stMoveBlockData.m_iEndYGridNo = 2;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 500 - (stMoveBlockData.m_iEndYGridNo - stMoveBlockData.m_iStartYGridNo) * a_3491.a_1081;
         stMoveBlockData.m_iEndResideceTime = 500 - (stMoveBlockData.m_iEndYGridNo - stMoveBlockData.m_iStartYGridNo) * a_3491.a_1081;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
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
            stCurrentBattleFieldView.stFieldGridsVector[0][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 3;
         }
         return true;
      }
   }
}

