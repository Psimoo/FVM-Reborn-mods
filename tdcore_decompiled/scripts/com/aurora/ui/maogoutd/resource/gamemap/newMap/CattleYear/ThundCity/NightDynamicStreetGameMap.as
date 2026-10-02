package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.BurnEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.HoTrafficPreWarnEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.LightEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.PreWarnEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.VeTrafficPreWarnEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class NightDynamicStreetGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iAppearedTime:int = -10;
      
      private var m_arrEffect:Array = [];
      
      private var startlight:int = 0;
      
      private var PreWarnBornIndex:int = 0;
      
      private var randomField:Array = new Array();
      
      public function NightDynamicStreetGameMap()
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
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 1;
               this.removeEffectMovie();
               this.m_iAppearedTime = -10;
               this.PreWarnBornIndex = 0;
               info = CrossServerHandler.Get().m_sitdownInfo;
               this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
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
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         var isChanged:Boolean = false;
         if(this.m_iAppearedTime == -10)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_iCurrentTimeIntval % (67 * 20) == 0)
            {
               this.addTrafficPreWarnEffect();
            }
            if(this.m_iCurrentTimeIntval % (45 * 20) == 0)
            {
               this.addPreWarnEffect();
            }
            if((this.m_iCurrentTimeIntval - this.startlight) % (2 * 20) == 0)
            {
               this.addLightEffect();
            }
         }
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
         var arrXFireRange:Array = [];
         if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(2 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(3 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(4 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
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
      
      private function addPreWarnEffect() : void
      {
         var stFieldGrid:a_3491 = null;
         var stEffect:PreWarnEffect = null;
         ++this.PreWarnBornIndex;
         if(this.PreWarnBornIndex % 2 == 0)
         {
            stFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[4][2];
         }
         else
         {
            stFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5];
         }
         if(stFieldGrid)
         {
            stEffect = PreWarnEffect.a_3926();
            stEffect.WaitTime = 4;
            stEffect.stCallBackFunc = this.randomFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            this.m_arrEffect.push(stEffect);
         }
      }
      
      private function addTrafficPreWarnEffect() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stEffect:* = undefined;
         m_iXGridNo = BattleFieldView.a_1011 - 1;
         m_iYGridNo = 3 * this.m_stRandomSeed.nextInt(2);
         stFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stFieldGrid)
         {
            stEffect = HoTrafficPreWarnEffect.a_3926();
            stEffect.WaitTime = 4;
            stEffect.m_BattleType = a_1445.m_iBattleFieldStageType;
            stEffect.stStartFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 2.5;
            this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            this.m_arrEffect.push(stEffect);
         }
         m_iXGridNo = int(this.m_stRandomSeed.nextInt(8));
         m_iYGridNo = 0;
         stFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stFieldGrid)
         {
            stEffect = VeTrafficPreWarnEffect.a_3926();
            stEffect.WaitTime = 4;
            stEffect.m_BattleType = a_1445.m_iBattleFieldStageType;
            stEffect.stStartFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            this.m_arrEffect.push(stEffect);
         }
      }
      
      private function addLightEffect() : void
      {
         var stFieldGrid:a_3491 = null;
         var stEffect:LightEffect = null;
         if(this.randomField.length > 0)
         {
            stFieldGrid = this.randomField.pop();
            if(stFieldGrid != null)
            {
               stEffect = LightEffect.a_3926();
               stEffect.stCallBackFunc = this.addBurnEffect;
               stEffect.stTargetFieldGrid = stFieldGrid;
               stEffect.stSleepTime = 10;
               stEffect.a_1797(false);
               stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
               stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 4;
               this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
               this.m_arrEffect.push(stEffect);
            }
         }
      }
      
      private function addBurnEffect(stFieldGrid:a_3491) : void
      {
         var stEffect:BurnEffect = null;
         if(stFieldGrid != null && stFieldGrid.m_isCanBrokeByLight)
         {
            stEffect = BurnEffect.a_3926();
            stEffect.WaitTime = 15;
            stEffect.stTargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stEffect.stTargetFieldGrid.m_stBurnEffect = stEffect;
            this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
            this.m_arrEffect.push(stEffect);
         }
      }
      
      private function removeEffectMovie() : void
      {
         var stEffect:* = undefined;
         for each(stEffect in this.m_arrEffect)
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
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         for(var i:int = 0; i < 5; i++)
         {
            do
            {
               if(this.PreWarnBornIndex % 2 == 0)
               {
                  m_iXGridNo = this.m_stRandomSeed.nextInt(4) + 0;
                  m_iYGridNo = this.m_stRandomSeed.nextInt(4) + 2;
               }
               else
               {
                  m_iXGridNo = this.m_stRandomSeed.nextInt(4) + 3;
                  m_iYGridNo = this.m_stRandomSeed.nextInt(4) + 0;
               }
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null);
            this.randomField[i] = stTargetFieldGrid;
         }
         this.startlight = this.m_iCurrentTimeIntval + 1;
      }
   }
}

