package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.WorldBoss
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class FastFoodBar1GameMap extends BaseGameMoveMap
   {
      
      public var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var lColdStarRingGridEffect:Array = new Array([],[],[[0,0,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[0,2,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[0,4,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[0,6,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[0,8,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[2,8,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[4,8,3,MoveBlockFieldGrid.MOVE_RIGHT,3],[6,8,3,MoveBlockFieldGrid.MOVE_LEFT,3],[6,6,3,MoveBlockFieldGrid.MOVE_LEFT,3],[6,4,3,MoveBlockFieldGrid.MOVE_LEFT,3],[6,2,3,MoveBlockFieldGrid.MOVE_LEFT,3],[6,0,3,MoveBlockFieldGrid.MOVE_LEFT,3],[4,0,3,MoveBlockFieldGrid.MOVE_UP,3],[2,0,3,MoveBlockFieldGrid.MOVE_UP,3]]);
      
      private var m_TotalObstaclePos:Array = new Array([[3,0],[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8]],[[2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[3,0],[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8],[4,0],[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[4,7],[4,8]],[[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],[6,8],[1,0],[2,0],[3,0],[4,0],[5,0],[1,8],[2,8],[3,8],[4,8],[5,8]]);
      
      private var m_stChangeEffect:FastFoodChangeStepEffect;
      
      private var m_iStep:int;
      
      private var m_iCreateLeaveTick1:int = 80;
      
      private var m_iCreateType1:int = 1;
      
      private var m_iCreateLeaveTick2:int = 160;
      
      private var m_iCreateType2:int = 1;
      
      private var m_iCreateLeaveTick3:int = 80;
      
      private var m_iCreateType3:int = 1;
      
      private var m_iChangeTick:int = -1;
      
      private var m_bCreateSmoke:Boolean = false;
      
      private var a_1058:Array = null;
      
      private var m_stHasFan:Boolean = false;
      
      public function FastFoodBar1GameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
      }
      
      public function GetBackGround2Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("BattleFieldBackgroud2BitmapData");
      }
      
      public function GetBackGround3Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("BattleFieldBackgroud3BitmapData");
      }
      
      public function GetSevenLeft2Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("SevenLeft2BattleFiledBitmapData");
      }
      
      public function GetSevenLeft3Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("SevenLeft3BattleFiledBitmapData");
      }
      
      override public function a_4177() : void
      {
         a_1789.getInstance().removeEventListener("FastFoodStepChange",this.OnStepChange);
         this.ReleaseChgEffect();
         this.ReleaseAll();
         super.a_4177();
      }
      
      private function CreateByArray(array:Array) : void
      {
         for(var i:int = 0; i < array.length; i++)
         {
            this.CreateBlockGrid(array[i]);
         }
      }
      
      private function HasDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return !(null == stFieldGrid.m_stProtector && null == stFieldGrid.m_stAttackFighter && null == stFieldGrid.m_stTrayDefense && null == stFieldGrid.m_stBoomDefense && null == stFieldGrid.m_stFlowerDefense && null == stFieldGrid.m_stBaseAuxiliaryFighter);
      }
      
      protected function ClearChangeGrid(stFieldGrid:a_3491) : void
      {
         BattleDestroyUtil.ClearChangeDefenseGrid(stFieldGrid,1,1);
      }
      
      private function ClearByArray(array:Array) : void
      {
         var grid:a_3491 = null;
         for(var i:int = 0; i < array.length; i++)
         {
            grid = this.m_stCurrentBattleFieldView.a_3438(array[i][1],array[i][0]);
            if(grid != null)
            {
               if(this.HasDefense(grid))
               {
                  this.CreateSmoke(array[i][1],array[i][0]);
               }
               this.ClearChangeGrid(grid);
               grid.m_iInitialXGridNo = array[i][1];
               grid.m_iInitialYGridNo = array[i][0];
            }
         }
      }
      
      private function ChangeGridType(array:Array, type:int) : void
      {
         var grid:a_3491 = null;
         for(var i:int = 0; i < array.length; i++)
         {
            grid = this.m_stCurrentBattleFieldView.a_3438(array[i][1],array[i][0]);
            if(grid != null)
            {
               grid.m_iFieldGridType = type;
            }
         }
      }
      
      private function ReleaseChgEffect() : void
      {
         if(this.m_stChangeEffect != null)
         {
            this.m_stChangeEffect.a_3940();
            this.m_stChangeEffect = null;
         }
      }
      
      public function CreateSmoke(iNoX:int, iNoY:int) : void
      {
         var smoke:FastFoodSmokeEffect = null;
         if(this.m_bCreateSmoke == false)
         {
            return;
         }
         smoke = FastFoodSmokeEffect.a_3926();
         smoke.a_1797(false);
         this.m_stCurrentBattleFieldView.AddToBattleView(smoke,BattleLayerDefine.EFFECTS_TOP_TYPE);
         smoke.x = a_3491.a_1080 * iNoX;
         smoke.y = a_3491.a_1081 * iNoY;
      }
      
      private function ChangeStep(step:int) : void
      {
         this.m_iStep = step;
         if(step == 1)
         {
            this.ReleaseChgEffect();
            this.m_stChangeEffect = FastFoodChangeStepEffect.a_3926();
            this.m_stChangeEffect.a_1797(false);
            this.m_stCurrentBattleFieldView.AddToBattleView(this.m_stChangeEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
            this.m_stChangeEffect.x = -96;
            this.m_stChangeEffect.y = -5;
            this.m_iCreateLeaveTick1 = 80;
            this.m_iCreateType1 = 1;
            this.ChangeGridType(this.m_TotalObstaclePos[0],8);
            this.CreateByArray(this.lColdStarRingGridEffect[0]);
            this.m_iChangeTick = -1;
            a_4172().copyPixels(a_4174(),a_4174().rect,new Point(293,100));
         }
         else if(step == 2)
         {
            this.m_iCreateLeaveTick1 = 80;
            this.m_iCreateType1 = 1;
            this.m_iCreateLeaveTick2 = 160;
            this.m_iCreateType2 = 1;
            this.m_iCreateLeaveTick3 = 80;
            this.m_iCreateType3 = 0;
            this.m_stChangeEffect.Change2Step2();
            this.m_bCreateSmoke = true;
            this.ReleaseAll();
            this.ClearByArray(this.m_TotalObstaclePos[0]);
            this.ClearByArray(this.m_TotalObstaclePos[1]);
            this.ChangeGridType(this.m_TotalObstaclePos[0],0);
            this.ChangeGridType(this.m_TotalObstaclePos[1],8);
            this.m_bCreateSmoke = false;
            this.m_iChangeTick = 35;
            a_4172().copyPixels(this.GetSevenLeft2Bitmapdata(),this.GetSevenLeft2Bitmapdata().rect,new Point(293,100));
         }
         else if(step == 3)
         {
            this.m_stChangeEffect.Change2Step3();
            this.m_bCreateSmoke = true;
            this.ReleaseAll();
            this.ClearByArray(this.m_TotalObstaclePos[1]);
            this.ClearByArray(this.m_TotalObstaclePos[2]);
            this.ChangeGridType(this.m_TotalObstaclePos[1],0);
            this.ChangeGridType(this.m_TotalObstaclePos[2],8);
            this.m_iChangeTick = 35;
            this.m_bCreateSmoke = false;
            a_4172().copyPixels(this.GetSevenLeft3Bitmapdata(),this.GetSevenLeft3Bitmapdata().rect,new Point(293,100));
         }
      }
      
      private function ChangeGride(stBaseDefense:a_3962, newFieldGrid:a_3491) : void
      {
         var stInitialFieldGrid:a_3491 = null;
         if(stBaseDefense == null || stBaseDefense.stFieldGrid == null)
         {
            return;
         }
         var newStarDegree:int = stBaseDefense.a_1094;
         stBaseDefense.m_iDieType = 2;
         stBaseDefense.a_3969(stBaseDefense.iLifeValue);
         stBaseDefense.m_iPlaceTimeIntervals = this.m_stCurrentBattleFieldView.iTimeIntervalNum;
         var addResult:Boolean = newFieldGrid.CheckAddDefense(stBaseDefense);
         if(addResult)
         {
            stInitialFieldGrid = this.m_stCurrentBattleFieldView.a_3438(newFieldGrid.m_iXGridNo,newFieldGrid.m_iYGridNo);
            a_3962.a_1088.a_2059(stBaseDefense.m_iDefenseGlobalID,stBaseDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,newStarDegree);
         }
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var enterRoom:Object = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.ChangeStep(1);
               a_1789.getInstance().addEventListener("FastFoodStepChange",this.OnStepChange);
            }
         }
         return true;
      }
      
      private function OnStepChange(stDataEvent:a_1778) : void
      {
         var step:int = int(stDataEvent.dataObject[0]);
         this.ChangeStep(step);
      }
      
      public function RemoveTargetgrid(blockMap:MoveBlockMap) : void
      {
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
      
      public function ReleaseAll() : void
      {
         ReleaseMoveMap();
         m_vMoveBlockMap.length = 0;
      }
      
      public function CreateBlockGrid(gridParams:Array) : void
      {
         var stMoveBlockMap:FastFoodMoveBlockMap = new FastFoodMoveBlockMap(0,8);
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = gridParams[1];
         stMoveBlockData.m_iDefultYGridNo = gridParams[0];
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 1;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 8;
         stMoveBlockData.m_iEndYGridNo = 6;
         stMoveBlockData.m_iStartResidenceTime = 0;
         stMoveBlockData.m_iEndResideceTime = 0;
         stMoveBlockData.m_iDefultDirection = gridParams[3];
         stMoveBlockData.m_iDirectionType = gridParams[4];
         stMoveBlockData.m_iSpeed = a_3491.a_1080 / (4 * 20);
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap.CreateBlock(this,gridParams[2]);
         if(gridParams[2] != 0)
         {
            this.CreateSmoke(gridParams[1],gridParams[0]);
         }
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var iRemainMouse:int = 0;
         var i:int = 0;
         var grid:FastFoodMoveBlockMap = null;
         this.UpdateAllLight(this.m_stCurrentBattleFieldView);
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum != 0)
         {
            if(this.m_iChangeTick > 0)
            {
               --this.m_iChangeTick;
               if(this.m_iChangeTick == 24 || this.m_iChangeTick == 12 || this.m_iChangeTick == 0)
               {
                  this.m_stCurrentBattleFieldView.a_3466();
               }
               if(this.m_iChangeTick == 0)
               {
                  this.m_bCreateSmoke = true;
                  if(this.m_iStep == 2)
                  {
                     this.CreateByArray(this.lColdStarRingGridEffect[1]);
                  }
                  else if(this.m_iStep == 3)
                  {
                     this.CreateByArray(this.lColdStarRingGridEffect[2]);
                  }
                  this.m_bCreateSmoke = false;
               }
            }
            else if(this.m_iStep == 1)
            {
               --this.m_iCreateLeaveTick1;
               if(this.m_iCreateLeaveTick1 == 0)
               {
                  this.CreateBlockGrid([3,0,this.m_iCreateType1,MoveBlockFieldGrid.MOVE_RIGHT,4]);
                  this.m_iCreateType1 = 1 - this.m_iCreateType1;
                  this.m_iCreateLeaveTick1 = 160;
               }
            }
            else if(this.m_iStep == 2)
            {
               --this.m_iCreateLeaveTick1;
               if(this.m_iCreateLeaveTick1 == 0)
               {
                  this.CreateBlockGrid([2,8,this.m_iCreateType1,MoveBlockFieldGrid.MOVE_LEFT,4]);
                  this.m_iCreateType1 = 1 - this.m_iCreateType1;
                  this.m_iCreateLeaveTick1 = 160;
               }
               --this.m_iCreateLeaveTick2;
               if(this.m_iCreateLeaveTick2 == 0)
               {
                  this.CreateBlockGrid([3,0,this.m_iCreateType1 == 1 ? 2 : 0,MoveBlockFieldGrid.MOVE_RIGHT,4]);
                  this.m_iCreateType2 = 1 - this.m_iCreateType2;
                  this.m_iCreateLeaveTick2 = 160;
               }
               --this.m_iCreateLeaveTick3;
               if(this.m_iCreateLeaveTick3 == 0)
               {
                  this.CreateBlockGrid([4,8,this.m_iCreateType1,MoveBlockFieldGrid.MOVE_LEFT,4]);
                  this.m_iCreateType3 = 1 - this.m_iCreateType3;
                  this.m_iCreateLeaveTick3 = 160;
               }
            }
            else if(iTimeNum % 10 == 0)
            {
               iRemainMouse = 0;
               i = 0;
               for(i = 0; i < m_vMoveBlockMap.length; i++)
               {
                  grid = m_vMoveBlockMap[i] as FastFoodMoveBlockMap;
                  if(!grid.IsDeadMouse())
                  {
                     iRemainMouse++;
                  }
               }
               if(iRemainMouse < 7)
               {
                  for(i = 0; i < m_vMoveBlockMap.length; i++)
                  {
                     grid = m_vMoveBlockMap[i] as FastFoodMoveBlockMap;
                     grid.Refresh2MAX();
                  }
               }
            }
         }
      }
      
      public function IsLight(iNoX:int, iNoY:int) : Boolean
      {
         return this.a_1058[iNoY][iNoX];
      }
      
      public function HasFan() : Boolean
      {
         return this.m_stHasFan;
      }
      
      public function UpdateAllLight(btView:BattleFieldView) : void
      {
         var defense:Object = null;
         var typeID:int = 0;
         var i:int = 0;
         var j:int = 0;
         if(this.a_1058 == null)
         {
            this.a_1058 = new Array();
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               this.a_1058[i] = new Array();
            }
         }
         for(i = 0; i < BattleFieldView.a_1012; i++)
         {
            this.a_1058[i] = new Array();
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               this.a_1058[i][j] = false;
            }
         }
         var stFieldGridVector:Array = btView.stFieldGridsVector;
         this.m_stHasFan = false;
         var findAll:Boolean = false;
         for(i = 0; i < BattleFieldView.a_1012; i++)
         {
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               defense = stFieldGridVector[i][j].m_stFlowerDefense;
               if(Boolean(!findAll) && Boolean(defense) && defense.iEnergyTypeID == 3)
               {
                  this.UpdateLight(btView,0,BattleFieldView.a_1011,0,BattleFieldView.a_1012);
                  findAll = true;
               }
               if(Boolean(!findAll) && Boolean(defense) && defense.iEnergyTypeID == 1)
               {
                  this.UpdateLight(btView,j - 1,j + 2,i - 1,i + 2);
               }
               if(stFieldGridVector[i][j].m_stAttackFighter != null)
               {
                  typeID = int(stFieldGridVector[i][j].m_stAttackFighter.a_3512());
                  if(typeID == 286851424 || typeID == 286851408 || typeID == 286851614 || typeID == 286851615)
                  {
                     this.m_stHasFan = true;
                  }
               }
            }
         }
      }
      
      private function UpdateLight(btView:BattleFieldView, startX:int, endX:int, startY:int, endY:int) : void
      {
         var j:int = 0;
         var stFieldGridVector:Array = btView.stFieldGridsVector;
         for(var i:int = startY; i < endY; i++)
         {
            for(j = startX; j < endX; j++)
            {
               if(i >= 0 && i < BattleFieldView.a_1012 && j >= 0 && j < BattleFieldView.a_1011)
               {
                  this.a_1058[i][j] = true;
               }
            }
         }
      }
   }
}

