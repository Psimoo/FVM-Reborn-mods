package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect.AirBitmapPool;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect.SkyCherryPartyWindEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect.SkyCherryPartyWindTextEffect;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class SkyCherryPartyThirdGameMap extends BaseGameMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static var ms_arrAirBitmaps:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private static const TICKS_PER_SECOND:int = 20;
      
      private static const KITE_SPAWN_INTERVAL:int = 30 * TICKS_PER_SECOND;
      
      private static const KITE_BATCH_SIZE:int = 3;
      
      private static const KITE_SPAWN_DELAY:int = 10;
      
      private static const WIND_FIRST_TRIGGER:int = 50 * TICKS_PER_SECOND;
      
      private static const WIND_REPEAT_INTERVAL:int = 60 * TICKS_PER_SECOND;
      
      private static const WIND_DURATION:int = 20 * TICKS_PER_SECOND;
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_lastAppearCount:int = -1;
      
      private var m_irowCount:int;
      
      private var m_staticAirRow:int = 2;
      
      private var m_kiteBatchCount:int = 0;
      
      private var m_kiteSpawned:int = 0;
      
      private var m_kiteNextSpawnTick:int = -1;
      
      private var m_nexWindTriggerTick:int = -1;
      
      private var m_windEndTick:int = -1;
      
      private var m_isWindActive:Boolean = false;
      
      private var m_iMoveIntruderSequence:int = 1;
      
      private var m_normalMoveOneSpeedTicks:int = 120;
      
      private var m_windMoveOneSpeedTicks:int = 80;
      
      private var m_iMoveOneGrideTicks:int;
      
      private var m_numAirMoveSpreed:Number;
      
      private var m_iAppearEmptyTick:int;
      
      private var m_WindEffect:Array = [];
      
      private var m_EffectOutArray:Array = new Array([0,8],[3,3],[6,8]);
      
      private var m_tempTargetGrids:Array = [];
      
      public function SkyCherryPartyThirdGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      private function ForEachCloud(callback:Function) : void
      {
         var iX:int = 0;
         for(var iY:int = 0; iY < BattleFieldView.a_1012; iY++)
         {
            for(iX = 0; iX < BattleFieldView.a_1011 - this.m_staticAirRow; iX++)
            {
               callback(ms_arrAirBitmaps[iY][iX],iX,iY);
            }
         }
      }
      
      private function CreateAirBitmap(iX:int, iY:int, useHigh:Boolean) : Bitmap
      {
         var bmp:Bitmap = null;
         bmp = AirBitmapPool.Get().GetAirBitmap();
         bmp.bitmapData = useHigh ? ms_stDayAirHighBitmapData : ms_stDayAirLowBitmapData;
         bmp.x = a_3491.a_1080 * iX;
         bmp.y = a_3491.a_1081 * iY;
         if(useHigh)
         {
            ms_stAirDisplaySprint.addChild(bmp);
         }
         else
         {
            ms_stAirDisplaySprint.addChildAt(bmp,0);
         }
         bmp.visible = true;
         return bmp;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var iY:int = 0;
         var iX:int = 0;
         var stCurrentBattleFieldView:BattleFieldView = null;
         var enterRoom:Object = null;
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("DayHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("DayLowAirCloudBitmapData");
         }
         if(null == ms_arrAirBitmaps)
         {
            ms_arrAirBitmaps = [];
            for(iY = 0; iY < 7; iY++)
            {
               ms_arrAirBitmaps[iY] = [];
               for(iX = 0; iX < 9 - this.m_staticAirRow; iX++)
               {
                  ms_arrAirBitmaps[iY][iX] = null;
               }
            }
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stCurrentBattleFieldView;
               this.m_iAppearedTime = 0;
               this.m_lastAppearCount = 0;
               this.m_iAppearEmptyTick = 6;
               this.m_isWindActive = false;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.ForEachCloud(function(stAirBitmap:Bitmap, iX:int, iY:int):void
               {
                  if(Boolean(stAirBitmap) && ms_stAirDisplaySprint.contains(stAirBitmap))
                  {
                     AirBitmapPool.Get().Recycle(stAirBitmap);
                  }
                  ms_arrAirBitmaps[iY][iX] = CreateAirBitmap(iX,iY,iX % 2 == 0);
               });
               this.m_iChangeCount = this.m_iMoveIntruderSequence = 1;
               this.m_irowCount = 7;
               ms_stAirDisplaySprint.x = a_3491.a_1080 * this.m_staticAirRow - 35;
               ms_stAirDisplaySprint.y = 4;
               this.m_stCurrentBattleFieldView.addChildAt(ms_stAirDisplaySprint,1);
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 2)
         {
            this.ForEachCloud(function(stAirBitmap:Bitmap, iX:int, iY:int):void
            {
               if(Boolean(stAirBitmap) && ms_stAirDisplaySprint.contains(stAirBitmap))
               {
                  AirBitmapPool.Get().Recycle(stAirBitmap);
                  ms_arrAirBitmaps[iY][iX] = null;
               }
            });
            if(this.m_stCurrentBattleFieldView.contains(ms_stAirDisplaySprint))
            {
               this.m_stCurrentBattleFieldView.removeChild(ms_stAirDisplaySprint);
            }
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var rows:Array = null;
         var iX:int = 0;
         var stAirBitmap:Bitmap = null;
         var iXIndex:int = 0;
         var field:a_3491 = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
            this.m_iMoveOneGrideTicks = this.m_normalMoveOneSpeedTicks;
            this.m_numAirMoveSpreed = a_3491.a_1080 / this.m_iMoveOneGrideTicks;
            this.m_nexWindTriggerTick = WIND_FIRST_TRIGGER;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval % KITE_SPAWN_INTERVAL == 0)
         {
            this.m_kiteBatchCount = KITE_BATCH_SIZE;
            this.m_kiteSpawned = 0;
            this.m_kiteNextSpawnTick = this.m_iCurrentTimeIntval;
         }
         if(this.m_kiteBatchCount > 0 && this.m_kiteSpawned < this.m_kiteBatchCount)
         {
            if(this.m_iCurrentTimeIntval >= this.m_kiteNextSpawnTick)
            {
               this.SpawnKite();
               ++this.m_kiteSpawned;
               if(this.m_kiteSpawned < this.m_kiteBatchCount)
               {
                  this.m_kiteNextSpawnTick = this.m_iCurrentTimeIntval + KITE_SPAWN_DELAY;
               }
               else
               {
                  this.m_kiteBatchCount = 0;
                  this.m_kiteNextSpawnTick = -1;
               }
            }
         }
         if(!this.m_isWindActive)
         {
            if(this.m_iCurrentTimeIntval >= this.m_nexWindTriggerTick)
            {
               this.m_isWindActive = true;
               this.m_windEndTick = this.m_iCurrentTimeIntval + WIND_DURATION;
               this.m_nexWindTriggerTick = this.m_iCurrentTimeIntval + WIND_REPEAT_INTERVAL;
               this.m_iMoveOneGrideTicks = this.m_windMoveOneSpeedTicks;
               this.m_numAirMoveSpreed = a_3491.a_1080 / this.m_iMoveOneGrideTicks;
               this.m_iAppearEmptyTick = 4;
               this.GenerateWindCloudTips();
            }
         }
         if(this.m_windEndTick > 0)
         {
            if(this.m_iCurrentTimeIntval >= this.m_windEndTick)
            {
               this.m_isWindActive = false;
               this.m_windEndTick = -1;
               this.m_iMoveOneGrideTicks = this.m_normalMoveOneSpeedTicks;
               this.m_numAirMoveSpreed = a_3491.a_1080 / this.m_iMoveOneGrideTicks;
               this.m_iAppearEmptyTick = 6;
            }
         }
         var isChanged:Boolean = false;
         var stNewAirBitmap:Bitmap = null;
         var iNoAirCloudRow:int = -1;
         for(var iY:int = 0; iY < BattleFieldView.a_1012; iY++)
         {
            for(iX = 0; iX < BattleFieldView.a_1011 - this.m_staticAirRow; iX++)
            {
               stAirBitmap = ms_arrAirBitmaps[iY][iX];
               if(stAirBitmap)
               {
                  stAirBitmap.x -= this.m_numAirMoveSpreed;
                  if(stAirBitmap.x < -0.5 * a_3491.a_1080 && ms_stAirDisplaySprint.contains(stAirBitmap))
                  {
                     AirBitmapPool.Get().Recycle(stAirBitmap);
                     if(iY == 0 && iX == 0)
                     {
                        iNoAirCloudRow = 2 * BattleFieldView.a_1012;
                        ++this.m_lastAppearCount;
                        if(this.m_lastAppearCount == this.m_iAppearEmptyTick || this.m_lastAppearCount > this.m_iAppearEmptyTick)
                        {
                           iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
                           if(this.m_isWindActive)
                           {
                              rows = this.GetThreeNonAdjacentRows();
                           }
                           this.m_lastAppearCount = 0;
                        }
                     }
                  }
                  if(!stAirBitmap.visible)
                  {
                     if(this.ShouldShowAirBitmap(iX,iY))
                     {
                        stAirBitmap.visible = true;
                     }
                     else if(this.m_iCurrentTimeIntval % this.m_iMoveOneGrideTicks > 0 && this.m_iCurrentTimeIntval % this.m_iMoveOneGrideTicks < 100)
                     {
                        this.a_3502(this.m_stCurrentBattleFieldView.stFieldGridsVector[iY][this.m_staticAirRow + iX]);
                     }
                  }
               }
               if(iNoAirCloudRow >= 0)
               {
                  isChanged = true;
                  if(iNoAirCloudRow >= 0)
                  {
                     isChanged = true;
                     if(iX == BattleFieldView.a_1011 - this.m_staticAirRow - 1)
                     {
                        this.AppendNewAirBitmap(iX,iY,rows,iNoAirCloudRow);
                     }
                     else
                     {
                        ms_arrAirBitmaps[iY][iX] = ms_arrAirBitmaps[iY][iX + 1];
                     }
                  }
               }
            }
         }
         if(isChanged)
         {
            ++this.m_iChangeCount;
            ++this.m_irowCount;
         }
         for(var iYIndex:int = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
            {
               field = this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex];
               if(field.m_stBaseToolDefense)
               {
                  field.m_stBaseToolDefense.a_3940();
               }
            }
         }
      }
      
      private function AppendNewAirBitmap(iX:int, iY:int, rows:Array, iNoAirCloudRow:int) : void
      {
         var stNewAirBitmap:Bitmap = null;
         var index:int = 0;
         stNewAirBitmap = this.CreateAirBitmap(iX,iY,this.m_irowCount % 2 == 0);
         stNewAirBitmap.x = ms_arrAirBitmaps[iY][iX - 1].x + a_3491.a_1080;
         ms_arrAirBitmaps[iY][iX] = stNewAirBitmap;
         if(this.m_isWindActive)
         {
            if(Boolean(rows) && rows.length > 0)
            {
               index = rows.indexOf(iY);
               if(index != -1)
               {
                  stNewAirBitmap.visible = false;
                  rows.splice(index,1);
               }
            }
         }
         else if(iNoAirCloudRow == iY)
         {
            stNewAirBitmap.visible = false;
         }
      }
      
      private function ShouldShowAirBitmap(iX:int, iY:int) : Boolean
      {
         var grids:Array = this.m_stCurrentBattleFieldView.stFieldGridsVector;
         if(grids[iY][this.m_staticAirRow + iX].m_stBaseToolDefense)
         {
            return true;
         }
         if(grids[iY][this.m_staticAirRow - 1 + iX].m_stBaseToolDefense)
         {
            return true;
         }
         if(iY < BattleFieldView.a_1012 - 1)
         {
            if(grids[iY + 1][this.m_staticAirRow + iX].m_stBaseToolDefense)
            {
               return true;
            }
            if(grids[iY + 1][this.m_staticAirRow - 1 + iX].m_stBaseToolDefense)
            {
               return true;
            }
         }
         return false;
      }
      
      private function SpawnKite() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var iX:int = 0;
         var grid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         this.m_tempTargetGrids.length = 0;
         for(var iY:int = 0; iY < BattleFieldView.a_1012; iY++)
         {
            for(iX = 2; iX < 7; iX++)
            {
               if(iX != 3)
               {
                  grid = this.m_stCurrentBattleFieldView.a_3438(iX,iY);
                  if(grid != null && grid.m_stCrispyKiteMouse == null && grid.m_stCrispyKiteEffect == null)
                  {
                     this.m_tempTargetGrids.push(grid);
                  }
               }
            }
         }
         if(this.m_tempTargetGrids.length > 0)
         {
            stTargetFieldGrid = this.m_tempTargetGrids[this.m_stRandomSeed.nextInt(this.m_tempTargetGrids.length)];
         }
         if(stTargetFieldGrid)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389140);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.SpecialSkillCallBack(stTargetFieldGrid);
               stBaseMoveIntruder.a_1797(this.a_4265(),-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389140;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
            }
         }
      }
      
      protected function a_4265() : int
      {
         return (1 << 15) + this.m_iMoveIntruderSequence++;
      }
      
      private function GenerateWindCloudTips() : void
      {
         var m_TargetFieldGrid:a_3491 = null;
         var stEffect:SkyCherryPartyWindEffect = null;
         var stTextEffect:SkyCherryPartyWindTextEffect = null;
         for(var i:int = 0; i < this.m_EffectOutArray.length; i++)
         {
            m_TargetFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_EffectOutArray[i][0]][this.m_EffectOutArray[i][1]];
            if(m_TargetFieldGrid)
            {
               stEffect = SkyCherryPartyWindEffect.a_3926();
               stEffect.a_1797(false);
               stEffect.x = (m_TargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               stEffect.y = (m_TargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
               this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_TargetFieldGrid);
               this.m_WindEffect.push(stEffect);
            }
         }
         m_TargetFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[0][4];
         if(m_TargetFieldGrid)
         {
            stTextEffect = SkyCherryPartyWindTextEffect.a_3926();
            stTextEffect.stOriginalFieldGrid = m_TargetFieldGrid;
            stTextEffect.a_1797(false);
            stTextEffect.x = (m_TargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stTextEffect.y = (m_TargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.m_stCurrentBattleFieldView.AddToBattleView(stTextEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_TargetFieldGrid);
            this.m_WindEffect.push(stTextEffect);
         }
      }
      
      private function GetThreeNonAdjacentRows() : Array
      {
         var r:int = 0;
         var k:int = 0;
         var tmp:int = 0;
         var ok:Boolean = false;
         var picked:int = 0;
         this.m_tempTargetGrids.length = 0;
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            this.m_tempTargetGrids.push(i);
         }
         for(var j:* = int(this.m_tempTargetGrids.length - 1); j > 0; j--)
         {
            k = int(this.m_stRandomSeed.nextInt(j + 1));
            tmp = int(this.m_tempTargetGrids[j]);
            this.m_tempTargetGrids[j] = this.m_tempTargetGrids[k];
            this.m_tempTargetGrids[k] = tmp;
         }
         var result:Array = [];
         for each(r in this.m_tempTargetGrids)
         {
            ok = true;
            for each(picked in result)
            {
               if(Math.abs(picked - r) <= 1)
               {
                  ok = false;
                  break;
               }
            }
            if(ok)
            {
               result.push(r);
               if(result.length == 2)
               {
                  break;
               }
            }
         }
         return result;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function KillDefense(target:Object) : void
      {
         if(target)
         {
            target.m_iDieType = 1;
            target.a_3969(target.iLifeValue);
         }
      }
      
      private function removeEffectMovie() : void
      {
         var stEffect:a_4108 = null;
         for each(stEffect in this.m_WindEffect)
         {
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
         this.m_WindEffect.length = 0;
      }
   }
}

