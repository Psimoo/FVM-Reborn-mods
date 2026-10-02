package com.aurora.ui.maogoutd.resource.gamemap
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.FieldGridUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.SpecialBubbleEffect;
   
   public class DayShanHuOceanGameMap extends BaseGameMap
   {
      
      private static var ms_arrSpecialBubbleEffects:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function DayShanHuOceanGameMap()
      {
         var iYIndex:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 1;
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
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][1].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][1].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][1].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][0].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][1].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 3;
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
         var i3:int = 0;
         var i4:int = 0;
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
            for(i3 = 0; i3 < BattleFieldView.a_1012; i3++)
            {
               for(i4 = 0; i4 < BattleFieldView.a_1011; i4++)
               {
                  this.AddSpecialBubbleEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[i3][i4]);
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
      
      protected function BurnFieldGridMoveIntruder(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
         }
         return true;
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

