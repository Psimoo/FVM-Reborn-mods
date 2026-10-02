package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.ColdStarRing
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class DayColdStarRingGameMap extends BaseGameMoveMap implements IColdStarRingMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCreateCount:int = 1;
      
      private var lColdStarRingGridEffect:Array = new Array();
      
      private var m_TotalObstaclePos:Array = new Array([0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8],[4,3],[4,4],[4,5],[4,6],[4,7],[4,8],[5,3],[5,4],[5,5],[5,6],[5,7],[5,8],[6,3],[6,4],[6,5],[6,6],[6,7],[6,8]);
      
      private var m_FlyGranuleMouseArr:Array = new Array();
      
      private var m_iCreateTickCount:int = 0;
      
      private var m_iLastCreateTick:int = 0;
      
      private var m_iCreatePosition:int = 0;
      
      private var m_iGridStartPos:Array = new Array(3,3,3,3,3,3,3);
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_stShuffleArray:Array;
      
      private var iCreateCount:int = 0;
      
      private var lastCreateTick:uint = 0;
      
      private var lastCreatePosY:int = -1;
      
      public function DayColdStarRingGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function a_4177() : void
      {
         for(var i:int = 0; i < this.lColdStarRingGridEffect.length; i++)
         {
            this.lColdStarRingGridEffect[i].a_3940();
         }
         this.lColdStarRingGridEffect.length = 0;
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
         var enterRoom:Object = null;
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
               this.m_iLastCreateTick = 0;
               this.m_iCreateTickCount = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(3);
               this.m_iCreateCount = 1;
               this.lastCreateTick = 0;
               this.lastCreatePosY = -1;
            }
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
         if(this.m_FlyGranuleMouseArr.length >= 4)
         {
            return false;
         }
         var initPosY:int = -1;
         var initPosX:int = -1;
         if(this.m_iCreatePosition == 0)
         {
            initPosY = -60;
         }
         else if(this.m_iCreatePosition == 1)
         {
            initPosY = BattleFieldView.a_1014 + 60;
         }
         else if(this.m_iCreatePosition == 2)
         {
            initPosX = BattleFieldView.a_1013 + 60;
         }
         m_iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
         m_iYGridNo = this.m_stRandomSeed.nextInt(4) + 1;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389008);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(null,100000,a_3491.a_1080 / (3 * 20),initPosY,initPosX);
            stBaseMoveIntruder.a_1797((1 << 16) + m_iYGridNo + 30,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
            this.m_FlyGranuleMouseArr.push(stBaseMoveIntruder);
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.DEFENSE_TRAY_TYPE);
         }
         return true;
      }
      
      public function CreateNormalGrid(iTargetNoY:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var effect:ColdStarRingGridEffect = null;
         if(iTargetNoY == -1)
         {
            return;
         }
         this.m_stCurrentBattleFieldView.stFieldGridsVector[iTargetNoY][8].m_iFieldGridType = 0;
         var stMoveBlockMap:MoveBlockMap = new MoveBlockMap();
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 8;
         stMoveBlockData.m_iDefultYGridNo = iTargetNoY;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 1;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = iTargetNoY;
         stMoveBlockData.m_iEndXGridNo = 8;
         stMoveBlockData.m_iEndYGridNo = iTargetNoY;
         stMoveBlockData.m_iStartResidenceTime = 0;
         stMoveBlockData.m_iEndResideceTime = 0;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         stMoveBlockData.m_iDirectionType = 2;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(8,iTargetNoY);
         stMoveBlockData.m_iSpeed = a_3491.a_1080 / (5 * 20);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap.SetBattleFieldView(stTargetFieldGrid.m_stCurrentBattbleFieldView);
         stMoveBlockMap.MoveStart();
         effect = ColdStarRingGridEffect.a_3926();
         if(effect)
         {
            effect.a_1797(false);
            effect.InitData(stMoveBlockMap,this,stTargetFieldGrid.m_stCurrentBattbleFieldView);
            if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(effect,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
            }
            stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.DEFENSE_TRAY_TYPE,stTargetFieldGrid);
            effect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 - 30;
            effect.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 35;
            this.lColdStarRingGridEffect.push(effect);
         }
      }
      
      public function CreateBlockGrid(iTargetNoY:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var adMoveIntruder:ColdStarRingObstacleMoveIntruder = null;
         if(iTargetNoY == -1)
         {
            return;
         }
         this.m_stCurrentBattleFieldView.stFieldGridsVector[iTargetNoY][8].m_iFieldGridType = 8;
         var stMoveBlockMap:MoveBlockMap = new MoveBlockMap();
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 8;
         stMoveBlockData.m_iDefultYGridNo = iTargetNoY;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 1;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = iTargetNoY;
         stMoveBlockData.m_iEndXGridNo = 8;
         stMoveBlockData.m_iEndYGridNo = iTargetNoY;
         stMoveBlockData.m_iStartResidenceTime = 0;
         stMoveBlockData.m_iEndResideceTime = 0;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         stMoveBlockData.m_iDirectionType = 2;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(8,iTargetNoY);
         stMoveBlockData.m_iSpeed = a_3491.a_1080 / (5 * 20);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap.SetBattleFieldView(stTargetFieldGrid.m_stCurrentBattbleFieldView);
         stMoveBlockMap.MoveStart();
         adMoveIntruder = ColdStarRingObstacleMoveIntruder.a_3926();
         if(adMoveIntruder)
         {
            adMoveIntruder.a_1797((1 << 16) + iTargetNoY + 150,-1);
            adMoveIntruder.InitData(80000,stMoveBlockMap,this);
            adMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(adMoveIntruder,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
            }
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(adMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.DEFENSE_TRAY_TYPE);
            adMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 - 30;
            adMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 35;
         }
      }
      
      public function RemoveTargetgrid(blockMap:MoveBlockMap) : void
      {
         var m_iXGridNo:int = blockMap.getMoveBlockFieldGrid().m_iXGridNo;
         var m_iYGridNo:int = blockMap.getMoveBlockFieldGrid().m_iYGridNo;
         this.m_stCurrentBattleFieldView.stFieldGridsVector[m_iYGridNo][m_iXGridNo].m_iFieldGridType = 8;
         var index:int = m_vMoveBlockMap.indexOf(blockMap);
         if(index != -1)
         {
            m_vMoveBlockMap.splice(index,1);
            blockMap.ReleaseMoveMap();
         }
         else
         {
            trace("移除格子异常");
         }
      }
      
      public function UpdateStarGrid() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         this.m_iGridStartPos = new Array(3,3,3,3,3,3,3);
         for each(stMoveBlockMap in m_vMoveBlockMap)
         {
            stMoveBlockMap.m_stMoveBlockData.m_iStartXGridNo = this.m_iGridStartPos[stMoveBlockMap.getMoveBlockFieldGrid().m_iYGridNo];
            ++this.m_iGridStartPos[stMoveBlockMap.getMoveBlockFieldGrid().m_iYGridNo];
         }
      }
      
      private function createShuffleArray2() : int
      {
         var index:int = 0;
         var preventY:int = -1;
         if(this.lastCreatePosY != -1 && this.m_iCurrentTimeIntval < this.lastCreateTick + 200)
         {
            preventY = this.lastCreatePosY;
         }
         var array:Array = new Array();
         for(var i:int = 0; i < this.m_iGridStartPos.length; i++)
         {
            if(this.m_iGridStartPos[i] <= 7 && i != preventY)
            {
               array.push(i);
            }
         }
         this.m_stShuffleArray = BattleRandomUtil.ShuffleArray(array,this.m_stRandomSeed);
         if(this.m_stShuffleArray.length > 0)
         {
            index = int(this.m_stShuffleArray[0]);
            this.m_stShuffleArray.splice(0,1);
            this.lastCreateTick = this.m_iCurrentTimeIntval;
            this.lastCreatePosY = index;
            return index;
         }
         return -1;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         this.m_iCurrentTimeIntval = iTimeNum;
         this.UpdateStarGrid();
         this.iCreateCount = 0;
         if(iTimeNum != 0)
         {
            if(iTimeNum % (8 * 20) == 0)
            {
               this.CreateNormalGrid(this.createShuffleArray2());
               ++this.m_iCreateCount;
            }
            if(iTimeNum % (44 * 20) == 0)
            {
               this.CreateBlockGrid(this.createShuffleArray2());
            }
         }
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(iTimeNum - this.m_iLastCreateTick == 4 * 20 && this.m_iCreateTickCount < 2)
            {
               this.addFlyGranuleMouse();
               ++this.m_iCreateTickCount;
               this.m_iLastCreateTick = iTimeNum;
            }
            if(iTimeNum - this.m_iLastCreateTick == 32 * 20 && this.m_iCreateTickCount == 2)
            {
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(3);
               this.addFlyGranuleMouse();
               this.m_iCreateTickCount = 1;
               this.m_iLastCreateTick = iTimeNum;
            }
         }
      }
   }
}

