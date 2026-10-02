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
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class NightChocolateSandwichGameMoveMap extends BaseGameMoveMap
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
      
      public function NightChocolateSandwichGameMoveMap()
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
         for(j = 0; j < 6; j++)
         {
            stMoveBlockMap = new MoveBlockMap(-3,4);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 0;
            stMoveBlockData.m_Index = j;
            stMoveBlockData.m_iDefultXGridNo = 1;
            stMoveBlockData.m_iDefultYGridNo = j;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = 1;
            stMoveBlockData.m_iStartYGridNo = j;
            stMoveBlockData.m_iEndXGridNo = 1;
            stMoveBlockData.m_iEndYGridNo = 6;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_WaitTime = (6 - j) * 3 * 20;
            stMoveBlockData.m_iLoopGo = true;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
         for(j = 0; j < 6; j++)
         {
            stMoveBlockMap = new MoveBlockMap(-3,4);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 0;
            stMoveBlockData.m_Index = 5 - j;
            stMoveBlockData.m_iDefultXGridNo = 8;
            stMoveBlockData.m_iDefultYGridNo = j + 1;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = 8;
            stMoveBlockData.m_iStartYGridNo = 0;
            stMoveBlockData.m_iEndXGridNo = 8;
            stMoveBlockData.m_iEndYGridNo = j + 1;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_WaitTime = (j + 1) * 3 * 20;
            stMoveBlockData.m_iLoopGo = true;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
         for(j = 3; j < 8; j++)
         {
            stMoveBlockMap = new MoveBlockMap(-3 + this.DownMoveArray[j - 3][0],5 + this.DownMoveArray[j - 3][1]);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 3 + j;
            stMoveBlockData.m_iDefultXGridNo = j;
            stMoveBlockData.m_iDefultYGridNo = 8 - j;
            stMoveBlockData.m_iHeight = j - 2;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = j;
            stMoveBlockData.m_iStartYGridNo = 8 - j;
            stMoveBlockData.m_iEndXGridNo = j;
            stMoveBlockData.m_iEndYGridNo = 8 - j + 1;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iLoopGo = false;
            stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
         for(j = 2; j < 7; j++)
         {
            stMoveBlockMap = new MoveBlockMap(-3 + this.UpMoveArray[j - 2][0],this.UpMoveArray[j - 2][1]);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 7 - j;
            stMoveBlockData.m_iDefultXGridNo = j;
            stMoveBlockData.m_iDefultYGridNo = 1;
            stMoveBlockData.m_iHeight = 5 - (j - 2);
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = j;
            stMoveBlockData.m_iStartYGridNo = 0;
            stMoveBlockData.m_iEndXGridNo = j;
            stMoveBlockData.m_iEndYGridNo = 1;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iLoopGo = false;
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
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var st_DisplayObject:Vector.<DisplayObject> = null;
         var stDis:DisplayObject = null;
         for each(stMoveBlockMap in m_vMoveBlockMap)
         {
            if(stMoveBlockMap.m_stMoveBlockData.m_iID == 0)
            {
               if(stMoveBlockMap.y == 6 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 1 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 0)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 1;
                  stMoveBlockData.m_iStartYGridNo = 6;
                  stMoveBlockData.m_iDefultXGridNo = 1;
                  stMoveBlockData.m_iDefultYGridNo = 6;
                  stMoveBlockData.m_iEndXGridNo = 2;
                  stMoveBlockData.m_iEndYGridNo = 6;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 6 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 2 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 1)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 2;
                  stMoveBlockData.m_iStartYGridNo = 5;
                  stMoveBlockData.m_iDefultXGridNo = 2;
                  stMoveBlockData.m_iDefultYGridNo = 6;
                  stMoveBlockData.m_iEndXGridNo = 2;
                  stMoveBlockData.m_iEndYGridNo = 6;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 5 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 2 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 2)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 2;
                  stMoveBlockData.m_iStartYGridNo = 5;
                  stMoveBlockData.m_iDefultXGridNo = 2;
                  stMoveBlockData.m_iDefultYGridNo = 5;
                  stMoveBlockData.m_iEndXGridNo = 3;
                  stMoveBlockData.m_iEndYGridNo = 5;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 5 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 3 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 3)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 3;
                  stMoveBlockData.m_iStartYGridNo = 4;
                  stMoveBlockData.m_iDefultXGridNo = 3;
                  stMoveBlockData.m_iDefultYGridNo = 5;
                  stMoveBlockData.m_iEndXGridNo = 3;
                  stMoveBlockData.m_iEndYGridNo = 5;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 4 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 3 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 4)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 3;
                  stMoveBlockData.m_iStartYGridNo = 4;
                  stMoveBlockData.m_iDefultXGridNo = 3;
                  stMoveBlockData.m_iDefultYGridNo = 4;
                  stMoveBlockData.m_iEndXGridNo = 4;
                  stMoveBlockData.m_iEndYGridNo = 4;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 4 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 4 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 5)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 4;
                  stMoveBlockData.m_iStartYGridNo = 3;
                  stMoveBlockData.m_iDefultXGridNo = 4;
                  stMoveBlockData.m_iDefultYGridNo = 4;
                  stMoveBlockData.m_iEndXGridNo = 4;
                  stMoveBlockData.m_iEndYGridNo = 4;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 0 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 8 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 0)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 7;
                  stMoveBlockData.m_iStartYGridNo = 0;
                  stMoveBlockData.m_iDefultXGridNo = 8;
                  stMoveBlockData.m_iDefultYGridNo = 0;
                  stMoveBlockData.m_iEndXGridNo = 8;
                  stMoveBlockData.m_iEndYGridNo = 0;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 0 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 7 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 1)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 7;
                  stMoveBlockData.m_iStartYGridNo = 0;
                  stMoveBlockData.m_iDefultXGridNo = 7;
                  stMoveBlockData.m_iDefultYGridNo = 0;
                  stMoveBlockData.m_iEndXGridNo = 7;
                  stMoveBlockData.m_iEndYGridNo = 1;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 1 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 7 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 2)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 6;
                  stMoveBlockData.m_iStartYGridNo = 1;
                  stMoveBlockData.m_iDefultXGridNo = 7;
                  stMoveBlockData.m_iDefultYGridNo = 1;
                  stMoveBlockData.m_iEndXGridNo = 7;
                  stMoveBlockData.m_iEndYGridNo = 1;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 1 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 6 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 3)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 6;
                  stMoveBlockData.m_iStartYGridNo = 1;
                  stMoveBlockData.m_iDefultXGridNo = 6;
                  stMoveBlockData.m_iDefultYGridNo = 1;
                  stMoveBlockData.m_iEndXGridNo = 6;
                  stMoveBlockData.m_iEndYGridNo = 2;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 2 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 6 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 4)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 5;
                  stMoveBlockData.m_iStartYGridNo = 2;
                  stMoveBlockData.m_iDefultXGridNo = 6;
                  stMoveBlockData.m_iDefultYGridNo = 2;
                  stMoveBlockData.m_iEndXGridNo = 6;
                  stMoveBlockData.m_iEndYGridNo = 2;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 2 * a_3491.a_1081 && stMoveBlockMap.x == 60 * 5 && stMoveBlockMap.m_stMoveBlockData.m_Index >= 5)
               {
                  stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
                  stMoveBlockData.m_iStartXGridNo = 5;
                  stMoveBlockData.m_iStartYGridNo = 2;
                  stMoveBlockData.m_iDefultXGridNo = 5;
                  stMoveBlockData.m_iDefultYGridNo = 2;
                  stMoveBlockData.m_iEndXGridNo = 5;
                  stMoveBlockData.m_iEndYGridNo = 3;
                  stMoveBlockData.m_WaitTime = 0;
                  stMoveBlockData.m_iLoopGo = false;
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
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][4].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][1].m_iFieldGridType = 3;
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

