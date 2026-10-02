package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear
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
   
   public class DayChocolateMeltsMoveGameMap extends BaseGameMoveMap
   {
      
      private static var ms_arrAirBitmaps:Array;
      
      private static const DEEP_INDEX:int = 1;
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var DownMoveArray:Array = new Array([0,0],[0,-1],[0,-2],[0,-3],[0,-4],[0,-5]);
      
      private var UpMoveArray:Array = new Array([0,1],[0,1],[0,1],[0,1],[0,1],[0,1]);
      
      public function DayChocolateMeltsMoveGameMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 1;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var j:int = 0;
         for(j = 0; j < 7; j++)
         {
            stMoveBlockMap = new MoveBlockMap(-1,4);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 0;
            stMoveBlockData.m_iDefultXGridNo = 1;
            stMoveBlockData.m_iDefultYGridNo = j;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = 1;
            stMoveBlockData.m_iStartYGridNo = j;
            stMoveBlockData.m_iEndXGridNo = 1;
            stMoveBlockData.m_iEndYGridNo = j;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iLoopGo = false;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
         for(j = 0; j < 7; j++)
         {
            stMoveBlockMap = new MoveBlockMap(-2,4);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 0;
            stMoveBlockData.m_iDefultXGridNo = 8;
            stMoveBlockData.m_iDefultYGridNo = j;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = 8;
            stMoveBlockData.m_iStartYGridNo = j;
            stMoveBlockData.m_iEndXGridNo = 8;
            stMoveBlockData.m_iEndYGridNo = j;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iLoopGo = false;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
         for(j = 3; j < 8; j++)
         {
            stMoveBlockMap = new MoveBlockMap(this.DownMoveArray[j - 3][0],5 + this.DownMoveArray[j - 3][1]);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 3 + j;
            stMoveBlockData.m_iDefultXGridNo = j;
            stMoveBlockData.m_iDefultYGridNo = 8 - j;
            stMoveBlockData.m_iHeight = j - 2;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = j;
            stMoveBlockData.m_iStartYGridNo = 8 - j;
            stMoveBlockData.m_iEndXGridNo = j;
            stMoveBlockData.m_iEndYGridNo = 8 - j;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
         for(j = 2; j < 7; j++)
         {
            stMoveBlockMap = new MoveBlockMap(this.UpMoveArray[j - 2][0],this.UpMoveArray[j - 2][1]);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 7 - j;
            stMoveBlockData.m_iDefultXGridNo = j;
            stMoveBlockData.m_iDefultYGridNo = 1;
            stMoveBlockData.m_iHeight = 5 - (j - 2);
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = j;
            stMoveBlockData.m_iStartYGridNo = 1;
            stMoveBlockData.m_iEndXGridNo = j;
            stMoveBlockData.m_iEndYGridNo = 1;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
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
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
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

