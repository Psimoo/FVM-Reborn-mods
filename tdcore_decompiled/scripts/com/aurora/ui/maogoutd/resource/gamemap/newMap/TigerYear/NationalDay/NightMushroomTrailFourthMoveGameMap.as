package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.NationalDay
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.Sprite;
   
   public class NightMushroomTrailFourthMoveGameMap extends BaseGameMoveMap
   {
      
      private static var ms_arrAirBitmaps:Array;
      
      private static const DEEP_INDEX:int = 1;
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightMushroomTrailFourthMoveGameMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 0;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var j:int = 0;
         stMoveBlockMap = new MoveBlockMap(-3,12);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 0;
         stMoveBlockData.m_iDefultYGridNo = 0;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 0;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(-3,12);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 5;
         stMoveBlockData.m_iDefultYGridNo = 1;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 1;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 1;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(-3,12);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 5;
         stMoveBlockData.m_iDefultYGridNo = 5;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 5;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 5;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(-3,12);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 0;
         stMoveBlockData.m_iDefultYGridNo = 6;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 4;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 6;
         stMoveBlockData.m_iEndXGridNo = 5;
         stMoveBlockData.m_iEndYGridNo = 6;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         ReleaseMoveMap();
         for each(stMoveBlockMap in m_vMoveBlockMap)
         {
            m_vMoveBlockMap.pop();
         }
         m_vMoveBlockMap = null;
         super.a_4177();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         this.m_iCurrentTimeIntval = iTimeNum;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 3;
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][i].m_isNeedTray = true;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][i].m_isNeedTray = true;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][i].m_isNeedTray = true;
            }
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

