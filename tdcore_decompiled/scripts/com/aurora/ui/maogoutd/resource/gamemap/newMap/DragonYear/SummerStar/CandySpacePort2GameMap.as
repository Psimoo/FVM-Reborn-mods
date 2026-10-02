package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.BitmapData;
   
   public class CandySpacePort2GameMap extends BaseGameMoveMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_arrEffect:Array = new Array();
      
      private var m_iWaveStatus:int;
      
      private var m_TotalObstaclePos:Array = new Array([1,6],[1,7],[1,8],[3,1],[3,7],[3,8],[5,1],[5,2],[5,8]);
      
      private var m_TotalObstaclePos1:Array = new Array([0,6],[0,8],[6,6],[6,8]);
      
      public function CandySpacePort2GameMap()
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
         item.m_iDefultYGridNo = 1;
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 1;
         item.m_iEndXGridNo = 4;
         item.m_iEndYGridNo = 1;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iWidth = 5;
         item.m_iID = 0;
         item.ResidenceTime = 6;
         item.m_iXOffset = -9;
         item.m_iYOffset = 4;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 2;
         item.m_iDefultYGridNo = 3;
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 3;
         item.m_iEndXGridNo = 4;
         item.m_iEndYGridNo = 3;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iWidth = 5;
         item.m_iID = 0;
         item.ResidenceTime = 6;
         item.m_iXOffset = -9;
         item.m_iYOffset = 4;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 3;
         item.m_iDefultYGridNo = 5;
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 5;
         item.m_iEndXGridNo = 4;
         item.m_iEndYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iWidth = 5;
         item.m_iID = 0;
         item.ResidenceTime = 6;
         item.m_iXOffset = -9;
         item.m_iYOffset = 4;
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
            stMoveBlockData.m_iSpeed = a_3491.a_1080 / (4 * 20);
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
         var stMoveBlockMap:MoveBlockMap = null;
         for(var i:int = 0; i < laserPos.length; i++)
         {
            var _loc8_:int = 0;
            var _loc9_:* = m_vMoveBlockMap;
            for each(stMoveBlockMap in _loc9_)
            {
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(laserPos[i][0],laserPos[i][1]);
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
         if(iWaveStatus == 1 && this.m_iWaveStatus != 1)
         {
            this.m_iWaveStatus = iWaveStatus;
            this.addLaserEffect(new Array([6,0],[8,0]));
         }
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
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
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
   }
}

