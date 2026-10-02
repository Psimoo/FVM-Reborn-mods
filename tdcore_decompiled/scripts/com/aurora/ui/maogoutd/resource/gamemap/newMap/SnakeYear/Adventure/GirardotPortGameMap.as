package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class GirardotPortGameMap extends SeasonBaseGameMap
   {
      
      private static var ms_arrAirBitmaps:Array;
      
      private static var ms_stNightHighAirBitmapData:BitmapData;
      
      private static var ms_stNightLowAirBitmapData:BitmapData;
      
      private static var ms_stGridBitMapData:BitmapData;
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private static var m_stLandDisplay:Sprite = new Sprite();
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrSkyAirShipFansEffect:Array = [];
      
      private var m_arrFieldGridExistFans:Array = [];
      
      private var m_iWaveStatus:int = -1;
      
      private var m_iMapState:int = 0;
      
      private var arrBron:Array = new Array([0,4],[3,1],[3,7],[6,4]);
      
      private var m_iAppearedTime:int;
      
      private var m_gridBitMap:Array = new Array();
      
      public function GirardotPortGameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
         m_lGrid1 = new Array([0,5],[1,5],[2,5],[3,5],[4,5],[5,5],[6,5]);
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var stGridBitmap:Bitmap = null;
         if(null == ms_stNightHighAirBitmapData)
         {
            ms_stNightHighAirBitmapData = GetBitMap("NightHighAirCloudBitmapData");
            ms_stNightLowAirBitmapData = GetBitMap("NightLowAirCloudBitmapData");
            ms_stGridBitMapData = GetBitMap("MoveBlockBitmapData_9");
         }
         if(null == ms_arrAirBitmaps)
         {
            ms_arrAirBitmaps = [];
            for(iYIndex = 0; iYIndex < 7; iYIndex++)
            {
               if(!(iYIndex >= 1 && iYIndex <= 5))
               {
                  ms_arrAirBitmaps[iYIndex] = [];
                  for(iXIndex = 0; iXIndex < 9 - 1; iXIndex++)
                  {
                     stAirBitmap = new Bitmap();
                     if(iXIndex % 2 == 0)
                     {
                        stAirBitmap.bitmapData = ms_stNightHighAirBitmapData;
                        stAirBitmap.x = a_3491.a_1080 * iXIndex;
                        stAirBitmap.y = a_3491.a_1081 * iYIndex;
                        ms_stAirDisplaySprint.addChild(stAirBitmap);
                     }
                     else
                     {
                        stAirBitmap.bitmapData = ms_stNightLowAirBitmapData;
                        stAirBitmap.x = a_3491.a_1080 * iXIndex;
                        stAirBitmap.y = a_3491.a_1081 * iYIndex;
                        ms_stAirDisplaySprint.addChildAt(stAirBitmap,0);
                     }
                     stAirBitmap.visible = true;
                     ms_arrAirBitmaps[iYIndex][iXIndex] = stAirBitmap;
                  }
               }
            }
         }
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            if(!(iYIndex >= 1 && iYIndex <= 5))
            {
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 1; iXIndex++)
               {
                  stAirBitmap = ms_arrAirBitmaps[iYIndex][iXIndex];
                  if(Boolean(stAirBitmap) && ms_stAirDisplaySprint.contains(stAirBitmap))
                  {
                     ms_stAirDisplaySprint.removeChild(stAirBitmap);
                     stAirBitmap = null;
                  }
                  if(null == stAirBitmap)
                  {
                     stAirBitmap = new Bitmap();
                  }
                  if(iXIndex % 2 == 0)
                  {
                     stAirBitmap.bitmapData = ms_stNightHighAirBitmapData;
                     stAirBitmap.x = a_3491.a_1080 * iXIndex;
                     stAirBitmap.y = a_3491.a_1081 * iYIndex;
                     ms_stAirDisplaySprint.addChild(stAirBitmap);
                  }
                  else
                  {
                     stAirBitmap.bitmapData = ms_stNightLowAirBitmapData;
                     stAirBitmap.x = a_3491.a_1080 * iXIndex;
                     stAirBitmap.y = a_3491.a_1081 * iYIndex;
                     ms_stAirDisplaySprint.addChildAt(stAirBitmap,0);
                  }
                  stAirBitmap.visible = true;
                  ms_arrAirBitmaps[iYIndex][iXIndex] = stAirBitmap;
               }
            }
         }
         super.SetBattleFieldTerrain(stBattleFieldObject);
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_arrSkyAirShipFansEffect = [];
               this.m_arrFieldGridExistFans = [];
               this.m_iWaveStatus = -1;
               this.CreateFans(7,1);
               this.CreateFans(8,2);
               this.CreateFans(8,4);
               this.CreateFans(7,5);
               stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 1;
               stCurrentBattleFieldView.stFieldGridsVector[3][6].m_iFieldGridType = 1;
               stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 1;
               stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 1;
               this.m_iMapState = 0;
               this.m_iAppearedTime = 0;
               this.m_iChangeCount = 1;
               ms_stAirDisplaySprint.x = a_3491.a_1080;
               ms_stAirDisplaySprint.y = 5;
               m_stLandDisplay.x = 5;
               m_stLandDisplay.y = 5;
               _battleView.addChildAt(m_stLandDisplay,0);
               _battleView.addChildAt(ms_stAirDisplaySprint,0);
               for(i = 0; i < this.arrBron.length; i++)
               {
                  if(i < this.m_gridBitMap.length)
                  {
                     this.m_gridBitMap[i].visible = true;
                  }
                  else
                  {
                     stGridBitmap = new Bitmap();
                     stGridBitmap.bitmapData = ms_stGridBitMapData;
                     stGridBitmap.x = a_3491.a_1080 * this.arrBron[i][1] - 10;
                     stGridBitmap.y = a_3491.a_1081 * this.arrBron[i][0] + 2;
                     m_stLandDisplay.addChildAt(stGridBitmap,0);
                     stGridBitmap.visible = true;
                     this.m_gridBitMap.push(stGridBitmap);
                  }
               }
            }
         }
         m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      private function CreateFans(iNoX:int, iNoY:int) : void
      {
         var stSkyAirShipFansEffect:FansEffect = null;
         var grid:a_3491 = _battleView.a_3438(iNoX,iNoY);
         this.m_arrFieldGridExistFans.push(grid);
         grid.m_iFieldGridType = 3;
         stSkyAirShipFansEffect = FansEffect.a_3926();
         stSkyAirShipFansEffect.a_1797(false);
         stSkyAirShipFansEffect.x = a_3491.a_1080 * iNoX - 8;
         stSkyAirShipFansEffect.y = a_3491.a_1081 * iNoY + 4;
         _battleView.addChildAt(stSkyAirShipFansEffect,1);
         this.m_arrSkyAirShipFansEffect.push(stSkyAirShipFansEffect);
         _battleView.m_arrEffectArray.push(stSkyAirShipFansEffect);
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var i:int = 0;
         if(stData is Array && stData[0] == 2)
         {
            if(_battleView.contains(ms_stAirDisplaySprint))
            {
               _battleView.removeChild(ms_stAirDisplaySprint);
            }
            if(_battleView.contains(m_stLandDisplay))
            {
               _battleView.removeChild(m_stLandDisplay);
            }
            for(i = 0; i < this.m_gridBitMap.length; i++)
            {
               this.m_gridBitMap[i].visible = false;
            }
         }
         return true;
      }
      
      override public function OnWaveStatusData(iWaveStatus:int) : void
      {
         if(iWaveStatus == 2 && this.m_iWaveStatus != 2)
         {
            this.m_iWaveStatus = iWaveStatus;
         }
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stSkyAirShipFansEffect:FansEffect = null;
         var stNewAirBitmap:Bitmap = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTempFieldGrid:a_3491 = null;
         var newGrid:a_3491 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         var arr:Array = null;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         for each(stSkyAirShipFansEffect in this.m_arrSkyAirShipFansEffect)
         {
            stSkyAirShipFansEffect.a_4003(iTimeNum);
         }
         if(iTimeNum % 200 == 0)
         {
            arrBaseMoveIntruderVector = _battleView.m_arrBaseMoveIntruderVector;
            for each(stTempFieldGrid in this.m_arrFieldGridExistFans)
            {
               for each(stMoveIntruder in stTempFieldGrid.a_1511.slice())
               {
                  if(stMoveIntruder.iLifeValue <= 1800 && stMoveIntruder.iSpaceState == 0)
                  {
                     stTempFieldGrid.a_3457(stMoveIntruder);
                     stTempFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                     if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                     {
                        arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                     }
                     newGrid = _battleView.a_3438(stTempFieldGrid.m_iXGridNo - 3,stTempFieldGrid.m_iYGridNo);
                     _battleView.a_3459(stMoveIntruder,newGrid,false);
                     stMoveIntruder.x = a_3491.a_1080 * (stTempFieldGrid.m_iXGridNo - 2.5);
                     stMoveIntruder.a_3969(-3000);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(false);
                     _battleView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,newGrid);
                     stAddBloodEffect.x = stMoveIntruder.x;
                     stAddBloodEffect.y = stMoveIntruder.y;
                  }
               }
            }
         }
         var i:int = 0;
         for(i = 0; i < m_ringBallArray.length; i++)
         {
            if(m_ringBallArray[i] != null)
            {
               m_ringBallArray[i].RunTick();
            }
         }
         for(i = 0; i < m_rayArray.length; i++)
         {
            if(m_rayArray[i] != null)
            {
               m_rayArray[i].RunTick();
            }
         }
         --m_iCreateTick;
         if(this.m_iMapState == 0)
         {
            if(m_iCreateTick == 240)
            {
               CreateShadow();
            }
            else if(m_iCreateTick <= 0)
            {
               lBallPath.length = 0;
               if(this.m_iWaveStatus != -1)
               {
                  m_iCreateTick = 10;
                  this.m_iMapState = 1;
               }
               else
               {
                  CreateBall(CreateBestGrid(m_lGrid1));
                  ++m_iCreateCount;
                  m_iCreateTick = 15 * 20;
               }
            }
         }
         else if(this.m_iMapState == 1)
         {
            if(m_iCreateTick == 840)
            {
               CreateShadow3();
            }
            else if(m_iCreateTick <= 0)
            {
               lBallPath.length = 0;
               arr = CreateBestGridArray(this.arrBron);
               CreateBall(arr[0]);
               CreateBall(arr[1]);
               ++m_iCreateCount;
               m_iCreateTick = 45 * 20;
            }
         }
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum - 20;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = a_3491.a_1080 / (6 * 20);
         stNewAirBitmap = null;
         var iNoAirCloudRow:int = -1;
         if(iTimeNum > 120 && iTimeNum % 120 == 1)
         {
            if(iTimeNum % 480 == 1)
            {
               iNoAirCloudRow = int(m_stRandomSeed.nextInt(2));
               if(iNoAirCloudRow == 1)
               {
                  iNoAirCloudRow = 6;
               }
            }
            else
            {
               iNoAirCloudRow = 2 * BattleFieldView.a_1012;
            }
         }
         for(var iYIndex:int = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            if(!(iYIndex >= 1 && iYIndex <= 5))
            {
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 1; iXIndex++)
               {
                  stAirBitmap = ms_arrAirBitmaps[iYIndex][iXIndex];
                  if(stAirBitmap)
                  {
                     stAirBitmap.x -= numAirMoveSpreed;
                     if(iNoAirCloudRow >= 0 && stAirBitmap.x < -0.5 * a_3491.a_1080 && ms_stAirDisplaySprint.contains(stAirBitmap))
                     {
                        ms_stAirDisplaySprint.removeChild(stAirBitmap);
                     }
                     if(!stAirBitmap.visible)
                     {
                        if(this.HasTool(iXIndex,iYIndex) || this.HasTool(1 + iXIndex,iYIndex) || this.HasTool(1 + iXIndex,1 + iYIndex) || this.HasTool(iXIndex,1 + iYIndex))
                        {
                           ms_arrAirBitmaps[iYIndex][iXIndex].visible = true;
                        }
                        else if(iTimeNum % 120 > 0 && iTimeNum % 120 < 100)
                        {
                           this.a_3502(_battleView.stFieldGridsVector[iYIndex][1 + iXIndex]);
                        }
                     }
                  }
                  if(iNoAirCloudRow >= 0)
                  {
                     isChanged = true;
                     if(iXIndex == BattleFieldView.a_1011 - 2)
                     {
                        stNewAirBitmap = null;
                        stNewAirBitmap = new Bitmap();
                        if(this.m_iChangeCount % 2 == 0)
                        {
                           stNewAirBitmap.bitmapData = ms_stNightHighAirBitmapData;
                           stNewAirBitmap.x = a_3491.a_1080 * iXIndex - numAirMoveSpreed;
                           stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                           ms_stAirDisplaySprint.addChild(stNewAirBitmap);
                        }
                        else
                        {
                           stNewAirBitmap.bitmapData = ms_stNightLowAirBitmapData;
                           stNewAirBitmap.x = a_3491.a_1080 * iXIndex - numAirMoveSpreed;
                           stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                           ms_stAirDisplaySprint.addChildAt(stNewAirBitmap,0);
                        }
                        if(iNoAirCloudRow == iYIndex)
                        {
                           stNewAirBitmap.visible = false;
                        }
                        ms_arrAirBitmaps[iYIndex][iXIndex] = stNewAirBitmap;
                     }
                     else
                     {
                        ms_arrAirBitmaps[iYIndex][iXIndex] = ms_arrAirBitmaps[iYIndex][iXIndex + 1];
                     }
                  }
               }
            }
         }
         if(isChanged)
         {
            ++this.m_iChangeCount;
         }
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            if(!(iYIndex >= 1 && iYIndex <= 5))
            {
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
               {
                  if((_battleView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense)
                  {
                     (_battleView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense.a_3940();
                  }
               }
            }
         }
      }
      
      private function HasTool(iNoX:int, iNoY:int) : Boolean
      {
         if(iNoY >= BattleFieldView.a_1012)
         {
            return false;
         }
         if(iNoX >= BattleFieldView.a_1011)
         {
            return false;
         }
         return (_battleView.stFieldGridsVector[iNoY][iNoX] as a_3491).m_stBaseToolDefense != null;
      }
      
      override public function AbsorbBall(index:int, rayIndex:int) : Boolean
      {
         var ball:PhotosphereEffect = null;
         var grid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         ball = m_ringBallArray[index];
         if(ball != null)
         {
            grid = ball.m_targetGrid;
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389131);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389131;
            }
            else
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389132);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389132;
            }
            stBaseMoveIntruder.a_1797((1 << 16) + grid.m_iYGridNo,-1);
            stBaseMoveIntruder.x = grid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = grid.m_iYGridNo * a_3491.a_1081;
            _battleView.a_3459(stBaseMoveIntruder,grid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
            stBaseMoveIntruder.SpecialSkillCallBack();
            ball.ReleaseBall();
            m_ringBallArray[index] = null;
            return true;
         }
         return false;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         var iNoX:int = stFieldGrid.m_iXGridNo;
         var iNoY:int = stFieldGrid.m_iYGridNo;
         for(var i:int = 0; i < this.arrBron.length; i++)
         {
            if(iNoX == this.arrBron[i][1] && iNoY == this.arrBron[i][0])
            {
               return true;
            }
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

