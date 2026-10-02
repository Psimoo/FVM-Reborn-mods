package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class NightAirCloundGameMap extends BaseGameMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static var ms_arrAirBitmaps:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightAirCloundGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         ms_stAirDisplaySprint.y = 15;
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
               ms_arrAirBitmaps[iYIndex] = [];
               for(iXIndex = 0; iXIndex < 9 - 2; iXIndex++)
               {
                  stAirBitmap = new Bitmap();
                  if(iXIndex % 2 == 0)
                  {
                     stAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                     stAirBitmap.x = a_3491.a_1080 * iXIndex;
                     stAirBitmap.y = a_3491.a_1081 * iYIndex;
                     ms_stAirDisplaySprint.addChild(stAirBitmap);
                  }
                  else
                  {
                     stAirBitmap.bitmapData = ms_stDayAirLowBitmapData;
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
                  stAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                  stAirBitmap.x = a_3491.a_1080 * iXIndex;
                  stAirBitmap.y = a_3491.a_1081 * iYIndex;
                  ms_stAirDisplaySprint.addChild(stAirBitmap);
               }
               else
               {
                  stAirBitmap.bitmapData = ms_stDayAirLowBitmapData;
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
               }
               else if(Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][2 + iXIndex] as a_3491).m_stBaseToolDefense) || Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][1 + iXIndex] as a_3491).m_stBaseToolDefense) || Boolean(iYIndex < BattleFieldView.a_1012 - 1) && (Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][2 + iXIndex] as a_3491).m_stBaseToolDefense || (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][1 + iXIndex] as a_3491).m_stBaseToolDefense)))
               {
                  stNewAirBitmap = null;
                  if(iYIndex != iNoAirCloudRow)
                  {
                     stNewAirBitmap = new Bitmap();
                     if(this.m_iChangeCount % 2 == 0)
                     {
                        stNewAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                        stNewAirBitmap.x = a_3491.a_1080 * iXIndex - a_3491.a_1080 * (iTimeNum % 120) / 120;
                        stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                        ms_stAirDisplaySprint.addChild(stNewAirBitmap);
                     }
                     else
                     {
                        stNewAirBitmap.bitmapData = ms_stDayAirLowBitmapData;
                        stNewAirBitmap.x = a_3491.a_1080 * iXIndex - a_3491.a_1080 * (iTimeNum % 120) / 120;
                        stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                        ms_stAirDisplaySprint.addChildAt(stNewAirBitmap,0);
                     }
                  }
                  ms_arrAirBitmaps[iYIndex][iXIndex] = stNewAirBitmap;
               }
               else if(iTimeNum % 120 > 0 && iTimeNum % 120 < 100)
               {
                  this.a_3502(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][2 + iXIndex]);
               }
               if(iNoAirCloudRow >= 0)
               {
                  isChanged = true;
                  if(iXIndex == BattleFieldView.a_1011 - 3)
                  {
                     stNewAirBitmap = null;
                     if(iYIndex != iNoAirCloudRow)
                     {
                        stNewAirBitmap = new Bitmap();
                        if(this.m_iChangeCount % 2 == 0)
                        {
                           stNewAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                           stNewAirBitmap.x = a_3491.a_1080 * iXIndex;
                           stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                           ms_stAirDisplaySprint.addChild(stNewAirBitmap);
                        }
                        else
                        {
                           stNewAirBitmap.bitmapData = ms_stDayAirLowBitmapData;
                           stNewAirBitmap.x = a_3491.a_1080 * iXIndex;
                           stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                           ms_stAirDisplaySprint.addChildAt(stNewAirBitmap,0);
                        }
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

