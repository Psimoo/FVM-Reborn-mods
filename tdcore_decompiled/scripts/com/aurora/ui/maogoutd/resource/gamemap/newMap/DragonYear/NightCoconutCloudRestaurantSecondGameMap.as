package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   
   public class NightCoconutCloudRestaurantSecondGameMap extends BaseGameMoveMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightCoconutCloudRestaurantSecondGameMap()
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
         item.m_iDefultXGridNo = 4;
         item.m_iDefultYGridNo = 0;
         item.m_iStartXGridNo = 4;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 5;
         item.m_iDefultYGridNo = 1;
         item.m_iStartXGridNo = 4;
         item.m_iStartYGridNo = 1;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 1;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 7;
         item.m_iDefultYGridNo = 0;
         item.m_iStartXGridNo = 7;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 8;
         item.m_iEndYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 8;
         item.m_iDefultYGridNo = 1;
         item.m_iStartXGridNo = 7;
         item.m_iStartYGridNo = 1;
         item.m_iEndXGridNo = 8;
         item.m_iEndYGridNo = 1;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 5;
         item.m_iDefultYGridNo = 5;
         item.m_iStartXGridNo = 4;
         item.m_iStartYGridNo = 5;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 4;
         item.m_iDefultYGridNo = 6;
         item.m_iStartXGridNo = 4;
         item.m_iStartYGridNo = 6;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 8;
         item.m_iDefultYGridNo = 5;
         item.m_iStartXGridNo = 7;
         item.m_iStartYGridNo = 5;
         item.m_iEndXGridNo = 8;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 7;
         item.m_iDefultYGridNo = 6;
         item.m_iStartXGridNo = 7;
         item.m_iStartYGridNo = 6;
         item.m_iEndXGridNo = 8;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         tempArr.push(item);
         for(var i:int = 0; i < tempArr.length; i++)
         {
            stMoveBlockMap = new MoveBlockMap(-23,-8);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = 0;
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iStartXGridNo = tempArr[i].m_iStartXGridNo;
            stMoveBlockData.m_iStartYGridNo = tempArr[i].m_iStartYGridNo;
            stMoveBlockData.m_iEndXGridNo = tempArr[i].m_iEndXGridNo;
            stMoveBlockData.m_iEndYGridNo = tempArr[i].m_iEndYGridNo;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 3 * 20;
            stMoveBlockData.m_iEndResideceTime = 3 * 20;
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
            stMoveBlockData.m_iDirectionType = 2;
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
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_iCurrentTimeIntval % (60 * 20) == 0)
            {
               this.addBigCoconutMouse();
            }
         }
         for each(stMoveBlockMap in m_vMoveBlockMap)
         {
            stMoveBlockData = stMoveBlockMap.m_stMoveBlockData;
            if(stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_RIGHT)
            {
               if(stMoveBlockMap.x == 5 * a_3491.a_1080 || stMoveBlockMap.x == 8 * a_3491.a_1080)
               {
                  if(stMoveBlockMap.y == 0 * a_3491.a_1081)
                  {
                     stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iEndYGridNo += 1;
                     stMoveBlockData.m_WaitTime = 0 * 20;
                     stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
                     st_DisplayObject = new Vector.<DisplayObject>();
                     for each(stDis in stMoveBlockMap.m_vDisplayObject)
                     {
                        st_DisplayObject.push(stDis);
                     }
                     stMoveBlockMap.MoveStart();
                     stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
                  }
                  else if(stMoveBlockMap.y == 6 * a_3491.a_1081)
                  {
                     stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iEndYGridNo - 1;
                     stMoveBlockData.m_WaitTime = 0 * 20;
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
            }
            else if(stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_DOWN)
            {
               if(stMoveBlockMap.y == 1 * a_3491.a_1081 || stMoveBlockMap.y == 6 * a_3491.a_1081)
               {
                  if(stMoveBlockMap.x == 5 * a_3491.a_1080 || stMoveBlockMap.x == 8 * a_3491.a_1080)
                  {
                     stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iEndXGridNo - 1;
                     stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_WaitTime = 0 * 20;
                     stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
                     st_DisplayObject = new Vector.<DisplayObject>();
                     for each(stDis in stMoveBlockMap.m_vDisplayObject)
                     {
                        st_DisplayObject.push(stDis);
                     }
                     stMoveBlockMap.MoveStart();
                     stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
                  }
                  else if(stMoveBlockMap.x == 4 * a_3491.a_1080 || stMoveBlockMap.x == 7 * a_3491.a_1080)
                  {
                     stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iEndXGridNo;
                     stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_iEndXGridNo += 1;
                     stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iEndYGridNo;
                     stMoveBlockData.m_WaitTime = 0 * 20;
                     stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
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
            else if(stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_LEFT)
            {
               if(stMoveBlockMap.x == 4 * a_3491.a_1080 || stMoveBlockMap.x == 7 * a_3491.a_1080)
               {
                  if(stMoveBlockMap.y == 1 * a_3491.a_1081)
                  {
                     stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iStartXGridNo;
                     stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iStartYGridNo;
                     stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iStartXGridNo;
                     stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iStartYGridNo;
                     stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iStartXGridNo;
                     --stMoveBlockData.m_iStartYGridNo;
                     stMoveBlockData.m_WaitTime = 0 * 20;
                     stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
                     st_DisplayObject = new Vector.<DisplayObject>();
                     for each(stDis in stMoveBlockMap.m_vDisplayObject)
                     {
                        st_DisplayObject.push(stDis);
                     }
                     stMoveBlockMap.MoveStart();
                     stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
                  }
                  else if(stMoveBlockMap.y == 5 * a_3491.a_1081)
                  {
                     stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iStartXGridNo;
                     stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iStartYGridNo;
                     stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iStartXGridNo;
                     stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iStartYGridNo;
                     stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iStartXGridNo;
                     stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iStartYGridNo + 1;
                     stMoveBlockData.m_WaitTime = 0 * 20;
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
            else if(stMoveBlockMap.getMoveBlockFieldGrid().m_iDirection == MoveBlockFieldGrid.MOVE_UP)
            {
               if(stMoveBlockMap.y == 0 * a_3491.a_1081)
               {
                  stMoveBlockData.m_iStartXGridNo = stMoveBlockData.m_iStartXGridNo;
                  stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iStartYGridNo;
                  stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iStartXGridNo;
                  stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iStartYGridNo;
                  stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iStartXGridNo + 1;
                  stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iStartYGridNo;
                  stMoveBlockData.m_WaitTime = 0 * 20;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
                  st_DisplayObject = new Vector.<DisplayObject>();
                  for each(stDis in stMoveBlockMap.m_vDisplayObject)
                  {
                     st_DisplayObject.push(stDis);
                  }
                  stMoveBlockMap.MoveStart();
                  stMoveBlockMap.m_vDisplayObject = st_DisplayObject;
               }
               else if(stMoveBlockMap.y == 5 * a_3491.a_1081)
               {
                  stMoveBlockData.m_iDefultXGridNo = stMoveBlockData.m_iStartXGridNo;
                  stMoveBlockData.m_iDefultYGridNo = stMoveBlockData.m_iStartYGridNo;
                  stMoveBlockData.m_iEndXGridNo = stMoveBlockData.m_iStartXGridNo;
                  stMoveBlockData.m_iEndYGridNo = stMoveBlockData.m_iStartYGridNo;
                  --stMoveBlockData.m_iStartXGridNo;
                  stMoveBlockData.m_iStartYGridNo = stMoveBlockData.m_iStartYGridNo;
                  stMoveBlockData.m_WaitTime = 0 * 20;
                  stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
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
      
      private function addBigCoconutMouse() : void
      {
         var index:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var n:int = 0;
         m_iXGridNo = 8;
         m_iYGridNo = this.m_stRandomSeed.nextInt(3) + 2;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stTargetFieldGrid != null)
         {
            stBaseMoveIntruder = BigCoconutMouseMoveIntruder.a_3926();
            if(stBaseMoveIntruder)
            {
               (stBaseMoveIntruder as BigCoconutMouseMoveIntruder).FULL_HP = 60000;
               stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               stBaseMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
               stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.OBSTACL_TYPE);
            }
         }
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var enterRoom:Object = null;
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("DayHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("DayLowAirCloudBitmapData");
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(i = 0; i < BattleFieldView.a_1012; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[i][2].m_iFieldGridType = 6;
               }
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][4].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][4].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][5].m_iFieldGridType = 8;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 8;
               this.m_iAppearedTime = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
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

