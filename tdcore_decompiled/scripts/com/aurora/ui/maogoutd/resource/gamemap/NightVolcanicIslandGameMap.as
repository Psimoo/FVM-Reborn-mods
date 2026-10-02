package com.aurora.ui.maogoutd.resource.gamemap
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.VolcanicFireEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class NightVolcanicIslandGameMap extends BaseGameMap
   {
      
      private static var ms_arrVolcanicFireEffects:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightVolcanicIslandGameMap()
      {
         var iYIndex:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 0;
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
      
      override public function a_4176() : a_4187
      {
         return a_1445;
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
            }
         }
         this.m_iChangeCount = 1;
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var iYIndex:int = 0;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         if(stData is Array && stData[0] == 2)
         {
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
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         var iYIndex:int = 0;
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         if(iTimeNum % 20 == 0)
         {
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][5]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][4]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][5]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][5]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][4]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][5]);
         }
         if(iTimeNum % 6)
         {
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][5]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][4]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][5]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][5]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][4]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][5]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][5]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][4]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][5]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][5]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][4]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][5]);
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && stBaseShot.x > a_3491.a_1080 * 3 && stBaseShot.x < a_3491.a_1080 * 7 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
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
         if(0 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
         }
         else if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
         }
         else if(2 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
         }
         else if(3 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4]))
            {
               arrXFireRange.push([a_3491.a_1080 * 4,a_3491.a_1080 * 5]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
         }
         else if(4 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][4]))
            {
               arrXFireRange.push([a_3491.a_1080 * 4,a_3491.a_1080 * 5]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
         }
         else if(5 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
         }
         else if(6 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][4]))
            {
               arrXFireRange.push([a_3491.a_1080 * 4,a_3491.a_1080 * 5]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
         }
         return arrXFireRange;
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
         return stFieldGrid.BurnFieldGridDefenseNormal(10);
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
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
   }
}

