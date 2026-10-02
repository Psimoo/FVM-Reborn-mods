package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect.MushroomEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect.RainEffectForFive;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect.RoseMouseMoveIntruder;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class NightSuspendDreamGameMap extends BaseGameMap
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
      
      private var startMushroom:int = 0;
      
      private var m_MushTimes:int;
      
      private var m_isBossSate:Boolean;
      
      private var m_MushroomEffect:Array = [];
      
      private var m_RainEffect:Array = [];
      
      private var m_OutArray:Array = new Array([2,2],[2,3],[4,5],[4,6]);
      
      private var RainIndex:int = -1;
      
      private var RainArray:Array = new Array([[4,2],[2,6]],[[2,2],[4,6]]);
      
      private var m_TargetFieldGrid:a_3491;
      
      private var RainBornIndex:int = 0;
      
      private var randomField:Array = new Array();
      
      private var m_ThreeFixedOrderPos:Array = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[0,0]];
      
      private var m_FiveFixedOrderPos:Array = [[-2,-2],[-2,-1],[-2,0],[-2,1],[-2,2],[-1,2],[0,2],[1,2],[2,2],[2,1],[2,0],[2,-1],[2,-2],[1,-2],[0,-2],[-1,-2],[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,1],[0,0]];
      
      public function NightSuspendDreamGameMap()
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
         }
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            if(!(iYIndex >= 1 && iYIndex <= 5))
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
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               ms_stAirDisplaySprint.x = a_3491.a_1080 * 2;
               ms_stAirDisplaySprint.y = 5;
               this.m_stCurrentBattleFieldView.addChildAt(ms_stAirDisplaySprint,0);
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][5].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
               this.m_iAppearedTime = 0;
               this.startMushroom = 0;
               this.m_MushTimes = 0;
               this.RainBornIndex = -1;
               this.m_isBossSate = false;
               info = CrossServerHandler.Get().m_sitdownInfo;
               this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
               this.removeEffectMovie();
               this.m_iChangeCount = 1;
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var stEffect:a_4108 = null;
         if(stData is Array && stData[0] == 1 && stData[1] == 0)
         {
            this.m_isBossSate = true;
            for each(stEffect in this.m_MushroomEffect)
            {
               if(stEffect)
               {
                  stEffect.a_3940();
               }
            }
         }
         else if(stData is Array && stData[0] == 2)
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
         var effect:RainEffectForFive = null;
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
                  if((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense)
                  {
                     (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense.a_3940();
                  }
               }
            }
         }
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_isBossSate)
            {
               if(this.m_iCurrentTimeIntval % (10 * 20) == 0)
               {
                  this.addRoseMouse();
               }
            }
            else if(this.m_iCurrentTimeIntval % (50 * 20) == 0)
            {
               this.addRainEffect();
               this.startMushroom = this.m_iCurrentTimeIntval;
               this.m_MushTimes = 0;
            }
            else if(this.startMushroom != 0 && (this.m_iCurrentTimeIntval - this.startMushroom) % (10 * 20) == 0)
            {
               this.randomFieldGrid();
               this.addMouseHole();
            }
         }
         for each(effect in this.m_RainEffect)
         {
            effect.a_4003(iTimeNum);
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
      
      private function addRoseMouse() : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            m_iXGridNo = int(this.m_OutArray[i][1]);
            m_iYGridNo = int(this.m_OutArray[i][0]);
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null)
            {
               stBaseMoveIntruder = RoseMouseMoveIntruder.a_3926();
               if(stBaseMoveIntruder)
               {
                  stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
                  stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                  stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 6;
                  stBaseMoveIntruder.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 6;
                  stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false);
               }
            }
         }
         return true;
      }
      
      private function addRainEffect() : void
      {
         var stEffect:RainEffectForFive = null;
         ++this.RainBornIndex;
         if(this.RainBornIndex >= this.RainArray.length)
         {
            this.RainBornIndex = 0;
         }
         for(var i:int = 0; i < 2; i++)
         {
            this.m_TargetFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.RainArray[this.RainBornIndex][i][0]][this.RainArray[this.RainBornIndex][i][1]];
            if(this.m_TargetFieldGrid)
            {
               stEffect = RainEffectForFive.a_3926();
               stEffect.WaitTime = 30;
               stEffect.m_TargetFieldGrid = this.m_TargetFieldGrid;
               stEffect.stCallBackFunc = this.ClearEffect;
               stEffect.a_1797(false);
               stEffect.x = this.m_TargetFieldGrid.m_iXGridNo * a_3491.a_1080;
               stEffect.y = this.m_TargetFieldGrid.m_iYGridNo * a_3491.a_1081;
               this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.m_TargetFieldGrid);
               this.m_RainEffect.push(stEffect);
            }
         }
      }
      
      private function ClearEffect(effect:a_4108) : void
      {
         if(-1 != this.m_RainEffect.indexOf(effect))
         {
            this.m_RainEffect.splice(this.m_RainEffect.indexOf(effect),1);
         }
         this.startMushroom = 0;
      }
      
      private function addMouseHole() : void
      {
         var stFieldGrid:a_3491 = null;
         var stEffect:MushroomEffect = null;
         while(this.randomField.length > 0)
         {
            stFieldGrid = this.randomField.pop();
            if(stFieldGrid != null && !(stFieldGrid.m_stAttackFighter is a_3924) && !this.IsExistPokerShield(stFieldGrid) && stFieldGrid.m_iFieldGridType == 0)
            {
               if(stFieldGrid.m_stMouseEarthHole)
               {
                  stFieldGrid.m_stMouseEarthHole.a_3940();
                  stFieldGrid.m_stMouseEarthHole = null;
               }
               stEffect = MushroomEffect.a_3926();
               stEffect.m_stCurrentFieldGrid = stFieldGrid;
               stEffect.a_1797(false);
               stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
               stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 4;
               this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
               stEffect.play();
               this.m_MushroomEffect.push(stEffect);
            }
         }
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         ++this.m_MushTimes;
         if(this.m_MushTimes > 4)
         {
            return;
         }
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         iLoopCnt = 0;
         iCnt = 0;
         while(iLoopCnt < this.m_FiveFixedOrderPos.length && iCnt < 3)
         {
            m_iXGridNo = this.RainArray[this.RainBornIndex][0][1] + this.m_FiveFixedOrderPos[iLoopCnt][0];
            m_iYGridNo = this.RainArray[this.RainBornIndex][0][0] + this.m_FiveFixedOrderPos[iLoopCnt][1];
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && !(stTargetFieldGrid.m_stAttackFighter is a_3924) && !this.IsExistPokerShield(stTargetFieldGrid) && stTargetFieldGrid.m_iFieldGridType == 0)
            {
               this.randomField.push(stTargetFieldGrid);
               iCnt++;
            }
            iLoopCnt++;
         }
         iLoopCnt = 0;
         iCnt = 0;
         while(iLoopCnt < this.m_FiveFixedOrderPos.length && iCnt < 3)
         {
            m_iXGridNo = this.RainArray[this.RainBornIndex][1][1] + this.m_FiveFixedOrderPos[iLoopCnt][0];
            m_iYGridNo = this.RainArray[this.RainBornIndex][1][0] + this.m_FiveFixedOrderPos[iLoopCnt][1];
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && !(stTargetFieldGrid.m_stAttackFighter is a_3924) && !this.IsExistPokerShield(stTargetFieldGrid) && stTargetFieldGrid.m_iFieldGridType == 0)
            {
               this.randomField.push(stTargetFieldGrid);
               iCnt++;
            }
            iLoopCnt++;
         }
      }
      
      private function IsExistPokerShield(st:a_3491) : Boolean
      {
         if(st != null && st.m_stProtector != null && (st.m_stProtector.a_3512() == 287637520 || st.m_stProtector.a_3512() == 287637534 || st.m_stProtector.a_3512() == 287637535))
         {
            return true;
         }
         return false;
      }
      
      private function CanAddMouseEarthHole(a_1334:a_3491) : Boolean
      {
         var xIndex:int = 0;
         var stFieldGridi:a_3491 = null;
         if(a_1334 == null)
         {
            return false;
         }
         var yStart:int = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
         var xStart:int = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
         var yEnd:int = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
         var xEnd:int = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
         loop0:
         for(var yIndex:int = yStart; yIndex <= yEnd; )
         {
            xIndex = xStart;
            while(true)
            {
               if(xIndex > xEnd)
               {
                  yIndex++;
                  continue loop0;
               }
               stFieldGridi = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
               if(stFieldGridi != null)
               {
                  if(stFieldGridi.m_iFieldGridType == 0 && !(stFieldGridi.m_stAttackFighter is a_3924))
                  {
                     if(!this.IsExistPokerShield(stFieldGridi))
                     {
                        break;
                     }
                  }
               }
               xIndex++;
            }
            return true;
         }
         return false;
      }
      
      private function removeEffectMovie() : void
      {
         var stEffect:a_4108 = null;
         for each(stEffect in this.m_RainEffect)
         {
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
         for each(stEffect in this.m_MushroomEffect)
         {
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
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

