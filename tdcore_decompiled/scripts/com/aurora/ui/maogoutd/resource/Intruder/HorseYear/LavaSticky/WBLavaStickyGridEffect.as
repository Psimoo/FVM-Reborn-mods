package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.LavaSticky
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.resource.effect.VolcanicFireEffect;
   import flash.events.Event;
   
   public class WBLavaStickyGridEffect extends BaseGameEffect
   {
      
      private var _grid:a_3491;
      
      private var _runTick:int = 0;
      
      private var _stVolcanicFireEffect:VolcanicFireEffect;
      
      private var _buffData:BattleBuffData;
      
      public function WBLavaStickyGridEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         this._grid = null;
         this._runTick = 0;
         super.a_1797(isReversed);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._runTick;
         if(this._runTick % 10 == 0)
         {
            BattleDestroyUtil.BurnFieldGridDefense(this._grid,500 * this._buffData.value);
         }
         if(this._runTick % 3 == 0)
         {
            this.AddVolcanicFireEffect();
            this.BurnFieldGridMoveIntruder();
         }
      }
      
      public function InitData(grid:a_3491, buffData:BattleBuffData) : void
      {
         this._grid = grid;
         this._buffData = buffData;
      }
      
      protected function AddVolcanicFireEffect() : void
      {
         if(this.IsExistDefenseForGrid(this._grid) || this._grid.a_1511.length > 0)
         {
            if(this._stVolcanicFireEffect == null)
            {
               this._stVolcanicFireEffect = VolcanicFireEffect.a_3926();
               this._stVolcanicFireEffect.a_1797(false);
               this._stVolcanicFireEffect.x = a_3491.a_1080 * this._grid.m_iXGridNo;
               this._stVolcanicFireEffect.y = a_3491.a_1081 * (this._grid.m_iYGridNo + 0.7);
               this._grid.m_stCurrentBattbleFieldView.AddToBattleView(this._stVolcanicFireEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this._grid);
            }
         }
         else if(this._stVolcanicFireEffect != null)
         {
            this._stVolcanicFireEffect.a_3940();
            this._stVolcanicFireEffect = null;
         }
         if(this._stVolcanicFireEffect != null)
         {
            this._stVolcanicFireEffect.a_4003(null);
         }
      }
      
      protected function BurnFieldGridMoveIntruder() : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         for each(stBaseMoveIntruder in this._grid.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
         }
         return true;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         return Boolean(stFieldGrid.m_stBaseToolDefense) || stFieldGrid.a_3492();
      }
      
      override public function a_3940() : Boolean
      {
         if(this._stVolcanicFireEffect != null)
         {
            this._stVolcanicFireEffect.a_3940();
            this._stVolcanicFireEffect = null;
         }
         return super.a_3940();
      }
   }
}

