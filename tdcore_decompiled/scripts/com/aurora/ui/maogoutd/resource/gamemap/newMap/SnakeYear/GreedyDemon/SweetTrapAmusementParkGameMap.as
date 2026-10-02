package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.GreedyDemon
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
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SweetTrapAmusementParkGameMap extends BaseGameMap
   {
      
      private static var ms_arrVolcanicFireEffects:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var isDead:Boolean = false;
      
      private var lamp1:StreetLampMoveIntruder;
      
      private var lamp2:StreetLampMoveIntruder;
      
      private var lamp2_1:StreetLamp2MoveIntruder;
      
      private var lamp2_2:StreetLamp2MoveIntruder;
      
      private var lamp2_3:StreetLamp2MoveIntruder;
      
      private var m_iStep:int;
      
      private var m_stChangeEffect:SweetTrapChangeStepEffect;
      
      private var fire1Array:Array = [[6,0],[7,0],[8,0],[5,1],[6,1],[8,1],[0,2],[1,2],[2,2],[3,2],[4,2],[8,2],[8,3],[8,4],[0,5],[1,5],[2,5],[3,5],[7,5],[8,5],[4,6],[5,6],[6,6],[7,6],[8,6]];
      
      private var fire2Array:Array = [[6,0],[7,0],[8,0],[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[6,1],[8,1],[0,2],[1,2],[2,2],[3,2],[4,2],[8,2],[8,3],[0,4],[1,4],[2,4],[3,4],[4,4],[5,4],[6,4],[8,4],[0,5],[1,5],[2,5],[3,5],[6,5],[7,5],[8,5],[4,6],[5,6],[7,6],[8,6]];
      
      private var fire3Array:Array = [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],[0,2],[1,2],[2,2],[3,2],[4,2],[6,2],[7,2],[8,2],[0,3],[1,3],[2,3],[3,3],[6,3],[7,3],[8,3],[0,4],[1,4],[2,4],[3,4],[4,4],[5,4],[6,4],[7,4],[8,4],[0,5],[1,5],[2,5],[3,5],[6,5],[7,5],[8,5],[4,6],[5,6],[6,6],[7,6]];
      
      public function SweetTrapAmusementParkGameMap()
      {
         var iYIndex:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         if(null == ms_arrVolcanicFireEffects)
         {
            ms_arrVolcanicFireEffects = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrVolcanicFireEffects[iYIndex] = [];
            }
         }
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
      
      public function CreateLamp(index:int, arrGrid:Array, times:int) : void
      {
         var grid1:a_3491 = null;
         var stMoveIntruder:StreetLampMoveIntruder = null;
         if(this.isDead)
         {
            return;
         }
         if(arrGrid == null)
         {
            return;
         }
         var begin:Array = arrGrid[times % arrGrid.length];
         grid1 = this.m_stCurrentBattleFieldView.a_3438(begin[0],begin[1]);
         if(this.HasAvatar(grid1))
         {
            times++;
            this.CreateLamp(index,arrGrid,times);
            return;
         }
         stMoveIntruder = StreetLampMoveIntruder.a_3926();
         stMoveIntruder.a_1797((1 << 16) + begin[1] * 10 + begin[0],-1);
         stMoveIntruder.m_stMoveIntruderTypeID = 134235480;
         this.m_stCurrentBattleFieldView.a_3459(stMoveIntruder,grid1,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         stMoveIntruder.x = grid1.m_iXGridNo * a_3491.a_1080 + 30;
         stMoveIntruder.y = grid1.m_iYGridNo * a_3491.a_1081 + 32;
         stMoveIntruder.InitData(index,arrGrid,times,this);
         if(index == 1)
         {
            this.lamp1 = stMoveIntruder;
         }
         if(index == 2)
         {
            this.lamp2 = stMoveIntruder;
         }
      }
      
      public function CreateLamp2(index:int, begin:Array, times:int) : void
      {
         var grid1:a_3491 = null;
         var stMoveIntruder:StreetLamp2MoveIntruder = null;
         if(this.isDead)
         {
            return;
         }
         if(begin == null)
         {
            return;
         }
         var iNoX:int = begin[0] + times % 5;
         grid1 = this.m_stCurrentBattleFieldView.a_3438(iNoX,begin[1]);
         if(this.HasAvatar(grid1))
         {
            times++;
            this.CreateLamp2(index,begin,times);
            return;
         }
         stMoveIntruder = StreetLamp2MoveIntruder.a_3926();
         stMoveIntruder.a_1797((1 << 16) + begin[1] * 10 + iNoX,-1);
         stMoveIntruder.m_stMoveIntruderTypeID = 134235480;
         this.m_stCurrentBattleFieldView.a_3459(stMoveIntruder,grid1,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         stMoveIntruder.x = grid1.m_iXGridNo * a_3491.a_1080 + 30;
         stMoveIntruder.y = grid1.m_iYGridNo * a_3491.a_1081 + 32;
         stMoveIntruder.InitData(index,begin,times,this);
         if(index == 1)
         {
            this.lamp2_1 = stMoveIntruder;
         }
         if(index == 2)
         {
            this.lamp2_2 = stMoveIntruder;
         }
         if(index == 3)
         {
            this.lamp2_3 = stMoveIntruder;
         }
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
         this.isDead = true;
         this.ClearAllFire();
         a_1789.getInstance().removeEventListener("FastFoodStepChange",this.OnStepChange);
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
               this.isDead = false;
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.ChangeStep(1);
               a_1789.getInstance().addEventListener("FastFoodStepChange",this.OnStepChange);
            }
         }
         this.m_iChangeCount = 1;
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
         var bgBmd:BitmapData = null;
         this.m_iStep = step;
         if(step == 1)
         {
            a_4172().copyPixels(a_4172(),a_4172().rect,new Point(0,0));
            a_4172().copyPixels(a_4174(),a_4174().rect,new Point(293,100));
            if(a_4206.m_iViewBuffId == 320012368)
            {
               this.CreateLamp2(1,[2,3],0);
            }
         }
         else if(step == 2)
         {
            this.ClearAllFire();
            this.m_stChangeEffect = SweetTrapChangeStepEffect.a_3926();
            this.m_stChangeEffect.a_1797(false);
            this.m_stCurrentBattleFieldView.AddToBattleView(this.m_stChangeEffect,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this.m_stChangeEffect.x = -387;
            this.m_stChangeEffect.y = -105;
            this.m_stChangeEffect.Change2One();
            a_4172().copyPixels(this.GetSevenLeft2Bitmapdata(),this.GetSevenLeft2Bitmapdata().rect,new Point(293,100));
            this.ClearAllLamp();
            if(a_4206.m_iViewBuffId == 320012368)
            {
               this.CreateLamp2(1,[2,2],0);
               this.CreateLamp2(2,[2,3],0);
               this.CreateLamp2(3,[2,4],0);
            }
            else
            {
               this.CreateLamp(1,[[0,0],[0,1]],0);
               this.CreateLamp(2,[[0,6],[0,5]],0);
            }
         }
         else if(step == 3)
         {
            this.ClearAllLamp();
            if(a_4206.m_iViewBuffId == 320012368)
            {
               this.CreateLamp2(4,[0,1],0);
               this.CreateLamp2(5,[2,2],0);
               this.CreateLamp2(6,[2,3],0);
               this.CreateLamp2(7,[2,4],0);
               this.CreateLamp2(8,[0,5],0);
            }
            else
            {
               this.CreateLamp(3,[[0,0],[1,0],[2,0],[2,1],[2,2],[1,2],[0,2],[0,1]],0);
               this.CreateLamp(4,[[6,0],[7,0],[8,0],[8,1],[8,2],[7,2],[6,2],[6,1]],2);
               this.CreateLamp(5,[[6,4],[7,4],[8,4],[8,5],[8,6],[7,6],[6,6],[6,5]],4);
               this.CreateLamp(6,[[0,4],[1,4],[2,4],[2,5],[2,6],[1,6],[0,6],[0,5]],6);
            }
            this.ClearAllFire();
            this.m_stChangeEffect.Change2Two();
            BattleFieldView.a_1055 = 0;
            a_4172().copyPixels(this.GetBackGround2Bitmapdata(),this.GetBackGround2Bitmapdata().rect,new Point(0,0));
            a_4172().copyPixels(this.GetSevenLeft3Bitmapdata(),this.GetSevenLeft3Bitmapdata().rect,new Point(293,100));
         }
      }
      
      private function ClearAllLamp() : void
      {
         if(this.lamp1 != null)
         {
            this.lamp1.CallDie();
            this.lamp1 = null;
         }
         if(this.lamp2 != null)
         {
            this.lamp2.CallDie();
            this.lamp2 = null;
         }
         if(this.lamp2_1 != null)
         {
            this.lamp2_1.CallDie();
            this.lamp2_1 = null;
         }
         if(this.lamp2_2 != null)
         {
            this.lamp2_2.CallDie();
            this.lamp2_2 = null;
         }
         if(this.lamp2_3 != null)
         {
            this.lamp2_3.CallDie();
            this.lamp2_3 = null;
         }
      }
      
      private function ReleaseChgEffect() : void
      {
         if(this.m_stChangeEffect != null)
         {
            this.m_stChangeEffect.a_3940();
            this.m_stChangeEffect = null;
         }
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 2)
         {
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
      
      private function CreateBalloon2Effect(iEndNoX:int, iEndNoY:int) : void
      {
         var iNoX:int = 8;
         var iNoY:int = 3;
         var grid1:a_3491 = this.m_stCurrentBattleFieldView.a_3438(iNoX,iNoY);
         var balloon:WBGreedyBalloonMoveIntruder = WBGreedyBalloonMoveIntruder.a_3926();
         balloon.a_1797((1 << 16) + iNoY * 10 + iNoX,-1);
         balloon.m_stMoveIntruderTypeID = 134235459;
         this.m_stCurrentBattleFieldView.a_3459(balloon,grid1,false,BattleLayerDefine.INTRUDER_SKY_TYPE);
         balloon.SetPosition(iNoX,iNoY);
         balloon.InitRandomPos(iEndNoX,iEndNoY,true);
      }
      
      private function CreateBalloonEffect(iBeginNoX:int, iBeginNoY:int, iBegin1NoX:int, iBegin1NoY:int, iEndNoX:int, iEndNoY:int) : void
      {
         var grid1:a_3491 = this.m_stCurrentBattleFieldView.a_3438(iBeginNoX,iBeginNoY);
         var balloon:WBGreedyBalloonMoveIntruder = WBGreedyBalloonMoveIntruder.a_3926();
         balloon.a_1797((1 << 16) + iBeginNoY * 10 + iBeginNoX,-1);
         balloon.m_stMoveIntruderTypeID = 134235459;
         this.m_stCurrentBattleFieldView.a_3459(balloon,grid1,false,BattleLayerDefine.INTRUDER_SKY_TYPE);
         balloon.SetPosition(iBegin1NoX,iBegin1NoY);
         balloon.InitRandomPos(iEndNoX,iEndNoY,false);
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var gridArray:Array = null;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         var iYIndex:int = 0;
         this.m_iCurrentTimeIntval = iTimeNum;
         if(this.m_iStep == 1)
         {
            gridArray = this.fire1Array;
            if(a_4206.m_iViewBuffId == 320012384)
            {
               if(iTimeNum % 600 == 0)
               {
                  this.CreateBalloon2Effect(0,3);
               }
               else if(iTimeNum % 620 == 0)
               {
                  this.CreateBalloon2Effect(2,0);
               }
               else if(iTimeNum % 640 == 0)
               {
                  this.CreateBalloon2Effect(2,6);
               }
               else if(iTimeNum % 660 == 0)
               {
                  this.CreateBalloon2Effect(5,1);
               }
               else if(iTimeNum % 680 == 0)
               {
                  this.CreateBalloon2Effect(5,5);
               }
            }
         }
         else if(this.m_iStep == 2)
         {
            gridArray = this.fire2Array;
         }
         else if(this.m_iStep == 3)
         {
            gridArray = this.fire3Array;
            if(a_4206.m_iViewBuffId == 320012384)
            {
               if(iTimeNum % 100 == 0)
               {
                  this.CreateBalloonEffect(0,0,0,-2,0,8);
                  this.CreateBalloonEffect(2,6,2,8,2,-2);
                  this.CreateBalloonEffect(4,0,4,-2,4,8);
               }
            }
         }
         for(var i:int = 0; i < gridArray.length; i++)
         {
            this.RunGrid(iTimeNum,gridArray[i][0],gridArray[i][1]);
         }
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
         if(stFieldGrid == null)
         {
            return false;
         }
         var damage:int = 50;
         if(this.m_iStep == 1)
         {
            damage = 10;
         }
         if(this.m_iStep == 2)
         {
            damage = 20;
         }
         return stFieldGrid.BurnFieldGridDefenseNormal(damage);
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

