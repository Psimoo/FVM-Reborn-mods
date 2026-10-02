package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.Anniversary13
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class FruitPoolFourthDayGameMap extends BaseGameMap
   {
      
      private static var ms_arrPlotState:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iAppearedTime:int;
      
      private var m_AddObstaclePos1:Array = new Array([0,3]);
      
      private var m_AddObstaclePos2:Array = new Array([1,6]);
      
      private var m_AddObstaclePos3:Array = new Array([6,3]);
      
      private var m_AddObstaclePos4:Array = new Array([5,6]);
      
      private var m_AddObstaclePos5:Array = new Array();
      
      private var m_AddPlotPos1:Array = new Array([2,3]);
      
      private var m_AddPlotPos2:Array = new Array([2,6]);
      
      private var m_AddPlotPos3:Array = new Array([4,3]);
      
      private var m_AddPlotPos4:Array = new Array([4,6]);
      
      private var m_AddPlotPos5:Array = new Array();
      
      private var m_TotalObstaclePos:Array = new Array();
      
      public function FruitPoolFourthDayGameMap()
      {
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         if(null == ms_arrPlotState)
         {
            ms_arrPlotState = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrPlotState[iYIndex] = [];
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
               {
                  ms_arrPlotState[iYIndex][iXIndex] = false;
               }
            }
         }
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_iAppearedTime = 0;
               while(this.m_TotalObstaclePos.length > 0)
               {
                  this.m_TotalObstaclePos.pop();
               }
               for(j = 0; j < BattleFieldView.a_1011; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[0][j].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[1][j].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[5][j].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[6][j].m_isNeedTray = true;
               }
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][3].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][3].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][6].m_iFieldGridType = 1;
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
                  {
                     ms_arrPlotState[iYIndex][iXIndex] = false;
                  }
               }
            }
         }
         return true;
      }
      
      private function ChangePlotState(stFieldGrid:a_3491, working:Boolean) : void
      {
         if(stFieldGrid != null)
         {
            ms_arrPlotState[stFieldGrid.m_iYGridNo][stFieldGrid.m_iXGridNo] = working;
         }
      }
      
      override public function a_4175() : a_4450
      {
         return a_4454.a_3926();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var working:Boolean = false;
         var k:int = 0;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         var i:int = 0;
         var j:int = 0;
         if(this.m_iCurrentTimeIntval == 0 * 20)
         {
            for(i = 0; i < this.m_AddObstaclePos1.length; i++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos1[i][1]);
               m_iYGridNo = int(this.m_AddObstaclePos1[i][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addObstacle(stTargetFieldGrid,1);
            }
            for(i = 0; i < this.m_AddObstaclePos2.length; i++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos2[i][1]);
               m_iYGridNo = int(this.m_AddObstaclePos2[i][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addObstacle(stTargetFieldGrid,2);
            }
            for(i = 0; i < this.m_AddObstaclePos3.length; i++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos3[i][1]);
               m_iYGridNo = int(this.m_AddObstaclePos3[i][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addObstacle(stTargetFieldGrid,1);
            }
            for(i = 0; i < this.m_AddObstaclePos4.length; i++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos4[i][1]);
               m_iYGridNo = int(this.m_AddObstaclePos4[i][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addObstacle(stTargetFieldGrid,2);
            }
            for(j = 0; j < this.m_AddPlotPos1.length; j++)
            {
               m_iXGridNo = int(this.m_AddPlotPos1[j][1]);
               m_iYGridNo = int(this.m_AddPlotPos1[j][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addPlotEffect(stTargetFieldGrid,4);
            }
            for(j = 0; j < this.m_AddPlotPos2.length; j++)
            {
               m_iXGridNo = int(this.m_AddPlotPos2[j][1]);
               m_iYGridNo = int(this.m_AddPlotPos2[j][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addPlotEffect(stTargetFieldGrid,1);
            }
            for(j = 0; j < this.m_AddPlotPos3.length; j++)
            {
               m_iXGridNo = int(this.m_AddPlotPos3[j][1]);
               m_iYGridNo = int(this.m_AddPlotPos3[j][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addPlotEffect(stTargetFieldGrid,4);
            }
            for(j = 0; j < this.m_AddPlotPos4.length; j++)
            {
               m_iXGridNo = int(this.m_AddPlotPos4[j][1]);
               m_iYGridNo = int(this.m_AddPlotPos4[j][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               this.addPlotEffect(stTargetFieldGrid,1);
            }
         }
         if(iTimeNum % 2 == 0)
         {
            k = 0;
            while(this.m_TotalObstaclePos.length > 0)
            {
               this.m_TotalObstaclePos.pop();
            }
            working = true;
            for(k = 0; k < this.m_AddPlotPos1.length; k++)
            {
               m_iXGridNo = int(this.m_AddPlotPos1[k][1]);
               m_iYGridNo = int(this.m_AddPlotPos1[k][0]);
               if(ms_arrPlotState[m_iYGridNo][m_iXGridNo] == false)
               {
                  working = false;
                  break;
               }
            }
            for(k = 0; k < this.m_AddObstaclePos1.length; k++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos1[k][1]);
               m_iYGridNo = int(this.m_AddObstaclePos1[k][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid.m_stObstacleEffect != null)
               {
                  ObstacleEffect(stTargetFieldGrid.m_stObstacleEffect).changeState(working);
               }
               if(working)
               {
                  this.m_TotalObstaclePos.push([m_iYGridNo,m_iXGridNo]);
               }
            }
            working = true;
            for(k = 0; k < this.m_AddPlotPos2.length; k++)
            {
               m_iXGridNo = int(this.m_AddPlotPos2[k][1]);
               m_iYGridNo = int(this.m_AddPlotPos2[k][0]);
               if(ms_arrPlotState[m_iYGridNo][m_iXGridNo] == false)
               {
                  working = false;
                  break;
               }
            }
            for(k = 0; k < this.m_AddObstaclePos2.length; k++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos2[k][1]);
               m_iYGridNo = int(this.m_AddObstaclePos2[k][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid.m_stObstacleEffect != null)
               {
                  ObstacleEffect(stTargetFieldGrid.m_stObstacleEffect).changeState(working);
               }
               if(working)
               {
                  this.m_TotalObstaclePos.push([m_iYGridNo,m_iXGridNo]);
               }
            }
            working = true;
            for(k = 0; k < this.m_AddPlotPos3.length; k++)
            {
               m_iXGridNo = int(this.m_AddPlotPos3[k][1]);
               m_iYGridNo = int(this.m_AddPlotPos3[k][0]);
               if(ms_arrPlotState[m_iYGridNo][m_iXGridNo] == false)
               {
                  working = false;
                  break;
               }
            }
            for(k = 0; k < this.m_AddObstaclePos3.length; k++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos3[k][1]);
               m_iYGridNo = int(this.m_AddObstaclePos3[k][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid.m_stObstacleEffect != null)
               {
                  ObstacleEffect(stTargetFieldGrid.m_stObstacleEffect).changeState(working);
               }
               if(working)
               {
                  this.m_TotalObstaclePos.push([m_iYGridNo,m_iXGridNo]);
               }
            }
            working = true;
            for(k = 0; k < this.m_AddPlotPos4.length; k++)
            {
               m_iXGridNo = int(this.m_AddPlotPos4[k][1]);
               m_iYGridNo = int(this.m_AddPlotPos4[k][0]);
               if(ms_arrPlotState[m_iYGridNo][m_iXGridNo] == false)
               {
                  working = false;
                  break;
               }
            }
            for(k = 0; k < this.m_AddObstaclePos4.length; k++)
            {
               m_iXGridNo = int(this.m_AddObstaclePos4[k][1]);
               m_iYGridNo = int(this.m_AddObstaclePos4[k][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid.m_stObstacleEffect != null)
               {
                  ObstacleEffect(stTargetFieldGrid.m_stObstacleEffect).changeState(working);
               }
               if(working)
               {
                  this.m_TotalObstaclePos.push([m_iYGridNo,m_iXGridNo]);
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
         }
      }
      
      public function addObstacle(stFieldGrid:a_3491, m_iType:int = 1) : void
      {
         var stEffect:ObstacleEffect = null;
         if(stFieldGrid != null)
         {
            stEffect = ObstacleEffect.a_3926();
            stEffect.stTargetFieldGrid = stFieldGrid;
            stEffect.m_iType = m_iType;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 13;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 30;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            this.m_TotalObstaclePos.push([stFieldGrid.m_iYGridNo,stFieldGrid.m_iXGridNo]);
            stEffect.play();
         }
      }
      
      public function addPlotEffect(stFieldGrid:a_3491, m_iType:int = 1) : void
      {
         var stEffect:PlotEffect = null;
         if(stFieldGrid != null)
         {
            stEffect = PlotEffect.a_3926();
            stEffect.stTargetFieldGrid = stFieldGrid;
            stEffect.stCallBackFunc = this.ChangePlotState;
            stEffect.m_iType = m_iType;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 2;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 2;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stEffect.play();
         }
      }
      
      protected function IsShotInXRang(numXShotPos:Number, arrXRang:Array) : Boolean
      {
         var arrXTempRang:Array = null;
         for each(arrXTempRang in arrXRang)
         {
            if(numXShotPos > arrXTempRang[0] && numXShotPos < arrXTempRang[1])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function GetFireHurtXRangByRow(iYIndexNum:int) : Array
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrXFireRange:Array = [];
         for(var i:int = 0; i < this.m_TotalObstaclePos.length; i++)
         {
            m_iXGridNo = int(this.m_TotalObstaclePos[i][1]);
            m_iYGridNo = int(this.m_TotalObstaclePos[i][0]);
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid.m_stMouseObstacle != null && (stTargetFieldGrid.m_iFieldGridType == 1 || stTargetFieldGrid.m_iFieldGridType == 4))
            {
               arrXFireRange.push([a_3491.a_1080 * (m_iXGridNo + 0),a_3491.a_1080 * (m_iXGridNo + 1)]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
   }
}

