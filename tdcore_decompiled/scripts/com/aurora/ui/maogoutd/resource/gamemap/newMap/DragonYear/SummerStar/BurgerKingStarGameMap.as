package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.BitmapData;
   
   public class BurgerKingStarGameMap extends BaseGameMoveMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrEffect:Array = new Array();
      
      private var m_FlyGranuleMouseArr:Array = new Array();
      
      private var m_LastBornField:a_3491;
      
      private var m_iCreateTickCount:int = 0;
      
      private var m_iLastCreateTick:int = 0;
      
      private var m_iCreatePosition:int = 0;
      
      private var m_iWaveStatus:int;
      
      private var m_TotalObstaclePos:Array = new Array([0,0],[0,8],[1,0],[1,1],[1,7],[1,8],[3,0],[3,6],[3,7],[3,8],[5,0],[5,1],[5,7],[5,8],[6,0],[6,8]);
      
      private var m_TotalObstaclePos1:Array = new Array([0,1],[0,4],[0,7],[6,1],[6,4],[6,7]);
      
      public function BurgerKingStarGameMap()
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
         item.m_iDefultXGridNo = 1;
         item.m_iDefultYGridNo = 0;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 2;
         item.m_iEndYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iWidth = 7;
         item.m_iID = 0;
         item.ResidenceTime = 6;
         item.m_iXOffset = -14;
         item.m_iYOffset = -8;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 2;
         item.m_iDefultYGridNo = 1;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 1;
         item.m_iEndXGridNo = 4;
         item.m_iEndYGridNo = 1;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         item.m_iWidth = 5;
         item.m_iID = 1;
         item.ResidenceTime = 5;
         item.m_iXOffset = -18;
         item.m_iYOffset = 0;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 0;
         item.m_iDefultYGridNo = 2;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 2;
         item.m_iEndXGridNo = 0;
         item.m_iEndYGridNo = 2;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         item.m_iWidth = 9;
         item.m_iID = 2;
         item.ResidenceTime = 5;
         item.m_iXOffset = 0;
         item.m_iYOffset = 2;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 1;
         item.m_iDefultYGridNo = 3;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 3;
         item.m_iEndXGridNo = 4;
         item.m_iEndYGridNo = 3;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         item.m_iWidth = 5;
         item.m_iID = 3;
         item.ResidenceTime = 5;
         item.m_iXOffset = -4;
         item.m_iYOffset = 2;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 0;
         item.m_iDefultYGridNo = 4;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 4;
         item.m_iEndXGridNo = 0;
         item.m_iEndYGridNo = 4;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         item.m_iWidth = 9;
         item.m_iID = 2;
         item.ResidenceTime = 5;
         item.m_iXOffset = 0;
         item.m_iYOffset = 2;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 2;
         item.m_iDefultYGridNo = 5;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 5;
         item.m_iEndXGridNo = 4;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         item.m_iWidth = 5;
         item.m_iID = 1;
         item.ResidenceTime = 5;
         item.m_iXOffset = -18;
         item.m_iYOffset = 0;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 1;
         item.m_iDefultYGridNo = 6;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 6;
         item.m_iEndXGridNo = 2;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iWidth = 7;
         item.m_iID = 4;
         item.ResidenceTime = 6;
         item.m_iXOffset = -14;
         item.m_iYOffset = -4;
         tempArr.push(item);
         for(var i:* = int(tempArr.length - 1); i >= 0; i--)
         {
            stMoveBlockMap = new MoveBlockMap(tempArr[i].m_iXOffset,tempArr[i].m_iYOffset);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = tempArr[i].m_iID;
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = tempArr[i].m_iWidth;
            stMoveBlockData.m_iStartXGridNo = tempArr[i].m_iStartXGridNo;
            stMoveBlockData.m_iStartYGridNo = tempArr[i].m_iStartYGridNo;
            stMoveBlockData.m_iEndXGridNo = tempArr[i].m_iEndXGridNo;
            stMoveBlockData.m_iEndYGridNo = tempArr[i].m_iEndYGridNo;
            if(tempArr[i].m_iID == 2)
            {
               stMoveBlockData.m_iSpeed = 0;
            }
            else
            {
               stMoveBlockData.m_iSpeed = a_3491.a_1080 / (4 * 20);
            }
            stMoveBlockData.m_iStartResidenceTime = item.ResidenceTime * 20;
            stMoveBlockData.m_iEndResideceTime = item.ResidenceTime * 20;
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
      }
      
      private function addLaserEffect(laserPos:Array) : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stEffect:BurgerBaseLaserEffect = null;
         var offsetX:int = 0;
         var stMoveBlockMap:MoveBlockMap = null;
         for(var i:int = 0; i < laserPos.length; i++)
         {
            offsetX = m_vMoveBlockMap[0].m_stMoveBlockData.m_iDefultXGridNo - m_vMoveBlockMap[0].getMoveBlockFieldGrid().m_iXGridNo;
            var _loc9_:int = 0;
            var _loc10_:* = m_vMoveBlockMap;
            for each(stMoveBlockMap in _loc10_)
            {
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(laserPos[i][0] - offsetX,laserPos[i][1]);
               if(stTargetFieldGrid != null)
               {
                  stEffect = BurgerBaseLaserEffect.a_3926();
                  stEffect.stOriginalFieldGrid = stTargetFieldGrid;
                  stEffect.a_1797(false);
                  stEffect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                  stEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
                  this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTargetFieldGrid);
                  if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
                  {
                     stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stEffect,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
                  }
                  this.m_arrEffect.push(stEffect);
               }
            }
         }
      }
      
      override public function OnWaveStatusData(iWaveStatus:int) : void
      {
         if(iWaveStatus == 2 && this.m_iWaveStatus != 2)
         {
            this.m_iWaveStatus = iWaveStatus;
            this.addLaserEffect(new Array([1,0],[7,0]));
         }
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 1 && stData[1] == 0)
         {
            this.addLaserEffect(new Array([4,0]));
         }
         return true;
      }
      
      private function addFlyGranuleMouse() : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         for(var i:* = 0; i < this.m_FlyGranuleMouseArr.length; i++)
         {
            stBaseMoveIntruder = this.m_FlyGranuleMouseArr[i];
            if(stBaseMoveIntruder.iLifeValue <= 0 || stBaseMoveIntruder.m_stCurrentFieldGrid == null || stBaseMoveIntruder.parent == null)
            {
               this.m_FlyGranuleMouseArr.splice(i,1);
               i--;
            }
         }
         if(this.m_FlyGranuleMouseArr.length >= 3)
         {
            return false;
         }
         var initPosY:int = this.m_iCreatePosition < 1 ? -60 : int(BattleFieldView.a_1013 + 60);
         do
         {
            m_iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
            m_iYGridNo = this.m_stRandomSeed.nextInt(4) + 1;
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(this.m_LastBornField != null && this.m_LastBornField.m_iXGridNo == stTargetFieldGrid.m_iXGridNo);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389008);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(stTargetFieldGrid,100000,a_3491.a_1080 / (3 * 20),initPosY);
            stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo + 30,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
            this.m_FlyGranuleMouseArr.push(stBaseMoveIntruder);
            this.m_LastBornField = stTargetFieldGrid;
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
         }
         return true;
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         ReleaseMoveMap();
         this.removeEffectMovie();
         super.a_4177();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         this.m_iCurrentTimeIntval = iTimeNum;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(iTimeNum - this.m_iLastCreateTick == 5 * 20 && this.m_iCreateTickCount < 2)
            {
               ++this.m_iCreateTickCount;
               this.addFlyGranuleMouse();
               this.m_iLastCreateTick = iTimeNum;
            }
            if(iTimeNum - this.m_iLastCreateTick == 32 * 20 && this.m_iCreateTickCount == 2)
            {
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(2);
               this.addFlyGranuleMouse();
               this.m_iCreateTickCount = 1;
               this.m_iLastCreateTick = iTimeNum;
            }
         }
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
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
               j = 0;
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 8;
               }
               for(j = 0; j < this.m_TotalObstaclePos1.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos1[j][0]][this.m_TotalObstaclePos1[j][1]].m_iFieldGridType = 1;
               }
               this.removeEffectMovie();
               this.m_iWaveStatus = -1;
               this.m_iLastCreateTick = 0;
               this.m_iCreateTickCount = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(2);
            }
         }
         return true;
      }
      
      private function removeEffectMovie() : void
      {
         var stEffect:* = undefined;
         while(this.m_arrEffect.length > 0)
         {
            stEffect = this.m_arrEffect.pop();
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
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

