package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.FWA
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3.WBDesireKingP3TPEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3.WBDesireKingP3TPMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ForgetWorriesAgencyGameMap extends BaseGameMap
   {
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_stFWACurtain:WBFWACurtainMovie;
      
      private var m_iStep:int;
      
      private var changeStepTick:int = -1;
      
      private var mouse1Arr:Array = [[4,0],[5,0],[6,0],[7,0],[8,0],[4,1],[7,1],[8,1],[4,2],[5,2],[6,2],[7,2],[8,2],[4,3],[5,3],[6,3],[7,3],[8,3],[4,4],[5,4],[6,4],[7,4],[8,4],[4,5],[7,5],[8,5],[4,6],[5,6],[6,6],[7,6],[8,6]];
      
      private var mouse2Arr:Array = [[2,0],[3,0],[4,0],[2,1],[3,1],[4,1],[4,5],[5,5],[6,5],[4,6],[5,6],[6,6]];
      
      private var mouse3Arr:Array = [[3,0],[4,0],[5,0],[7,0],[8,0],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],[3,2],[4,2],[5,2],[6,2],[8,2],[3,3],[4,3],[5,3],[6,3],[7,3],[8,3],[3,4],[4,4],[5,4],[6,4],[8,4],[3,5],[4,5],[5,5],[6,5],[7,5],[8,5],[3,6],[4,6],[5,6],[7,6],[8,6]];
      
      private var step1Barrier:Array = [[5,1],[6,1],[2,3],[3,3],[5,5],[6,5]];
      
      private var step2Barrier:Array = [[1,0],[1,1],[2,2],[3,2],[4,2],[5,0],[5,1],[4,4],[5,4],[6,4],[3,5],[3,6],[7,5],[7,6]];
      
      private var step3Barrier:Array = [[2,0],[6,0],[1,2],[7,2],[1,4],[7,4],[2,6],[6,6]];
      
      public function ForgetWorriesAgencyGameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
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
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.changeStepTick = -1;
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.ChangeStep(1);
               a_1789.getInstance().addEventListener("FastFoodStepChange",this.OnStepChange);
               a_1789.getInstance().addEventListener("CreateWBMouseHole",this.OnCreateWBMouseHole);
            }
         }
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      private function OnStepChange(stDataEvent:a_1778) : void
      {
         var step:int = int(stDataEvent.dataObject[0]);
         this.ChangeStep(step);
      }
      
      private function ChangeStep(step:int) : void
      {
         var grid:a_3491 = null;
         var i:int = 0;
         this.m_iStep = step;
         if(step == 1)
         {
            this.OnRealChange();
         }
         else if(step == 2)
         {
            if(this.m_stFWACurtain == null)
            {
               this.m_stFWACurtain = new WBFWACurtainMovie();
            }
            this.m_stCurrentBattleFieldView.AddToBattleView(this.m_stFWACurtain,BattleLayerDefine.EFFECTS_TOP_TYPE);
            this.m_stFWACurtain.x = 250;
            this.m_stFWACurtain.y = 215;
            this.m_stFWACurtain.PlayAnimation();
         }
         else if(step == 3)
         {
            this.m_stFWACurtain.PlayAnimation();
         }
         this.changeStepTick = this.m_iCurrentTimeIntval;
      }
      
      public function OnRealChange() : void
      {
         var grid:a_3491 = null;
         var effect:WBDesireKingP3TPEffect = null;
         var i:int = 0;
         if(this.m_iStep == 1)
         {
            BattleFieldView.a_1055 = 1;
            a_4172().copyPixels(a_4172(),a_4172().rect,new Point(0,0));
            a_4172().copyPixels(a_4174(),a_4174().rect,new Point(293,100));
            for(i = 0; i < this.step1Barrier.length; i++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(this.step1Barrier[i][0],this.step1Barrier[i][1]);
               grid.m_iFieldGridType = 1;
            }
         }
         else if(this.m_iStep == 2)
         {
            BattleFieldView.a_1055 = 0;
            a_4172().copyPixels(this.GetBackGround2Bitmapdata(),this.GetBackGround2Bitmapdata().rect,new Point(0,0));
            a_4172().copyPixels(this.GetSevenLeft2Bitmapdata(),this.GetSevenLeft2Bitmapdata().rect,new Point(293,100));
            for(i = 0; i < this.step1Barrier.length; i++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(this.step1Barrier[i][0],this.step1Barrier[i][1]);
               grid.m_iFieldGridType = 0;
            }
            for(i = 0; i < this.step2Barrier.length; i++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(this.step2Barrier[i][0],this.step2Barrier[i][1]);
               grid.m_iFieldGridType = 8;
               this.ClearChangeGrid(grid);
            }
            this.ClearAllMouseEarthHole();
         }
         else if(this.m_iStep == 3)
         {
            BattleFieldView.a_1055 = 0;
            a_4172().copyPixels(this.GetBackGround3Bitmapdata(),this.GetBackGround3Bitmapdata().rect,new Point(0,0));
            a_4172().copyPixels(this.GetSevenLeft3Bitmapdata(),this.GetSevenLeft3Bitmapdata().rect,new Point(293,100));
            for(i = 0; i < this.step2Barrier.length; i++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(this.step2Barrier[i][0],this.step2Barrier[i][1]);
               grid.m_iFieldGridType = 0;
            }
            for(i = 0; i < this.step3Barrier.length; i++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(this.step3Barrier[i][0],this.step3Barrier[i][1]);
               grid.m_iFieldGridType = 1;
               this.ClearChangeGrid(grid);
               effect = BattleEffectUtil.CreateGameEffect(WBDesireKingP3TPEffect,WBDesireKingP3TPMovie,grid) as WBDesireKingP3TPEffect;
               effect.InitData(grid);
            }
            this.ClearAllMouseEarthHole();
         }
      }
      
      private function ClearChangeGrid(grid:a_3491) : void
      {
         BattleDestroyUtil.ClearChangeDefenseGrid(grid,0,3);
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 2)
         {
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         this.m_iCurrentTimeIntval = iTimeNum;
         if(this.m_iStep != 1)
         {
            if(this.m_iStep == 2)
            {
               if(iTimeNum - this.changeStepTick == 20)
               {
                  this.OnRealChange();
               }
            }
            else if(this.m_iStep == 3)
            {
               if(iTimeNum - this.changeStepTick == 20)
               {
                  this.OnRealChange();
               }
               else if(iTimeNum - this.changeStepTick > 20)
               {
                  if(iTimeNum % 5 == 0)
                  {
                     this.ScareAllAttacker();
                  }
               }
            }
         }
      }
      
      private function ScareAllAttacker() : void
      {
         var grid:a_3491 = null;
         var attacker:a_3953 = null;
         var j:int = 0;
         var params:BattleBuffParams = null;
         var buffData:BattleBuffData = null;
         if(this.m_iStep != 3)
         {
            return;
         }
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            for(j = 0; j < BattleFieldView.a_1012; j++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(i,j);
               if(grid != null && grid.m_stAttackFighter != null)
               {
                  attacker = grid.m_stAttackFighter;
                  if(!grid.tagCom.HasTag(20027))
                  {
                     params = new BattleBuffParams();
                     params.gameMoveClipClass = WBFWAScareBuffMovie;
                     params.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081 - 40;
                     params.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
                     params.offsetType = 3;
                     buffData = attacker.buffCom.AddBuff(30033,6,params);
                     if(buffData != null && buffData.stEffect != null)
                     {
                        this.m_stCurrentBattleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,grid);
                     }
                  }
                  else
                  {
                     attacker.buffCom.RemoveBuff(30033);
                  }
               }
            }
         }
      }
      
      private function ClearAllMouseEarthHole() : void
      {
         var grid:a_3491 = null;
         var j:int = 0;
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            for(j = 0; j < BattleFieldView.a_1012; j++)
            {
               grid = this.m_stCurrentBattleFieldView.a_3438(i,j);
               if(grid != null)
               {
                  grid.a_3503();
               }
            }
         }
      }
      
      private function OnCreateWBMouseHole(stDataEvent:a_1778) : void
      {
         this.CreateMouseHoles(stDataEvent.dataObject[0],stDataEvent.dataObject[1]);
      }
      
      private function CreateMouseHoles(byAppearHole:int, byAppearHoleCount:int) : void
      {
         for(var i:int = 0; i < byAppearHoleCount; i++)
         {
            this.a_3463(byAppearHole * (i + 1));
         }
      }
      
      private function GetMouseArray() : Array
      {
         if(this.m_iStep == 1)
         {
            return this.mouse1Arr;
         }
         if(this.m_iStep == 2)
         {
            return this.mouse2Arr;
         }
         return this.mouse3Arr;
      }
      
      public function a_3463(iHoleRadomID:int) : Boolean
      {
         var stTempFieldGrid:a_3491 = null;
         var stMouseEarthHole:a_4135 = null;
         var iTatolFreeGrid:int = this.a_3424();
         if(iTatolFreeGrid <= 0)
         {
            return false;
         }
         stTempFieldGrid = this.a_3428(iHoleRadomID % iTatolFreeGrid);
         if(null == stTempFieldGrid)
         {
            return false;
         }
         stTempFieldGrid.m_isExistMouseHole = true;
         if(this.m_iStep == 1)
         {
            stMouseEarthHole = a_4135.GetFreeInstanceWB1();
         }
         else if(this.m_iStep == 2)
         {
            stMouseEarthHole = a_4135.GetFreeInstanceWB2();
         }
         else
         {
            stMouseEarthHole = a_4135.GetFreeInstanceWB3();
         }
         stMouseEarthHole.a_1797(false);
         stMouseEarthHole.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stMouseEarthHole.width);
         stMouseEarthHole.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stMouseEarthHole.height) + 15;
         this.m_stCurrentBattleFieldView.AddToBattleView(stMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stTempFieldGrid);
         stMouseEarthHole.play();
         stTempFieldGrid.m_stMouseEarthHole = stMouseEarthHole;
         return true;
      }
      
      public function a_3424() : int
      {
         var grid:a_3491 = null;
         var iTotalGridNum:int = 0;
         var arr:Array = this.GetMouseArray();
         for(var i:int = 0; i < arr.length; i++)
         {
            grid = this.m_stCurrentBattleFieldView.a_3438(arr[i][0],arr[i][1]);
            if(!grid.m_isNeedTray && !grid.a_3492() && !grid.m_isExistMouseHole)
            {
               iTotalGridNum++;
            }
         }
         return iTotalGridNum;
      }
      
      public function a_3428(iOrderNum:int) : a_3491
      {
         var grid:a_3491 = null;
         if(iOrderNum < 0 || iOrderNum > this.a_3424() - 1)
         {
            return null;
         }
         var arr:Array = this.GetMouseArray();
         for(var i:int = 0; i < arr.length; i++)
         {
            grid = this.m_stCurrentBattleFieldView.a_3438(arr[i][0],arr[i][1]);
            if(!grid.m_isNeedTray && !grid.a_3492() && !grid.m_isExistMouseHole)
            {
               if(0 == iOrderNum)
               {
                  return grid;
               }
               iOrderNum--;
            }
         }
         return null;
      }
      
      override public function a_4177() : void
      {
         this.ClearAllMouseEarthHole();
         a_1789.getInstance().removeEventListener("FastFoodStepChange",this.OnStepChange);
         a_1789.getInstance().removeEventListener("CreateWBMouseHole",this.OnCreateWBMouseHole);
         if(this.m_stFWACurtain != null)
         {
            this.m_stFWACurtain.StopAnimation();
         }
         super.a_4177();
      }
   }
}

