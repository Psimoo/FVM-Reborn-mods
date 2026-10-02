package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.AddMouseFireBuff;
   import com.aurora.ui.maogoutd.resource.effect.RemoveCardFireBuff;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.BurnEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.LightEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.PreWarnEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class NightRaspberryMusicGameMap extends BaseGameMap
   {
      
      private static var ms_arrAddMouseFireBuff:Array;
      
      private static var ms_arrRemoveCardFireBuff:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iAppearedTime:int = -10;
      
      private var m_arrEffect:Array = [];
      
      private var startlight:int = 0;
      
      private var randomField:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8389312,8389320);
      
      public function NightRaspberryMusicGameMap()
      {
         var iYIndex:int = 0;
         var iYIndex0:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         if(null == ms_arrAddMouseFireBuff)
         {
            ms_arrAddMouseFireBuff = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrAddMouseFireBuff[iYIndex] = [];
            }
         }
         if(null == ms_arrRemoveCardFireBuff)
         {
            ms_arrRemoveCardFireBuff = [];
            for(iYIndex0 = 0; iYIndex0 < BattleFieldView.a_1012; iYIndex0++)
            {
               ms_arrRemoveCardFireBuff[iYIndex0] = [];
            }
         }
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
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][6].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][7].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 1;
               this.removeEffectMovie();
               this.m_iAppearedTime = -10;
               info = CrossServerHandler.Get().m_sitdownInfo;
               this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var iYIndex:int = 0;
         var cardBuff:RemoveCardFireBuff = null;
         var iYIndex0:int = 0;
         var mouseBuff:AddMouseFireBuff = null;
         if(stData is Array && stData[0] == 2)
         {
            if(ms_arrRemoveCardFireBuff)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for each(cardBuff in ms_arrRemoveCardFireBuff[iYIndex])
                  {
                     if(cardBuff)
                     {
                        cardBuff.a_3940();
                     }
                  }
                  ms_arrRemoveCardFireBuff[iYIndex] = [];
               }
            }
            if(ms_arrAddMouseFireBuff)
            {
               for(iYIndex0 = 0; iYIndex0 < BattleFieldView.a_1012; iYIndex0++)
               {
                  for each(mouseBuff in ms_arrAddMouseFireBuff[iYIndex0])
                  {
                     if(mouseBuff)
                     {
                        mouseBuff.a_3940();
                     }
                  }
                  ms_arrAddMouseFireBuff[iYIndex0] = [];
               }
            }
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var Index:int = 0;
         var stMouseBuff:AddMouseFireBuff = null;
         var stCardBuff:RemoveCardFireBuff = null;
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
            if(this.m_iCurrentTimeIntval % (40 * 20) == 0)
            {
               this.addPreWarnEffect();
            }
            if((this.m_iCurrentTimeIntval - this.startlight) % (3 * 20) == 0)
            {
               this.addLightEffect();
            }
         }
         if(iTimeNum % 20 == 0)
         {
            this.skillBurnDefense();
         }
         if(iTimeNum % 6)
         {
            this.skillBurnMoveIntruder();
            this.skillAddFireEffect();
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRowOne(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowOne(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowOne(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowOne(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowOne(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowOne(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowOne(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRowTwo(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
         }
         if(ms_arrAddMouseFireBuff)
         {
            for(Index = 0; Index < BattleFieldView.a_1012; Index++)
            {
               for each(stMouseBuff in ms_arrAddMouseFireBuff[Index])
               {
                  if(stMouseBuff)
                  {
                     stMouseBuff.a_4003(null);
                  }
               }
            }
         }
         if(ms_arrRemoveCardFireBuff)
         {
            for(Index = 0; Index < BattleFieldView.a_1012; Index++)
            {
               for each(stCardBuff in ms_arrRemoveCardFireBuff[Index])
               {
                  if(stCardBuff)
                  {
                     stCardBuff.a_4003(null);
                  }
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
      
      protected function GetFireHurtXRangByRowOne(iYIndexNum:int) : Array
      {
         var arrXFireRange:Array = [];
         var xStart:int = 0;
         var xEnd:int = 8;
         for(var xIndex:int = xStart; xIndex <= xEnd; xIndex++)
         {
            if(!(xIndex == 7 && iYIndexNum == 1 || xIndex == 6 && iYIndexNum == 2 || xIndex == 7 && iYIndexNum == 2 || xIndex == 5 && iYIndexNum == 3 || xIndex == 6 && iYIndexNum == 3 || xIndex == 7 && iYIndexNum == 3 || xIndex == 6 && iYIndexNum == 4 || xIndex == 7 && iYIndexNum == 4 || xIndex == 7 && iYIndexNum == 5))
            {
               if(!this.IsExistDefenseForGridOne(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndexNum][xIndex]))
               {
                  arrXFireRange.push([a_3491.a_1080 * xIndex,a_3491.a_1080 * (xIndex + 1)]);
               }
            }
         }
         return arrXFireRange;
      }
      
      protected function GetFireHurtXRangByRowTwo(iYIndexNum:int) : Array
      {
         var arrXFireRange:Array = [];
         if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         else if(2 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         else if(3 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         else if(4 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         else if(5 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGridTwo(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGridOne(stFieldGrid:a_3491) : Boolean
      {
         if(Boolean(stFieldGrid.m_stBaseToolDefense) || stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      protected function IsExistDefenseForGridTwo(stFieldGrid:a_3491) : Boolean
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
         stFieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[0][0];
         if(stFieldGrid)
         {
            stEffect = PreWarnEffect.GetFreeInstance3();
            stEffect.WaitTime = 4;
            stEffect.stCallBackFunc = this.randomFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 125;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 128;
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
               stEffect.stSleepTime = 20;
               stEffect.stTargetFieldGrid = stFieldGrid;
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
            stEffect.WaitTime = 20;
            stEffect.stTargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false,2,3);
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
         while(this.m_arrEffect.length > 0)
         {
            this.m_arrEffect.pop();
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
         for(var i:int = 0; i < 18; i++)
         {
            do
            {
               m_iXGridNo = this.m_stRandomSeed.nextInt(9) + 0;
               m_iYGridNo = this.m_stRandomSeed.nextInt(7) + 0;
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null || m_iXGridNo == 7 && m_iYGridNo == 1 || m_iXGridNo == 6 && m_iYGridNo == 2 || m_iXGridNo == 7 && m_iYGridNo == 2 || m_iXGridNo == 5 && m_iYGridNo == 3 || m_iXGridNo == 6 && m_iYGridNo == 3 || m_iXGridNo == 7 && m_iYGridNo == 3 || m_iXGridNo == 6 && m_iYGridNo == 4 || m_iXGridNo == 7 && m_iYGridNo == 4 || m_iXGridNo == 7 && m_iYGridNo == 5);
            this.randomField[i] = stTargetFieldGrid;
         }
         this.startlight = this.m_iCurrentTimeIntval + 1;
      }
      
      private function skillBurnDefense() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 6;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               if(!(xIndex == 7 && yIndex == 1 || xIndex == 6 && yIndex == 2 || xIndex == 7 && yIndex == 2 || xIndex == 5 && yIndex == 3 || xIndex == 6 && yIndex == 3 || xIndex == 7 && yIndex == 3 || xIndex == 6 && yIndex == 4 || xIndex == 7 && yIndex == 4 || xIndex == 7 && yIndex == 5))
               {
                  stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(xIndex,yIndex);
                  this.BurnFieldGridDefense(stTargetFieldGrid);
               }
            }
         }
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.BurnFieldGridDefenseNormal(100);
      }
      
      private function skillBurnMoveIntruder() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 2;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(xIndex,yIndex);
               if(stTargetFieldGrid != null)
               {
                  this.BurnFieldGridMoveIntruder(stTargetFieldGrid);
               }
            }
         }
      }
      
      protected function BurnFieldGridMoveIntruder(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            if(this.m_MouseArr.indexOf(stBaseMoveIntruder.m_stMoveIntruderTypeID) == -1)
            {
               stBaseMoveIntruder.a_4208(b_182.a_436,6);
            }
         }
         return true;
      }
      
      private function skillAddFireEffect() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 2;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(xIndex,yIndex);
               if(stTargetFieldGrid != null)
               {
                  this.AddVolcanicFireEffect(stTargetFieldGrid);
               }
            }
         }
      }
      
      protected function AddVolcanicFireEffect(stTempFieldGrid:a_3491) : Boolean
      {
         var stVolcanicFireEffect:* = undefined;
         if(stTempFieldGrid.a_1511.length > 0)
         {
            if(null == ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = AddMouseFireBuff.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo - 5;
               stVolcanicFireEffect.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 5;
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,stTempFieldGrid);
               ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         if(this.IsExistDefenseForGridOne(stTempFieldGrid))
         {
            if(null == ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = RemoveCardFireBuff.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo - 15;
               stVolcanicFireEffect.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 8;
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,stTempFieldGrid);
               ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         return true;
      }
   }
}

