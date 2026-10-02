package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class LiuxinAncientCitySecondGameMap extends BaseGameMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static var ms_arrAirBitmaps:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_sBrokenFieldEffect:BrokenFieldEffect;
      
      private var m_iBossWave:Boolean;
      
      private var m_m_iBossWaveAppearTime:uint;
      
      private var ms_stAirDisplayFixed:Sprite = new Sprite();
      
      private var m_OutArray:Array = new Array();
      
      private var m_TotalObstaclePos:Array = new Array();
      
      private var m_iWaveStatus:int;
      
      private var m_isBroken:Boolean;
      
      private var AirCloudRowArr:Array = [0,2,3,4,6];
      
      public function LiuxinAncientCitySecondGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function a_4177() : void
      {
         this.removeEffectMovie();
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         var stCurrentBattleFieldView:BattleFieldView = null;
         var enterRoom:Object = null;
         var i:int = 0;
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("DayHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("DayLowAirCloudBitmapData");
         }
         if(null == ms_arrAirBitmaps)
         {
            ms_arrAirBitmaps = [];
            for(iYIndex = 0; iYIndex < 7; iYIndex++)
            {
               if(!(iYIndex == 1 || iYIndex == 5))
               {
                  ms_arrAirBitmaps[iYIndex] = [];
                  for(iXIndex = 0; iXIndex < 9 - 5; iXIndex++)
                  {
                     ms_arrAirBitmaps[iYIndex][iXIndex] = null;
                  }
                  for(iXIndex = 0; iXIndex < 1; iXIndex++)
                  {
                     stAirBitmap = new Bitmap();
                     if(iXIndex % 2 == 0)
                     {
                        stAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                        stAirBitmap.x = (a_3491.a_1080 + 2) * iXIndex;
                        stAirBitmap.y = a_3491.a_1081 * iYIndex;
                        this.ms_stAirDisplayFixed.addChild(stAirBitmap);
                     }
                     else
                     {
                        stAirBitmap.bitmapData = ms_stDayAirLowBitmapData;
                        stAirBitmap.x = (a_3491.a_1080 + 2) * iXIndex;
                        stAirBitmap.y = a_3491.a_1081 * iYIndex;
                        this.ms_stAirDisplayFixed.addChildAt(stAirBitmap,0);
                     }
                     stAirBitmap.visible = true;
                  }
               }
            }
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               while(this.m_OutArray.length > 0)
               {
                  this.m_OutArray.pop();
               }
               this.m_iAppearedTime = 0;
               this.m_m_iBossWaveAppearTime = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.removeEffectMovie();
               this.m_iBossWave = false;
               this.addBrokenFieldEffect();
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  if(!(iYIndex == 1 || iYIndex == 5))
                  {
                     for(i = 3; i < 7; i++)
                     {
                        this.m_OutArray.push([iYIndex,i]);
                     }
                     for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 5; iXIndex++)
                     {
                        stAirBitmap = ms_arrAirBitmaps[iYIndex][iXIndex];
                        if(Boolean(stAirBitmap) && ms_stAirDisplaySprint.contains(stAirBitmap))
                        {
                           ms_stAirDisplaySprint.removeChild(stAirBitmap);
                           stAirBitmap = null;
                        }
                        ms_arrAirBitmaps[iYIndex][iXIndex] = null;
                     }
                  }
               }
               ms_stAirDisplaySprint.x = a_3491.a_1080 * 3 - 20;
               ms_stAirDisplaySprint.y = -12;
               this.m_stCurrentBattleFieldView.addChildAt(ms_stAirDisplaySprint,1);
               this.ms_stAirDisplayFixed.visible = false;
               this.ms_stAirDisplayFixed.x = a_3491.a_1080 * 2 - 20;
               this.ms_stAirDisplayFixed.y = -12;
               this.m_stCurrentBattleFieldView.addChildAt(this.ms_stAirDisplayFixed,0);
               this.m_isBroken = false;
               this.m_iWaveStatus = -1;
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 1 && stData[1] == 1)
         {
         }
         if(stData is Array && stData[0] == 2)
         {
            if(this.m_stCurrentBattleFieldView.contains(ms_stAirDisplaySprint))
            {
               this.m_stCurrentBattleFieldView.removeChild(ms_stAirDisplaySprint);
            }
            if(this.m_stCurrentBattleFieldView.contains(this.ms_stAirDisplayFixed))
            {
               this.m_stCurrentBattleFieldView.removeChild(this.ms_stAirDisplayFixed);
            }
         }
         return true;
      }
      
      override public function OnWaveStatusDataByServer(iWaveStatus:int) : void
      {
         if(iWaveStatus == 0 && this.m_isBroken && this.m_iWaveStatus == 2)
         {
            if(this.m_sBrokenFieldEffect != null && this.m_sBrokenFieldEffect.parent != null)
            {
               this.m_sBrokenFieldEffect.FrameIndex(2);
               this.BrokenField();
            }
         }
         else if(iWaveStatus == 2 && !this.m_isBroken)
         {
            this.m_isBroken = true;
            if(this.m_sBrokenFieldEffect != null)
            {
               this.m_sBrokenFieldEffect.FrameIndex(1);
            }
         }
         this.m_iWaveStatus = iWaveStatus;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = NaN;
         var stNewAirBitmap:Bitmap = null;
         var iNoAirCloudRow:int = 0;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_iCurrentTimeIntval == 10 * 20)
            {
            }
         }
         this.m_iCurrentTimeIntval -= this.m_m_iBossWaveAppearTime;
         if(this.m_iBossWave)
         {
            isChanged = false;
            numAirMoveSpreed = a_3491.a_1080 / (6 * 20);
            stNewAirBitmap = null;
            iNoAirCloudRow = -1;
            if(this.m_iCurrentTimeIntval > 0 && this.m_iCurrentTimeIntval % 120 == 1)
            {
               if(this.m_iCurrentTimeIntval % 600 == 1)
               {
                  iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(this.AirCloudRowArr.length));
               }
               else
               {
                  iNoAirCloudRow = 2 * BattleFieldView.a_1012;
               }
            }
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               if(!(iYIndex == 1 || iYIndex == 5))
               {
                  for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 5; iXIndex++)
                  {
                     stAirBitmap = ms_arrAirBitmaps[iYIndex][iXIndex];
                     if(stAirBitmap)
                     {
                        if(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][3 + iXIndex].m_isClawMark)
                        {
                           this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][3 + iXIndex].m_isClawMark = false;
                        }
                        stAirBitmap.x -= numAirMoveSpreed;
                        if(iNoAirCloudRow >= 0 && stAirBitmap.x < -0.5 * a_3491.a_1080 && ms_stAirDisplaySprint.contains(stAirBitmap))
                        {
                           ms_stAirDisplaySprint.removeChild(stAirBitmap);
                        }
                        if(!stAirBitmap.visible)
                        {
                           if(Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][3 + iXIndex] as a_3491).m_stBaseToolDefense) || Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][2 + iXIndex] as a_3491).m_stBaseToolDefense) || Boolean(iYIndex < BattleFieldView.a_1012 - 1) && (Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][3 + iXIndex] as a_3491).m_stBaseToolDefense || (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][2 + iXIndex] as a_3491).m_stBaseToolDefense)))
                           {
                              ms_arrAirBitmaps[iYIndex][iXIndex].visible = true;
                           }
                           else if(this.m_iCurrentTimeIntval % 120 > 0 && this.m_iCurrentTimeIntval % 120 < 100)
                           {
                              this.a_3502(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][3 + iXIndex]);
                           }
                        }
                     }
                     if(iNoAirCloudRow >= 0)
                     {
                        isChanged = true;
                        if(iXIndex == BattleFieldView.a_1011 - 6)
                        {
                           stNewAirBitmap = null;
                           stNewAirBitmap = new Bitmap();
                           if(this.m_iChangeCount % 2 == 0)
                           {
                              stNewAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                              stNewAirBitmap.x = a_3491.a_1080 * iXIndex - numAirMoveSpreed;
                              stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                              ms_stAirDisplaySprint.addChild(stNewAirBitmap);
                           }
                           else
                           {
                              stNewAirBitmap.bitmapData = ms_stDayAirLowBitmapData;
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
               if(!(iYIndex == 1 || iYIndex == 5))
               {
                  for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 5; iXIndex++)
                  {
                     if((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][3 + iXIndex] as a_3491).m_stBaseToolDefense)
                     {
                        (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][3 + iXIndex] as a_3491).m_stBaseToolDefense.a_3940();
                     }
                  }
               }
            }
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
            if(this.m_TotalObstaclePos[i][0] == iYIndexNum)
            {
               m_iYGridNo = int(this.m_TotalObstaclePos[i][0]);
               m_iXGridNo = int(this.m_TotalObstaclePos[i][1]);
               if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[m_iYGridNo][m_iXGridNo]))
               {
                  arrXFireRange.push([a_3491.a_1080 * (m_iXGridNo + 0),a_3491.a_1080 * (m_iXGridNo + 1)]);
               }
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
      
      private function addBrokenFieldEffect() : void
      {
         var stFieldGrid:a_3491 = null;
         stFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[0][2];
         if(stFieldGrid != null && this.m_sBrokenFieldEffect == null)
         {
            this.m_sBrokenFieldEffect = BrokenFieldEffect.a_3926();
            this.m_sBrokenFieldEffect.stCallBackFunc = null;
            this.m_sBrokenFieldEffect.stEndCallBackFunc = this.addAirBitmap;
            this.m_sBrokenFieldEffect.a_1797(false);
            this.m_sBrokenFieldEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 9;
            this.m_sBrokenFieldEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 2;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_sBrokenFieldEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
         }
      }
      
      private function removeEffectMovie() : void
      {
         if(this.m_sBrokenFieldEffect)
         {
            this.m_sBrokenFieldEffect.a_3940();
            this.m_sBrokenFieldEffect = null;
         }
      }
      
      private function BrokenField() : void
      {
         var stFieldGrid:a_3491 = null;
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            stFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][0]][this.m_OutArray[i][1]];
            if(stFieldGrid != null && !(stFieldGrid.m_stAttackFighter is a_3924))
            {
               this.a_3502(stFieldGrid);
               stFieldGrid.m_isClawMark = true;
            }
         }
      }
      
      private function addAirBitmap() : void
      {
         this.ms_stAirDisplayFixed.visible = true;
         this.m_iBossWave = true;
         this.m_m_iBossWaveAppearTime = this.m_iCurrentTimeIntval;
         this.m_iChangeCount = 1;
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

