package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.FieldGridUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.SpecialBubbleEffect;
   
   public class NightTianFuLuoXuanWoGameMap extends BaseGameMap
   {
      
      private static var ms_arrSpecialBubbleEffects:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function NightTianFuLuoXuanWoGameMap()
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
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][5].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][6].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 3;
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
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stBaseToolDefense == null && stFieldGrid.a_3492())
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

