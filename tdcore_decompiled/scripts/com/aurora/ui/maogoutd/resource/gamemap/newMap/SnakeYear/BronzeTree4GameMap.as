package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class BronzeTree4GameMap extends BaseGameMap
   {
      
      private static var ms_stNightHighAirBitmapData:BitmapData;
      
      private static var ms_stNightLowAirBitmapData:BitmapData;
      
      private static var ms_arrAirBitmaps:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_iAppearedTime:int;
      
      private var m_OutArray:Array = new Array([2,8],[3,7],[3,8],[4,8]);
      
      private var m_TotalObstaclePos:Array = new Array([0,0],[0,8],[6,0],[6,8]);
      
      public function BronzeTree4GameMap()
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
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         var info:* = undefined;
         if(null == ms_stNightHighAirBitmapData)
         {
            ms_stNightHighAirBitmapData = GetBitMap("NightHighAirCloudBitmapData");
            ms_stNightLowAirBitmapData = GetBitMap("NightLowAirCloudBitmapData");
         }
         if(null == ms_arrAirBitmaps)
         {
            ms_arrAirBitmaps = [];
            for(iYIndex = 0; iYIndex < 7; iYIndex++)
            {
               if(!(iYIndex >= 1 && iYIndex <= 5))
               {
                  ms_arrAirBitmaps[iYIndex] = [];
                  for(iXIndex = 0; iXIndex < 9 - 3; iXIndex++)
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
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 3; iXIndex++)
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
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(i = 0; i < this.m_OutArray.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][0]][this.m_OutArray[i][1]].m_iFieldGridType = 8;
               }
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 4;
               }
               ms_stAirDisplaySprint.x = a_3491.a_1080 * 2;
               ms_stAirDisplaySprint.y = 5;
               this.m_stCurrentBattleFieldView.addChildAt(ms_stAirDisplaySprint,0);
               this.m_iAppearedTime = 0;
               info = CrossServerHandler.Get().m_sitdownInfo;
               this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
               this.m_iChangeCount = 1;
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 2)
         {
            if(this.m_stCurrentBattleFieldView.contains(ms_stAirDisplaySprint))
            {
               this.m_stCurrentBattleFieldView.removeChild(ms_stAirDisplaySprint);
            }
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stNewAirBitmap:Bitmap = null;
         var iNoAirCloudRow:int = 0;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum - 20;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = a_3491.a_1080 / (6 * 20);
         stNewAirBitmap = null;
         iNoAirCloudRow = -1;
         if(iTimeNum > 120 && iTimeNum % 120 == 1)
         {
            if(iTimeNum % 480 == 1)
            {
               iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(2));
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
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            if(!(iYIndex >= 1 && iYIndex <= 5))
            {
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 3; iXIndex++)
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
                        if(Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][2 + iXIndex] as a_3491).m_stBaseToolDefense) || Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][1 + iXIndex] as a_3491).m_stBaseToolDefense) || Boolean(iYIndex < BattleFieldView.a_1012 - 1) && (Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][2 + iXIndex] as a_3491).m_stBaseToolDefense || (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][1 + iXIndex] as a_3491).m_stBaseToolDefense)))
                        {
                           ms_arrAirBitmaps[iYIndex][iXIndex].visible = true;
                        }
                        else if(iTimeNum % 120 > 0 && iTimeNum % 120 < 100)
                        {
                           this.a_3502(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][2 + iXIndex]);
                        }
                     }
                  }
                  if(iNoAirCloudRow >= 0)
                  {
                     isChanged = true;
                     if(iXIndex == BattleFieldView.a_1011 - 4)
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
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 1; iXIndex++)
               {
                  if((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense)
                  {
                     (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense.a_3940();
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
         return [];
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      private function IsExistPokerShield(st:a_3491) : Boolean
      {
         if(st != null && st.m_stProtector != null && (st.m_stProtector.a_3512() == 287637520 || st.m_stProtector.a_3512() == 287637534 || st.m_stProtector.a_3512() == 287637535))
         {
            return true;
         }
         return false;
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

