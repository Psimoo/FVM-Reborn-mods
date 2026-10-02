package com.aurora.ui.maogoutd.resource.gamemap.newMap.Pig
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher.BottomSnowEffect;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher.TopSnowEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class NightSnowMountainSecondGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_arrTopEffect:Array = [];
      
      private var m_arrBottomEffect:Array = [];
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var startcood:int;
      
      private var tempDefenseArr:Array = new Array(286458240,286458254,286458255,286396464,286396478,286396479);
      
      private var SnowIndex:int = -1;
      
      private var SnaowArray:Array = new Array([2,4],[2,2],[6,2],[6,4]);
      
      private var a_1598:a_3491;
      
      public function NightSnowMountainSecondGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTopEffect:TopSnowEffect = null;
         var stBottomEffect:BottomSnowEffect = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         for each(stTopEffect in this.m_arrTopEffect)
         {
            stTopEffect.a_4003(iTimeNum);
         }
         for each(stBottomEffect in this.m_arrBottomEffect)
         {
            stBottomEffect.a_4003(iTimeNum);
         }
         if(iTimeNum % (80 * 20) == 0)
         {
            this.randomFieldGrid();
            this.startcood = iTimeNum;
            this.addBottomEffect();
            this.addTopEffect();
         }
         if(this.startcood != 0 && iTimeNum - this.startcood == 20 * 3)
         {
            this.removeEffectMovie();
            this.FrozenFieldGridDefense(this.a_1598);
         }
         this.clearShot(iTimeNum);
      }
      
      protected function FrozenFieldGridDefense(a_1334:a_3491) : Boolean
      {
         var xIndex:int = 0;
         if(a_1334 == null)
         {
            return false;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.FrozenCard(stFieldGridVector[yIndex][xIndex]);
            }
         }
         return true;
      }
      
      private function FrozenCard(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBaseToolDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseToolDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stProtector)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stProtector.a_3512()) == -1)
            {
               stFieldGrid.m_stProtector.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stAttackFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBoomDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stFlowerDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stFlowerDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_isShowFrozen = true;
            }
         }
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
               this.m_stCurrentBattleFieldView.ms_iFrozenBrokeTime = 50;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][3].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
               this.m_stRandomSeed.setSeed(100,500);
               this.removeEffectMovie();
            }
         }
         return true;
      }
      
      private function addBottomEffect() : void
      {
         var xStart:int = 0;
         var yStart:int = 0;
         var stEffect:BottomSnowEffect = null;
         xStart = Math.max(this.a_1598.m_iXGridNo - 2,0);
         yStart = Math.max(this.a_1598.m_iYGridNo - 2,0);
         stEffect = BottomSnowEffect.a_3926();
         stEffect.a_1797(false);
         stEffect.x = a_3491.a_1080 * xStart;
         stEffect.y = a_3491.a_1081 * yStart;
         this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,this.a_1598.m_stCurrentBattbleFieldView.stFieldGridsVector[yStart][xStart]);
         this.m_arrBottomEffect.push(stEffect);
      }
      
      private function addTopEffect() : void
      {
         var xStart:int = 0;
         var yStart:int = 0;
         var stEffect:TopSnowEffect = null;
         xStart = Math.max(this.a_1598.m_iXGridNo - 2,0);
         yStart = Math.max(this.a_1598.m_iYGridNo - 2,0);
         stEffect = TopSnowEffect.a_3926();
         stEffect.a_1797(false);
         stEffect.x = a_3491.a_1080 * xStart - 135;
         stEffect.y = a_3491.a_1081 * yStart - 135;
         this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.a_1598.m_stCurrentBattbleFieldView.stFieldGridsVector[yStart][xStart]);
         this.m_arrTopEffect.push(stEffect);
      }
      
      private function removeEffectMovie() : void
      {
         var stTopEffect:TopSnowEffect = null;
         var stBottomEffect:BottomSnowEffect = null;
         for each(stTopEffect in this.m_arrTopEffect)
         {
            stTopEffect.a_3940();
         }
         for each(stBottomEffect in this.m_arrBottomEffect)
         {
            stBottomEffect.a_3940();
         }
         while(this.m_arrTopEffect.length > 0)
         {
            this.m_arrTopEffect.pop();
         }
         while(this.m_arrBottomEffect.length > 0)
         {
            this.m_arrBottomEffect.pop();
         }
      }
      
      override public function a_4175() : a_4450
      {
         return a_4454.a_3926();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function a_4177() : void
      {
         this.SnowIndex = -1;
         this.m_stCurrentBattleFieldView.ms_iFrozenBrokeTime = 60;
         this.removeEffectMovie();
         super.a_4177();
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         ++this.SnowIndex;
         if(this.SnowIndex >= this.SnaowArray.length)
         {
            this.SnowIndex = 0;
         }
         m_iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
         m_iYGridNo = this.m_stRandomSeed.nextInt(3) + 2;
         this.a_1598 = this.m_stCurrentBattleFieldView.stFieldGridsVector[m_iYGridNo][m_iXGridNo];
      }
      
      private function randomRange(minNum:Number, maxNum:Number) : Number
      {
         return Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
      }
      
      private function clearShot(iTimeNum:uint) : void
      {
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
         }
      }
      
      protected function GetFireHurtXRangByRow(iYIndexNum:int) : Array
      {
         var arrXFireRange:Array = [];
         if(0 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         else if(2 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3]))
            {
               arrXFireRange.push([a_3491.a_1080 * 3,a_3491.a_1080 * 4]);
            }
         }
         else if(3 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4]))
            {
               arrXFireRange.push([a_3491.a_1080 * 4,a_3491.a_1080 * 5]);
            }
         }
         else if(4 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][3]))
            {
               arrXFireRange.push([a_3491.a_1080 * 3,a_3491.a_1080 * 4]);
            }
         }
         else if(6 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
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
   }
}

