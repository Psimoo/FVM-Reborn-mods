package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class HoneyJellyFactoryGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var mouseCreateArray:Array = [];
      
      private var m_lFans1:Array = new Array([3,2,null,4,0,0,300],[3,3,null,4,0,0,300],[3,4,null,4,0,0,300],[6,0,null,4,1,0,300],[6,1,null,4,1,0,300],[6,5,null,4,1,0,300],[6,6,null,4,1,0,300]);
      
      private var m_lFans2:Array = new Array([2,2,null,4,0,0,250],[2,3,null,4,0,0,250],[2,4,null,4,0,0,250],[4,0,null,4,1,0,250],[4,6,null,4,1,0,250],[8,0,null,4,1,0,250],[8,6,null,4,1,0,250]);
      
      private var m_lFans3:Array = new Array([4,0,null,5,0,150,300],[4,1,null,5,0,150,300],[3,2,null,5,0,150,300],[3,3,null,5,0,150,300],[3,4,null,5,0,150,300],[4,5,null,5,0,150,300],[4,6,null,5,0,150,300],[8,0,null,5,1,299,300],[8,1,null,5,1,299,300],[7,2,null,5,1,299,300],[7,3,null,5,1,299,300],[7,4,null,5,1,299,300],[8,5,null,5,1,299,300],[8,6,null,5,1,299,300]);
      
      private var m_lMachine2:Array = new Array([7,6,null],[6,0,null]);
      
      private var m_lMachine3:Array = new Array([3,6,null],[3,0,null],[7,0,null],[7,6,null]);
      
      private var m_lSmoke1:Array = new Array([2,1],[2,3],[2,5],[6,2],[6,4]);
      
      private var m_lSmoke2:Array = new Array([2,2],[2,3],[2,4],[4,0],[4,6],[5,6],[6,0]);
      
      private var m_lSmoke3:Array = new Array([4,0],[4,1],[4,5],[4,6],[1,2],[1,3],[1,4],[2,6],[3,0],[5,6],[6,0]);
      
      public var m_iStep:int;
      
      private var changeStepTick:int = -1;
      
      private var changeStep2Effect:ChangeStepEffect;
      
      public function HoneyJellyFactoryGameMap()
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
      
      override public function a_4177() : void
      {
         a_1789.getInstance().removeEventListener("FastFoodStepChange",this.OnStepChange);
         this.DestroyFansByArr(this.m_lFans1);
         this.DestroyFansByArr(this.m_lFans2);
         this.DestroyFansByArr(this.m_lFans3);
         this.DestroyMachineByArr(this.m_lMachine2);
         this.DestroyMachineByArr(this.m_lMachine3);
         if(this.changeStep2Effect != null)
         {
            this.changeStep2Effect.StopAnimation();
         }
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.ChangeStep(1);
               a_1789.getInstance().addEventListener("FastFoodStepChange",this.OnStepChange);
            }
         }
         this.m_iChangeCount = 1;
         this.mouseCreateArray.length = 0;
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      public function GetOneMouseID() : int
      {
         if(this.mouseCreateArray.length == 0)
         {
            this.CreateNewMouseArray();
         }
         var id:int = int(this.mouseCreateArray[0]);
         this.mouseCreateArray.splice(0,1);
         return id;
      }
      
      private function CreateSmokes(arr:Array) : void
      {
         for(var i:int = 0; i < arr.length; i++)
         {
            this.CreateSmokeEffect(arr[i][0],arr[i][1]);
         }
      }
      
      private function CreateSmokeEffect(iNoX:int, iNoY:int) : void
      {
         BattleEffectUtil.CreateGameEffect2(WBLazySmokeEffectMovie,this.m_stCurrentBattleFieldView.a_3438(iNoX,iNoY)).SetAnimation(0,true);
      }
      
      private function CreateMachineByArr(arr:Array) : void
      {
         var i:int = 0;
         var iNoX:int = 0;
         var iNoY:int = 0;
         var grid:a_3491 = null;
         var flySolider:WBFlyWheelMouseMoveIntruder = null;
         for(i = 0; i < arr.length; i++)
         {
            iNoX = int(arr[i][0]);
            iNoY = int(arr[i][1]);
            if(arr[i][2] != null)
            {
               arr[i][2].RealDie();
               arr[i][2] = null;
            }
            grid = this.m_stCurrentBattleFieldView.a_3438(iNoX,iNoY);
            if(grid != null)
            {
               BattleDestroyUtil.ClearOneGrid(grid);
               if(BattleFieldView.a_1055 == 1)
               {
                  if(iNoY < 4)
                  {
                     flySolider = WBFlyWheelDayDownIntruder.a_3926();
                  }
                  else
                  {
                     flySolider = WBFlyWheelDayUpIntruder.a_3926();
                  }
               }
               else if(iNoY < 4)
               {
                  flySolider = WBFlyWheelNightDownIntruder.a_3926();
               }
               else
               {
                  flySolider = WBFlyWheelNightUpIntruder.a_3926();
               }
               if(flySolider)
               {
                  flySolider.a_1797((1 << 16) + iNoY * 10 + iNoX,-1);
                  flySolider.m_stMoveIntruderTypeID = 134235539;
                  grid.m_stCurrentBattbleFieldView.a_3459(flySolider,grid,false,BattleLayerDefine.EFFECTS_BASE_TYPE);
                  flySolider.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
                  flySolider.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
                  arr[i][2] = flySolider;
               }
            }
         }
      }
      
      private function CreateFansByArr(arr:Array) : void
      {
         var grid:a_3491 = null;
         var stEffect:WBBaseFansEffect = null;
         for(var i:int = 0; i < arr.length; i++)
         {
            if(arr[i][2] != null)
            {
               arr[i][2].a_3940();
               arr[i][2] = null;
            }
            grid = this.m_stCurrentBattleFieldView.a_3438(arr[i][0],arr[i][1]);
            BattleDestroyUtil.ClearOneGrid(grid);
            stEffect = BattleEffectUtil.CreateGameEffect(WBBaseFansEffect,WBBaseFansEffectMovie,grid) as WBBaseFansEffect;
            stEffect.InitData(grid,this,arr[i][3],arr[i][4],arr[i][5],arr[i][6]);
            arr[i][2] = stEffect;
         }
      }
      
      private function DestroyMachineByArr(arr:Array) : void
      {
         for(var i:int = 0; i < arr.length; i++)
         {
            if(arr[i][2] != null)
            {
               arr[i][2].RealDie();
               arr[i][2] = null;
            }
         }
      }
      
      private function DestroyFansByArr(arr:Array) : void
      {
         for(var i:int = 0; i < arr.length; i++)
         {
            if(arr[i][2] != null)
            {
               arr[i][2].a_3940();
               arr[i][2] = null;
            }
         }
      }
      
      private function CreateNewMouseArray() : void
      {
         if(this.m_iStep == 1)
         {
            this.CopyArray2Mouse([8389633,8389633,8389634,8389640]);
         }
         else if(this.m_iStep == 2)
         {
            this.CopyArray2Mouse([8389640,8389640,8389648,8389639]);
         }
         else if(this.m_iStep == 3)
         {
            this.CopyArray2Mouse([8389646,8389637,8389642,8389640,0,0,0]);
         }
      }
      
      private function CopyArray2Mouse(arr:Array) : void
      {
         this.mouseCreateArray.length = 0;
         for(var i:int = 0; i < arr.length; i++)
         {
            this.mouseCreateArray.push(arr[i]);
         }
         this.mouseCreateArray = BattleRandomUtil.ShuffleArray(this.mouseCreateArray,this.m_stRandomSeed);
      }
      
      private function OnStepChange(stDataEvent:a_1778) : void
      {
         var step:int = int(stDataEvent.dataObject[0]);
         this.ChangeStep(step);
      }
      
      private function ChangeStep(step:int) : void
      {
         this.m_iStep = step;
         if(step == 1)
         {
            this.mouseCreateArray.length = 0;
            a_4172().copyPixels(a_4172(),a_4172().rect,new Point(0,0));
            a_4172().copyPixels(a_4174(),a_4174().rect,new Point(293,100));
            this.CreateFansByArr(this.m_lFans1);
         }
         else if(step == 2)
         {
            this.mouseCreateArray.length = 0;
            a_4172().copyPixels(this.GetBackGround2Bitmapdata(),this.GetBackGround2Bitmapdata().rect,new Point(0,0));
            a_4172().copyPixels(this.GetSevenLeft2Bitmapdata(),this.GetSevenLeft2Bitmapdata().rect,new Point(293,100));
            this.DestroyFansByArr(this.m_lFans1);
            this.CreateSmokes(this.m_lSmoke1);
            if(this.changeStep2Effect == null)
            {
               this.changeStep2Effect = new ChangeStepEffect();
            }
            this.m_stCurrentBattleFieldView.AddToBattleView(this.changeStep2Effect,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this.changeStep2Effect.x = -387;
            this.changeStep2Effect.y = -105;
            this.changeStep2Effect.PlayAnimation(2,18);
         }
         else if(step == 3)
         {
            this.mouseCreateArray.length = 0;
            BattleFieldView.a_1055 = 0;
            a_4172().copyPixels(this.GetBackGround3Bitmapdata(),this.GetBackGround3Bitmapdata().rect,new Point(0,0));
            a_4172().copyPixels(this.GetSevenLeft3Bitmapdata(),this.GetSevenLeft3Bitmapdata().rect,new Point(293,100));
            this.DestroyFansByArr(this.m_lFans2);
            this.DestroyMachineByArr(this.m_lMachine2);
            this.CreateSmokes(this.m_lSmoke2);
            this.changeStep2Effect.PlayAnimation(20,36);
         }
         this.changeStepTick = this.m_iCurrentTimeIntval;
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
         var gridArray:Array = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         if(this.m_iStep != 1)
         {
            if(this.m_iStep == 2)
            {
               if(iTimeNum - this.changeStepTick == 40)
               {
                  this.CreateSmokes(this.m_lSmoke2);
                  this.CreateFansByArr(this.m_lFans2);
                  this.CreateMachineByArr(this.m_lMachine2);
               }
            }
            else if(this.m_iStep == 3)
            {
               if(iTimeNum - this.changeStepTick == 40)
               {
                  this.CreateSmokes(this.m_lSmoke3);
                  this.CreateFansByArr(this.m_lFans3);
                  this.CreateMachineByArr(this.m_lMachine3);
               }
            }
         }
      }
   }
}

