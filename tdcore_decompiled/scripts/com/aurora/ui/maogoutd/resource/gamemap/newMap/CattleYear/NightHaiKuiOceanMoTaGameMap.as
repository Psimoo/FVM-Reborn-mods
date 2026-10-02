package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.FieldGridUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.SpecialBubbleEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class NightHaiKuiOceanMoTaGameMap extends BaseGameMap
   {
      
      private static var ms_arrSpecialBubbleEffects:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightHaiKuiOceanMoTaGameMap()
      {
         var iYIndex:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         if(null == ms_arrSpecialBubbleEffects)
         {
            ms_arrSpecialBubbleEffects = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrSpecialBubbleEffects[iYIndex] = [];
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
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][3].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][5].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][0].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][0].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][1].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][7].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][0].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 1;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][3].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][4].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][5].m_iFieldGridType = 3;
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var iYIndex:int = 0;
         var stSpecialBubbleEffect:SpecialBubbleEffect = null;
         if(stData is Array && stData[0] == 2)
         {
            if(ms_arrSpecialBubbleEffects)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for each(stSpecialBubbleEffect in ms_arrSpecialBubbleEffects[iYIndex])
                  {
                     if(stSpecialBubbleEffect)
                     {
                        stSpecialBubbleEffect.a_3940();
                     }
                  }
                  ms_arrSpecialBubbleEffects[iYIndex] = [];
               }
            }
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var stSpecialBubbleEffect:SpecialBubbleEffect = null;
         var len:int = 0;
         var i:int = 0;
         var j:int = 0;
         var len1:int = 0;
         var k:int = 0;
         var i2:int = 0;
         var iYIndex:int = 0;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         if(iTimeNum % 20 == 0)
         {
            len = int(this.m_stCurrentBattleFieldView.stFieldGridsVector.length);
            for(i = 0; i < len; i++)
            {
               for(j = 0; j < this.m_stCurrentBattleFieldView.stFieldGridsVector[i].length; j++)
               {
                  this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[i][j]);
               }
            }
         }
         if(iTimeNum % 6 == 0)
         {
            len1 = int(this.m_stCurrentBattleFieldView.stFieldGridsVector.length);
            for(k = 0; k < len1; k++)
            {
               for(i2 = 0; i2 < this.m_stCurrentBattleFieldView.stFieldGridsVector[k].length; i2++)
               {
                  this.AddSpecialBubbleEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[k][i2]);
               }
            }
         }
         if(iTimeNum % 2 == 0)
         {
            if(ms_arrSpecialBubbleEffects)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for each(stSpecialBubbleEffect in ms_arrSpecialBubbleEffects[iYIndex])
                  {
                     if(stSpecialBubbleEffect)
                     {
                        stSpecialBubbleEffect.a_4003(null);
                     }
                  }
               }
            }
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
         }
      }
      
      protected function AddSpecialBubbleEffect(stTempFieldGrid:a_3491) : Boolean
      {
         var stSpecialBubbleEffect:SpecialBubbleEffect = null;
         if(this.IsExistDefenseForGrid(stTempFieldGrid))
         {
            if(null == ms_arrSpecialBubbleEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               if(null == stTempFieldGrid.m_stBaseToolDefense && !FieldGridUtil.HasOceanImmuDefenseOnGrid(stTempFieldGrid))
               {
                  stSpecialBubbleEffect = SpecialBubbleEffect.a_3926();
                  stSpecialBubbleEffect.a_1797(false);
                  stSpecialBubbleEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo;
                  stSpecialBubbleEffect.y = a_3491.a_1081 * (stTempFieldGrid.m_iYGridNo + 0.7) - 63;
                  this.m_stCurrentBattleFieldView.AddToBattleView(stSpecialBubbleEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
                  ms_arrSpecialBubbleEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stSpecialBubbleEffect;
               }
            }
         }
         else if(ms_arrSpecialBubbleEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stSpecialBubbleEffect = ms_arrSpecialBubbleEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stSpecialBubbleEffect.a_3940();
            ms_arrSpecialBubbleEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
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
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         return FieldGridUtil.BurnOceanFieldGridDefense(stFieldGrid,10);
      }
   }
}

