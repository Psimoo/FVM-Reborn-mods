package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class NightYueguiTiankongMap extends BaseGameMoveMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static var ms_arrAirBitmaps:Array;
      
      private static const DEEP_INDEX:int = 1;
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private var a_1445:a_4187 = new a_4187();
      
      private var ms_stAirDisplayFixed:Sprite;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightYueguiTiankongMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 0;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var stMoveBlockMap:MoveBlockMap = new MoveBlockMap();
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 0;
         stMoveBlockData.m_iDefultYGridNo = 0;
         stMoveBlockData.m_iHeight = 2;
         stMoveBlockData.m_iWidth = 5;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 4;
         stMoveBlockData.m_iEndYGridNo = 0;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap();
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 1;
         stMoveBlockData.m_iDefultXGridNo = 4;
         stMoveBlockData.m_iDefultYGridNo = 5;
         stMoveBlockData.m_iHeight = 2;
         stMoveBlockData.m_iWidth = 5;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 4;
         stMoveBlockData.m_iEndYGridNo = 0;
         stMoveBlockData.m_iSpeed = 1;
         stMoveBlockData.m_iStartResidenceTime = 150;
         stMoveBlockData.m_iEndResideceTime = 150;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         ReleaseMoveMap();
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("NightHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("NightLowAirCloudBitmapData");
         }
         if(null == ms_arrAirBitmaps)
         {
            this.ms_stAirDisplayFixed = new Sprite();
            ms_stAirDisplaySprint.addChildAt(this.ms_stAirDisplayFixed,0);
            ms_arrAirBitmaps = [];
            for(iYIndex = 2; iYIndex < 7 - 2; iYIndex++)
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
                     ms_stAirDisplaySprint.addChildAt(stAirBitmap,DEEP_INDEX);
                  }
                  stAirBitmap.visible = true;
                  ms_arrAirBitmaps[iYIndex][iXIndex] = stAirBitmap;
               }
               for(iXIndex = 0; iXIndex < 2; iXIndex++)
               {
                  stAirBitmap = new Bitmap();
                  stAirBitmap.bitmapData = ms_stDayAirHighBitmapData;
                  stAirBitmap.x = a_3491.a_1080 * (iXIndex - 2);
                  stAirBitmap.y = a_3491.a_1081 * iYIndex;
                  this.ms_stAirDisplayFixed.addChildAt(stAirBitmap,0);
                  stAirBitmap.visible = true;
               }
            }
         }
         for(iYIndex = 2; iYIndex < BattleFieldView.a_1012 - 2; iYIndex++)
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
                  ms_stAirDisplaySprint.addChildAt(stAirBitmap,DEEP_INDEX);
               }
               stAirBitmap.visible = true;
               ms_arrAirBitmaps[iYIndex][iXIndex] = stAirBitmap;
            }
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][5].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[5][3].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][0].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][1].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
            stCurrentBattleFieldView.stFieldGridsVector[6][3].m_iFieldGridType = 3;
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
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
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         super.OnTimeInterval(iTimeNum);
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = a_3491.a_1080 / 120;
         stNewAirBitmap = null;
         var iNoAirCloudRow:int = -1;
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
         for(iYIndex = 2; iYIndex < BattleFieldView.a_1012 - 2; iYIndex++)
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
                        ms_stAirDisplaySprint.addChildAt(stNewAirBitmap,DEEP_INDEX);
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
                           ms_stAirDisplaySprint.addChildAt(stNewAirBitmap,DEEP_INDEX);
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
         for(iYIndex = 2; iYIndex < BattleFieldView.a_1012 - 2; iYIndex++)
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

