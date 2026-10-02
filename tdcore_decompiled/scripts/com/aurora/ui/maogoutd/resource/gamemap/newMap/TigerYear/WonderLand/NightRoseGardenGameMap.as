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
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect.RainEffectForThree;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect.RoseMouseMoveIntruder;
   
   public class NightRoseGardenGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_iAppearedTime:int;
      
      private var startMushroom:int = 0;
      
      private var m_MushTimes:int;
      
      private var m_MushroomEffect:Array = [];
      
      private var m_RainEffect:Array = [];
      
      private var m_AddRoseTimes:int;
      
      private var m_OutArray_0:Array = new Array([0,4],[1,4],[2,3],[2,5],[3,4]);
      
      private var m_OutArray_1:Array = new Array([4,0],[5,1],[6,2]);
      
      private var m_OutArray_2:Array = new Array([4,8],[5,7],[6,6]);
      
      private var m_OutArray_3:Array = new Array([0,4],[1,4],[2,3],[2,5],[3,4],[4,0],[5,1],[6,2],[4,8],[5,7],[6,6]);
      
      private var m_roseRadom:Array = new Array();
      
      private var RainIndex:int = -1;
      
      private var RainArray:Array = new Array([[1,1],[5,1],[5,6],[1,6]],[[3,1],[5,4],[3,7],[1,4]]);
      
      private var m_TargetFieldGrid:a_3491;
      
      private var RainBornIndex:int = 0;
      
      private var randomField:Array = new Array();
      
      private var m_ThreeFixedOrderPos:Array = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[0,0]];
      
      private var m_FiveFixedOrderPos:Array = [[-2,-2],[-2,-1],[-2,0],[-2,1],[-2,2],[-1,2],[0,2],[1,2],[2,2],[2,1],[2,0],[2,-1],[2,-2],[1,-2],[0,-2],[-1,-2],[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,1],[0,0]];
      
      public function NightRoseGardenGameMap()
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
         var stCurrentBattleFieldView:BattleFieldView = null;
         var info:* = undefined;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][1].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
               this.m_iAppearedTime = 0;
               this.startMushroom = 0;
               this.m_MushTimes = 0;
               this.m_AddRoseTimes = 0;
               this.RainBornIndex = -1;
               info = CrossServerHandler.Get().m_sitdownInfo;
               this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
               this.removeEffectMovie();
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var effect:RainEffectForThree = null;
         var isChanged:Boolean = false;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_iCurrentTimeIntval % (25 * 20) == 0)
            {
               this.addRoseMouse();
            }
            if(this.m_iCurrentTimeIntval % (60 * 20) == 0)
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
         var index:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var outRose:Array = null;
         var j:int = 0;
         while(this.m_roseRadom.length > 0)
         {
            this.m_roseRadom.pop();
         }
         ++this.m_AddRoseTimes;
         var roseTatalNum:int = 0;
         if(this.m_AddRoseTimes % 8 == 1 || this.m_AddRoseTimes % 8 == 2 || this.m_AddRoseTimes % 8 == 3)
         {
            index = int(this.m_stRandomSeed.nextInt(3));
            index = index >= 3 ? 2 : index;
            outRose = this["m_OutArray_" + index];
         }
         else if(this.m_AddRoseTimes % 8 == 5 || this.m_AddRoseTimes % 8 == 6 || this.m_AddRoseTimes % 8 == 7)
         {
            index = int(this.m_stRandomSeed.nextInt(3));
            index = index >= 3 ? 2 : index;
            outRose = this["m_OutArray_" + index];
         }
         else
         {
            outRose = this["m_OutArray_" + 3];
         }
         if(outRose != null)
         {
            for(j = 0; j < outRose.length; j++)
            {
               m_iXGridNo = int(outRose[j][1]);
               m_iYGridNo = int(outRose[j][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
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
         var stEffect:RainEffectForThree = null;
         ++this.RainBornIndex;
         if(this.RainBornIndex >= this.RainArray.length)
         {
            this.RainBornIndex = 0;
         }
         for(var i:int = 0; i < 4; i++)
         {
            this.m_TargetFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.RainArray[this.RainBornIndex][i][0]][this.RainArray[this.RainBornIndex][i][1]];
            if(this.m_TargetFieldGrid)
            {
               stEffect = RainEffectForThree.a_3926();
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
            if(stFieldGrid != null)
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
         var existPro:Boolean = false;
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         for(var i:int = 0; i < 4; i++)
         {
            iLoopCnt = 0;
            iCnt = 0;
            while(iLoopCnt < this.m_ThreeFixedOrderPos.length && iCnt < 1)
            {
               m_iXGridNo = this.RainArray[this.RainBornIndex][i][1] + this.m_ThreeFixedOrderPos[iLoopCnt][0];
               m_iYGridNo = this.RainArray[this.RainBornIndex][i][0] + this.m_ThreeFixedOrderPos[iLoopCnt][1];
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid != null && !(stTargetFieldGrid.m_stAttackFighter is a_3924) && !this.IsExistPokerShield(stTargetFieldGrid) && stTargetFieldGrid.m_iFieldGridType == 0)
               {
                  this.randomField.push(stTargetFieldGrid);
                  iCnt++;
               }
               iLoopCnt++;
            }
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
   }
}

