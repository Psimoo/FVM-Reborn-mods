package com.aurora.ui.maogoutd.resource.gamemap.newMap.Pig
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class NightPigSeventhGameThirdMap extends BaseGameMap
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
      
      public function NightPigSeventhGameThirdMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         ms_stAirDisplaySprint.y = 0;
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
               ms_arrAirBitmaps[iYIndex] = [];
               for(iXIndex = 0; iXIndex < 9 - 2; iXIndex++)
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
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 2; iXIndex++)
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
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               ms_stAirDisplaySprint.x = a_3491.a_1080 * 2 - 10;
               this.m_stCurrentBattleFieldView.addChildAt(ms_stAirDisplaySprint,0);
            }
         }
         this.m_iChangeCount = 1;
         this.m_stRandomSeed.setSeed(100,500);
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
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = a_3491.a_1080 / 120;
         stNewAirBitmap = null;
         iNoAirCloudRow = -1;
         if(iTimeNum > 100 && iTimeNum % 120 == 1)
         {
            if(iTimeNum % 600 == 1)
            {
               iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
            }
            else
            {
               iNoAirCloudRow = 2 * BattleFieldView.a_1012;
            }
         }
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            for(iXIndex = 0; iXIndex < BattleFieldView.a_1011 - 2; iXIndex++)
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
                  if(iXIndex == BattleFieldView.a_1011 - 3)
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
                     if(iYIndex == iNoAirCloudRow)
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
         if(isChanged)
         {
            ++this.m_iChangeCount;
         }
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
            {
               if((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense)
               {
                  (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense.a_3940();
               }
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

