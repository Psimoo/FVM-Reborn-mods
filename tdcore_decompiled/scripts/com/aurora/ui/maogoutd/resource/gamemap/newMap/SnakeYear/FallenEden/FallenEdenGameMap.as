package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.VolcanicFireEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class FallenEdenGameMap extends BaseGameMap
   {
      
      private static var ms_arrVolcanicFireEffects:Array;
      
      private static var ms_arrAirBitmaps:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private static var ms_stAirDisplaySprint:Sprite = new Sprite();
      
      private static var m_stLandDisplay:Sprite = new Sprite();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_iAppearedTime:int;
      
      private var m_barrierBitMap:Array = new Array();
      
      private var m_barrierEffectList:Array = new Array();
      
      private var step2Barrier:Array = [[5,0],[5,1],[3,3],[6,5]];
      
      private var step3Barrier:Array = [[5,0],[5,1],[2,2],[3,3],[6,5],[7,6]];
      
      private var changeStep2Effect:FallenEdenChangeStep2Effect;
      
      private var changeStep3Effect:FallenEdenChangeStep3Effect;
      
      private var _battleView:BattleFieldView;
      
      private var m_iStep:int;
      
      private var change2Step3Tick:int = -1;
      
      private var step2Water:Array = [[8,0],[7,1],[8,1],[7,2],[8,2],[4,3],[5,3],[7,3],[8,3],[2,4],[3,4],[4,4],[5,4],[2,5],[4,5],[5,5],[2,6],[3,6],[4,6],[5,6]];
      
      private var step3Fire:Array = [[8,0],[7,1],[8,1],[7,2],[8,2],[4,3],[5,3],[7,3],[8,3],[2,4],[3,4],[4,4],[5,4],[2,5],[4,5],[5,5],[2,6],[3,6],[4,6],[5,6]];
      
      private var step1BuffApples:Array = [[1,1],[2,1],[1,3],[2,3],[1,5],[1,5]];
      
      private var step2BuffApples:Array = [[1,1],[2,1],[1,3],[2,3],[1,5],[1,5]];
      
      private var step3BuffApples:Array = [[3,0],[4,0],[3,6],[4,6]];
      
      private var craeteTick:int = 0;
      
      public function FallenEdenGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      public function GetBackGround2Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("BattleFieldBackgroud2BitmapData");
      }
      
      public function GetBackGround3Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("BattleFieldBackgroud3BitmapData");
      }
      
      public function GetSevenLeft2Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("SevenLeft2BattleFiledBitmapData");
      }
      
      public function GetSevenLeft3Bitmapdata() : BitmapData
      {
         return GetBitMapByClone("SevenLeft3BattleFiledBitmapData");
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      protected function HasAvatar(stFieldGrid:*) : Boolean
      {
         if(null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter is a_3924)
         {
            return true;
         }
         return false;
      }
      
      override public function a_4177() : void
      {
         if(this.changeStep2Effect != null)
         {
            this.changeStep2Effect.StopAnimation();
         }
         if(this.changeStep3Effect != null)
         {
            this.changeStep3Effect.StopAnimation();
         }
         this.ClearAllFire();
         a_1789.getInstance().removeEventListener("FastFoodStepChange",this.OnStepChange);
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         var i:int = 0;
         var j:int = 0;
         var bitmap:Bitmap = null;
         var stCurrentBattleFieldView:BattleFieldView = null;
         iYIndex = 0;
         if(null == ms_arrVolcanicFireEffects)
         {
            ms_arrVolcanicFireEffects = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrVolcanicFireEffects[iYIndex] = [];
            }
         }
         iYIndex = 0;
         iXIndex = 0;
         var startIndex:int = 0;
         this.m_barrierEffectList.length = 0;
         if(ms_arrAirBitmaps != null)
         {
            for(i = 0; i < ms_arrAirBitmaps.length; i++)
            {
               for(j = 0; j < ms_arrAirBitmaps[i].length; j++)
               {
                  bitmap = ms_arrAirBitmaps[i][j];
                  if(bitmap != null)
                  {
                     if(bitmap.parent)
                     {
                        bitmap.parent.removeChild(bitmap);
                     }
                     if(bitmap.bitmapData)
                     {
                        bitmap.bitmapData = null;
                     }
                  }
               }
            }
         }
         this.craeteTick = 0;
         ms_arrAirBitmaps = [];
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            startIndex = 0;
            if(iYIndex >= 1 && iYIndex <= 5)
            {
               startIndex = 1;
            }
            ms_arrAirBitmaps[iYIndex] = [];
            for(iXIndex = startIndex; iXIndex < BattleFieldView.a_1011 - 1; iXIndex++)
            {
               stAirBitmap = new Bitmap();
               if(iXIndex % 2 == 0)
               {
                  stAirBitmap.bitmapData = GetBitMap("NightHighAirCloudBitmapData");
                  stAirBitmap.x = a_3491.a_1080 * iXIndex;
                  stAirBitmap.y = a_3491.a_1081 * iYIndex;
                  ms_stAirDisplaySprint.addChild(stAirBitmap);
               }
               else
               {
                  stAirBitmap.bitmapData = GetBitMap("NightLowAirCloudBitmapData");
                  stAirBitmap.x = a_3491.a_1080 * iXIndex;
                  stAirBitmap.y = a_3491.a_1081 * iYIndex;
                  ms_stAirDisplaySprint.addChildAt(stAirBitmap,0);
               }
               stAirBitmap.visible = true;
               ms_arrAirBitmaps[iYIndex][iXIndex] = stAirBitmap;
            }
         }
         super.SetBattleFieldTerrain(stBattleFieldObject);
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this._battleView = stCurrentBattleFieldView;
               this.m_iAppearedTime = 0;
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.ChangeStep(1);
               a_1789.getInstance().addEventListener("FastFoodStepChange",this.OnStepChange);
            }
            ms_stAirDisplaySprint.x = a_3491.a_1080;
            ms_stAirDisplaySprint.y = 5;
            this.m_stCurrentBattleFieldView.addChildAt(ms_stAirDisplaySprint,0);
            m_stLandDisplay.x = 5;
            m_stLandDisplay.y = 5;
            this.m_stCurrentBattleFieldView.addChildAt(m_stLandDisplay,0);
         }
         this.m_iChangeCount = 1;
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      private function ChangeFieldGrids(arr:Array, gridType:int) : void
      {
         for(var i:* = int(arr.length - 1); i >= 0; i--)
         {
            this.ChangeFieldGrid(arr[i][0],arr[i][1],gridType);
         }
      }
      
      private function ChangeFieldGrid(iNoX:int, iNoY:int, gridType:int) : void
      {
         var grid:a_3491 = this._battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         grid.m_iFieldGridType = gridType;
      }
      
      private function OnStepChange(stDataEvent:a_1778) : void
      {
         var step:int = int(stDataEvent.dataObject[0]);
         this.ChangeStep(step);
      }
      
      private function ChangeStep(step:int) : void
      {
         this.m_iStep = step;
         this.craeteTick = 0;
         if(step == 1)
         {
            BattleFieldView.a_1055 = 0;
            a_4172().copyPixels(a_4172(),a_4172().rect,new Point(0,0));
            a_4172().copyPixels(a_4174(),a_4174().rect,new Point(293,100));
         }
         else if(step == 2)
         {
            this.change2Step3Tick = this.m_iCurrentTimeIntval;
            if(this.changeStep2Effect == null)
            {
               this.changeStep2Effect = new FallenEdenChangeStep2Effect();
            }
            this.m_stCurrentBattleFieldView.AddToBattleView(this.changeStep2Effect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            this.changeStep2Effect.x = -387;
            this.changeStep2Effect.y = -105;
            this.changeStep2Effect.gameMap = this;
            this.changeStep2Effect.PlayAnimation();
         }
         else if(step == 3)
         {
            this.change2Step3Tick = this.m_iCurrentTimeIntval;
            if(this.changeStep3Effect == null)
            {
               this.changeStep3Effect = new FallenEdenChangeStep3Effect();
            }
            this.m_stCurrentBattleFieldView.AddToBattleView(this.changeStep3Effect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            this.changeStep3Effect.x = 170;
            this.changeStep3Effect.y = 200;
            this.changeStep3Effect.PlayAnimation();
         }
      }
      
      public function Change2Water(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = this._battleView.stFieldGridsVector[iNoY][iNoX];
         if(grid == null)
         {
            return;
         }
         grid.m_isNeedTray = true;
         this.a_3502(grid);
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var i:int = 0;
         if(stData is Array && stData[0] == 2)
         {
            if(this._battleView.contains(ms_stAirDisplaySprint))
            {
               this._battleView.removeChild(ms_stAirDisplaySprint);
            }
            if(this._battleView.contains(m_stLandDisplay))
            {
               this._battleView.removeChild(m_stLandDisplay);
            }
            for(i = 0; i < this.m_barrierBitMap.length; i++)
            {
               this.m_barrierBitMap[i].visible = false;
            }
            this.m_barrierEffectList.length = 0;
            this.ClearAllFire();
         }
         return true;
      }
      
      private function ClearAllFire() : void
      {
         var iYIndex:int = 0;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         if(ms_arrVolcanicFireEffects)
         {
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               for each(stVolcanicFireEffect in ms_arrVolcanicFireEffects[iYIndex])
               {
                  if(stVolcanicFireEffect)
                  {
                     stVolcanicFireEffect.a_3940();
                  }
               }
               ms_arrVolcanicFireEffects[iYIndex] = [];
            }
         }
      }
      
      public function a_4130() : void
      {
         var i:int = 0;
         if(this.m_stCurrentBattleFieldView.contains(ms_stAirDisplaySprint))
         {
            this.m_stCurrentBattleFieldView.removeChild(ms_stAirDisplaySprint);
            this.ChangeFieldGrids(this.step2Barrier,1);
            if(a_4206.m_iViewBuffId == 320012400)
            {
               this.CreateBuffBarriers(2,this.step2Barrier);
            }
            else
            {
               this.CreateBarriers(GetBitMap("MoveBlockBitmapData_8"),this.step2Barrier);
            }
            for(i = 0; i < this.step2Water.length; i++)
            {
               this.Change2Water(this.step2Water[i][0],this.step2Water[i][1]);
            }
            BattleFieldView.a_1055 = 1;
            a_4172().copyPixels(this.GetBackGround2Bitmapdata(),this.GetBackGround2Bitmapdata().rect,new Point(0,0));
            a_4172().copyPixels(this.GetSevenLeft2Bitmapdata(),this.GetSevenLeft2Bitmapdata().rect,new Point(293,100));
         }
      }
      
      private function CreateBuffBarriers(type:int, arr:Array) : void
      {
         var i:int = 0;
         for(i = 0; i < this.m_barrierEffectList.length; i++)
         {
            this.m_barrierEffectList[i].a_3940();
         }
         this.m_barrierEffectList.length = 0;
         for(i = 0; i < arr.length; i++)
         {
            this.CreateEffectBarrier(type,arr[i][0],arr[i][1]);
         }
      }
      
      private function CreateEffectBarrier(type:int, iNoX:int, iNoY:int) : void
      {
         var a_1334:a_3491 = null;
         var effect:FallenEdenHolyBaseGrailEffect = null;
         a_1334 = this._battleView.a_3438(iNoX,iNoY);
         this.a_3502(a_1334);
         if(type == 2)
         {
            effect = FallenEdenHolyDayGrailEffect.a_3926();
         }
         else
         {
            effect = FallenEdenHolyNightGrailEffect.a_3926();
         }
         effect.stFieldGrid = a_1334;
         effect.a_1797(false);
         effect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
         effect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
         effect.play();
         this.m_barrierEffectList.push(effect);
         this._battleView.m_arrEffectArray.push(effect);
      }
      
      private function CreateBarriers(bitmapData:BitmapData, arr:Array) : void
      {
         this.m_stCurrentBattleFieldView.addChildAt(m_stLandDisplay,0);
         var i:int = 0;
         for(i = 0; i < this.m_barrierBitMap.length; i++)
         {
            m_stLandDisplay.removeChild(this.m_barrierBitMap[i]);
         }
         this.m_barrierBitMap.length = 0;
         for(i = 0; i < arr.length; i++)
         {
            this.CreateBarrier(bitmapData,arr[i][0],arr[i][1]);
         }
      }
      
      private function CreateBarrier(bitmapData:BitmapData, iNoX:int, iNoY:int) : void
      {
         var stGridBitmap:Bitmap = null;
         stGridBitmap = new Bitmap();
         stGridBitmap.bitmapData = bitmapData;
         stGridBitmap.x = a_3491.a_1080 * iNoX - 15;
         stGridBitmap.y = a_3491.a_1081 * iNoY - 14;
         m_stLandDisplay.addChildAt(stGridBitmap,0);
         stGridBitmap.visible = true;
         this.m_barrierBitMap.push(stGridBitmap);
         var grid:a_3491 = this._battleView.a_3438(iNoX,iNoY);
         this.a_3502(grid);
      }
      
      private function BuffCreateUpdate() : void
      {
         var pos1:Array = null;
         var pos2:Array = null;
         var iRIdx1:int = 0;
         ++this.craeteTick;
         if(this.m_iStep == 1)
         {
            if(this.craeteTick != 400)
            {
               return;
            }
            this.craeteTick = 0;
            pos1 = this.step1BuffApples[this.m_stRandomSeed.nextInt(this.step1BuffApples.length)];
            this.CreateShadow(pos1);
         }
         else if(this.m_iStep == 2)
         {
            if(this.craeteTick != 400)
            {
               return;
            }
            this.craeteTick = 0;
            pos2 = this.step2BuffApples[this.m_stRandomSeed.nextInt(this.step2BuffApples.length)];
            this.CreateShadow(pos2);
         }
         else if(this.m_iStep == 3)
         {
            if(this.craeteTick != 200)
            {
               return;
            }
            this.craeteTick = 0;
            iRIdx1 = int(this.m_stRandomSeed.nextInt(this.step3BuffApples.length));
            this.CreateFire(this.step3BuffApples[iRIdx1]);
         }
      }
      
      private function CreateShadow(arr:Array) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var effect:FallenEdenAppleShadowEffect = null;
         stTargetFieldGrid = this._battleView.a_3438(arr[0],arr[1]);
         if(!stTargetFieldGrid)
         {
            return;
         }
         effect = FallenEdenAppleShadowEffect.a_3926();
         effect.stFieldGrid = stTargetFieldGrid;
         effect.a_1797(!stTargetFieldGrid.m_stCurrentBattbleFieldView.m_isOwnBattleField);
         effect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         effect.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stTargetFieldGrid);
         effect.play();
         this._battleView.m_arrEffectArray.push(effect);
      }
      
      private function CreateFire(arr:Array) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var effect:FallenEdenAppleFireEffect = null;
         stTargetFieldGrid = this._battleView.a_3438(arr[0],arr[1]);
         if(!stTargetFieldGrid)
         {
            return;
         }
         effect = FallenEdenAppleFireEffect.a_3926();
         effect.stFieldGrid = stTargetFieldGrid;
         effect.a_1797(!stTargetFieldGrid.m_stCurrentBattbleFieldView.m_isOwnBattleField);
         effect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         effect.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stTargetFieldGrid);
         this._battleView.m_arrEffectArray.push(effect);
         effect.play();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var i:int = 0;
         this.m_iCurrentTimeIntval = iTimeNum;
         if(a_4206.m_iViewBuffId == 320012416)
         {
            this.BuffCreateUpdate();
         }
         if(this.m_iStep == 1)
         {
            this.Step1MapChange(iTimeNum);
         }
         else if(this.m_iStep == 2)
         {
            this.BarrierClearShots(this.step2Barrier);
            if(iTimeNum - this.change2Step3Tick == 25)
            {
               this.a_4130();
            }
         }
         else if(this.m_iStep == 3)
         {
            this.BarrierClearShots(this.step3Barrier);
            if(iTimeNum - this.change2Step3Tick > 42)
            {
               this.Step3MapChange(iTimeNum);
            }
            else if(iTimeNum - this.change2Step3Tick == 36)
            {
               this.ChangeFieldGrids(this.step2Barrier,0);
               this.ChangeFieldGrids(this.step3Barrier,1);
               if(a_4206.m_iViewBuffId == 320012400)
               {
                  this.CreateBuffBarriers(3,this.step3Barrier);
               }
               else
               {
                  this.CreateBarriers(GetBitMap("MoveBlockBitmapData_9"),this.step3Barrier);
               }
               for(i = 0; i < this.step2Water.length; i++)
               {
                  this._battleView.stFieldGridsVector[this.step2Water[i][1]][this.step2Water[i][0]].m_isNeedTray = false;
               }
               this.ClearAllFire();
               BattleFieldView.a_1055 = 0;
               a_4172().copyPixels(this.GetBackGround3Bitmapdata(),this.GetBackGround3Bitmapdata().rect,new Point(0,0));
               a_4172().copyPixels(this.GetSevenLeft3Bitmapdata(),this.GetSevenLeft3Bitmapdata().rect,new Point(293,100));
            }
         }
      }
      
      private function Step3MapChange(iTimeNum:int) : void
      {
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         for(var i:int = 0; i < this.step3Fire.length; i++)
         {
            this.RunGrid(iTimeNum,this.step3Fire[i][0],this.step3Fire[i][1]);
         }
         var iYIndex:int = 0;
         if(iTimeNum % 2 == 0)
         {
            if(ms_arrVolcanicFireEffects)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for each(stVolcanicFireEffect in ms_arrVolcanicFireEffects[iYIndex])
                  {
                     if(stVolcanicFireEffect)
                     {
                        stVolcanicFireEffect.a_4003(null);
                     }
                  }
               }
            }
         }
      }
      
      private function Step1MapChange(iTimeNum:int) : void
      {
         var offsetAdd:int = 0;
         var iXIndex:int = 0;
         var stAirBitmap:Bitmap = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum - 20;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = a_3491.a_1080 / (6 * 20);
         var stNewAirBitmap:Bitmap = null;
         var iNoAirCloudRow:int = -1;
         if(iTimeNum > 120 && iTimeNum % 120 == 1)
         {
            if(iTimeNum % 480 == 1)
            {
               iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(7));
            }
            else
            {
               iNoAirCloudRow = 2 * BattleFieldView.a_1012;
            }
         }
         var iYIndex:int = 0;
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            offsetAdd = 0;
            if(iYIndex >= 1 && iYIndex <= 5)
            {
               offsetAdd = 1;
            }
            for(iXIndex = offsetAdd; iXIndex < BattleFieldView.a_1011 - 1; iXIndex++)
            {
               stAirBitmap = ms_arrAirBitmaps[iYIndex][iXIndex];
               if(stAirBitmap)
               {
                  stAirBitmap.x -= numAirMoveSpreed;
                  if(iNoAirCloudRow >= 0 && ms_stAirDisplaySprint.contains(stAirBitmap))
                  {
                     if(offsetAdd == 0 && stAirBitmap.x < -0.5 * a_3491.a_1080)
                     {
                        ms_stAirDisplaySprint.removeChild(stAirBitmap);
                     }
                     else if(offsetAdd == 1 && stAirBitmap.x < 0.5 * a_3491.a_1080)
                     {
                        ms_stAirDisplaySprint.removeChild(stAirBitmap);
                     }
                  }
                  if(!stAirBitmap.visible)
                  {
                     if(this.HasTool(iXIndex,iYIndex) || this.HasTool(1 + iXIndex,iYIndex) || this.HasTool(1 + iXIndex,1 + iYIndex) || this.HasTool(iXIndex,1 + iYIndex))
                     {
                        ms_arrAirBitmaps[iYIndex][iXIndex].visible = true;
                     }
                     else if(iTimeNum % 120 > 0 && iTimeNum % 120 < 100)
                     {
                        this.a_3502(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][1 + iXIndex]);
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
                     if(this.m_iChangeCount % 2 == 1)
                     {
                        stNewAirBitmap.bitmapData = GetBitMap("NightHighAirCloudBitmapData");
                        stNewAirBitmap.x = a_3491.a_1080 * iXIndex - numAirMoveSpreed;
                        stNewAirBitmap.y = a_3491.a_1081 * iYIndex;
                        ms_stAirDisplaySprint.addChild(stNewAirBitmap);
                     }
                     else
                     {
                        stNewAirBitmap.bitmapData = GetBitMap("NightHighAirCloudBitmapData");
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
         return (this.m_stCurrentBattleFieldView.stFieldGridsVector[iNoY][iNoX] as a_3491).m_stBaseToolDefense != null;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
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
      
      public function RunGrid(iTimeNum:uint, iNoX:int, iNoY:int) : void
      {
         var stBaseShot:a_4348 = null;
         var stFieldGrid:a_3491 = this.m_stCurrentBattleFieldView.stFieldGridsVector[iNoY][iNoX];
         if(iTimeNum % 20 == 0)
         {
            this.BurnFieldGridDefense(stFieldGrid);
         }
         if(iTimeNum % 6)
         {
            this.BurnFieldGridMoveIntruder(stFieldGrid);
            this.AddVolcanicFireEffect(stFieldGrid);
         }
         if(iTimeNum % 2 == 0)
         {
            if(!this.IsExistDefenseForGrid(stFieldGrid))
            {
               for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[iNoY].slice())
               {
                  if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && (stBaseShot.x > a_3491.a_1080 * iNoX && stBaseShot.x < a_3491.a_1080 * (iNoX + 1)))
                  {
                     stBaseShot.a_4350();
                  }
               }
            }
         }
      }
      
      public function BarrierClearShots(arr:Array) : void
      {
         if(a_4206.m_iViewBuffId == 320012400)
         {
            return;
         }
         for(var i:int = 0; i < arr.length; i++)
         {
            this.BarrierClearShot(arr[i][0],arr[i][1]);
         }
      }
      
      public function BarrierClearShot(iNoX:int, iNoY:int) : void
      {
         var stBaseShot:a_4348 = null;
         for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[iNoY].slice())
         {
            if(stBaseShot.x > a_3491.a_1080 * iNoX && stBaseShot.x < a_3491.a_1080 * (iNoX + 1))
            {
               if(stBaseShot.tagCom.HasTag(30))
               {
                  stBaseShot.a_4350();
               }
               else if(!stBaseShot.isParabolaPath && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isShotHighSkySpace)
               {
                  stBaseShot.a_4350();
               }
            }
         }
      }
      
      protected function AddVolcanicFireEffect(stTempFieldGrid:a_3491) : Boolean
      {
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         if(this.IsExistDefenseForGrid(stTempFieldGrid) || stTempFieldGrid.a_1511.length > 0)
         {
            if(null == ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = VolcanicFireEffect.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo;
               stVolcanicFireEffect.y = a_3491.a_1081 * (stTempFieldGrid.m_iYGridNo + 0.7);
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
               ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         return true;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(Boolean(stFieldGrid.m_stBaseToolDefense) || stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(500);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(50);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(50);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(50);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(50);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(50);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,50,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(50);
         }
         return true;
      }
      
      protected function BurnFieldGridMoveIntruder(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
         }
         return true;
      }
   }
}

