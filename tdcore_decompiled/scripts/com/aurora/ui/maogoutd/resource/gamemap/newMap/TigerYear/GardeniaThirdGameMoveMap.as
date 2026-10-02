package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   
   public class GardeniaThirdGameMoveMap extends BaseGameMoveMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function GardeniaThirdGameMoveMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 0;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var item:Object = null;
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var tempArr:Array = new Array();
         item = new Object();
         item.m_iDefultXGridNo = 0;
         item.m_iDefultYGridNo = 5;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 0;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 2;
         item.m_iDefultYGridNo = 3;
         item.m_iStartXGridNo = 2;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 2;
         item.m_iEndYGridNo = 4;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 5;
         item.m_iDefultYGridNo = 2;
         item.m_iStartXGridNo = 5;
         item.m_iStartYGridNo = 1;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 7;
         item.m_iDefultYGridNo = 0;
         item.m_iStartXGridNo = 7;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 7;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         tempArr.push(item);
         for(var i:int = 0; i < tempArr.length; i++)
         {
            stMoveBlockMap = new MoveBlockMap(-4,4);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iHeight = 2;
            stMoveBlockData.m_iWidth = 2;
            stMoveBlockData.m_iStartXGridNo = tempArr[i].m_iStartXGridNo;
            stMoveBlockData.m_iStartYGridNo = tempArr[i].m_iStartYGridNo;
            stMoveBlockData.m_iEndXGridNo = tempArr[i].m_iEndXGridNo;
            stMoveBlockData.m_iEndYGridNo = tempArr[i].m_iEndYGridNo;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = i == 1 || i == 2 ? 0 : int(15 * 20);
            stMoveBlockData.m_iEndResideceTime = i == 1 || i == 2 ? 0 : int(15 * 20);
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
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
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var st_DisplayObject:Vector.<DisplayObject> = null;
         var stDis:DisplayObject = null;
         for each(stMoveBlockMap in m_vMoveBlockMap)
         {
            if(stMoveBlockMap.x == 2 * a_3491.a_1080)
            {
               if(stMoveBlockMap.y == 2 * a_3491.a_1081 && stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_DOWN && stMoveBlockMap.m_stMoveBlockData.m_iEndYGridNo == 4)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 2;
                  stMoveBlockData.m_iStartYGridNo = 1;
                  stMoveBlockData.m_iDefultXGridNo = 2;
                  stMoveBlockData.m_iDefultYGridNo = 2;
                  stMoveBlockData.m_iEndXGridNo = 2;
                  stMoveBlockData.m_iEndYGridNo = 5;
                  stMoveBlockData.m_WaitTime = 15 * 20;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 3 * a_3491.a_1081 && stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_UP && stMoveBlockMap.m_stMoveBlockData.m_iStartYGridNo == 1)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 2;
                  stMoveBlockData.m_iStartYGridNo = 0;
                  stMoveBlockData.m_iDefultXGridNo = 2;
                  stMoveBlockData.m_iDefultYGridNo = 3;
                  stMoveBlockData.m_iEndXGridNo = 2;
                  stMoveBlockData.m_iEndYGridNo = 4;
                  stMoveBlockData.m_WaitTime = 15 * 20;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
            }
            else if(stMoveBlockMap.x == 5 * a_3491.a_1080)
            {
               if(stMoveBlockMap.y == 3 * a_3491.a_1081 && stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_UP && stMoveBlockMap.m_stMoveBlockData.m_iStartYGridNo == 1)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 5;
                  stMoveBlockData.m_iStartYGridNo = 0;
                  stMoveBlockData.m_iDefultXGridNo = 5;
                  stMoveBlockData.m_iDefultYGridNo = 3;
                  stMoveBlockData.m_iEndXGridNo = 5;
                  stMoveBlockData.m_iEndYGridNo = 3;
                  stMoveBlockData.m_WaitTime = 15 * 20;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 2 * a_3491.a_1081 && stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_DOWN && stMoveBlockMap.m_stMoveBlockData.m_iEndYGridNo == 3)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 5;
                  stMoveBlockData.m_iStartYGridNo = 1;
                  stMoveBlockData.m_iDefultXGridNo = 5;
                  stMoveBlockData.m_iDefultYGridNo = 2;
                  stMoveBlockData.m_iEndXGridNo = 5;
                  stMoveBlockData.m_iEndYGridNo = 5;
                  stMoveBlockData.m_WaitTime = 15 * 20;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
            }
         }
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
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("DayHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("DayLowAirCloudBitmapData");
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 3;
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

