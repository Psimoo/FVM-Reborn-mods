package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class ZiranDuanqiaoMap extends BaseGameMoveMap
   {
      
      private var a_1445:a_4187 = new a_4187();
      
      public function ZiranDuanqiaoMap()
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
         stMoveBlockData.m_iDefultXGridNo = 5;
         stMoveBlockData.m_iDefultYGridNo = 1;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = 1;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 1;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap();
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 1;
         stMoveBlockData.m_iDefultXGridNo = 2;
         stMoveBlockData.m_iDefultYGridNo = 2;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 2;
         stMoveBlockData.m_iStartYGridNo = 2;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 2;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap();
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 2;
         stMoveBlockData.m_iDefultXGridNo = 5;
         stMoveBlockData.m_iDefultYGridNo = 3;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = 3;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 3;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap();
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 3;
         stMoveBlockData.m_iDefultXGridNo = 2;
         stMoveBlockData.m_iDefultYGridNo = 4;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 2;
         stMoveBlockData.m_iStartYGridNo = 4;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 4;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap();
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 4;
         stMoveBlockData.m_iDefultXGridNo = 5;
         stMoveBlockData.m_iDefultYGridNo = 5;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = 5;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 5;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
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
         var i:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[1][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][4].m_iFieldGridType = 3;
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stCurrentBattleFieldView.stFieldGridsVector[0][i].m_isNeedTray = true;
               stCurrentBattleFieldView.stFieldGridsVector[BattleFieldView.a_1012 - 1][i].m_isNeedTray = true;
            }
         }
         return true;
      }
   }
}

