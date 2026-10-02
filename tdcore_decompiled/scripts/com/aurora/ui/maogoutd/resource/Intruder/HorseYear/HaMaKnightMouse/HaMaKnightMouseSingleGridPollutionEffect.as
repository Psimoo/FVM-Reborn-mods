package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.HaMaKnightMouse
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class HaMaKnightMouseSingleGridPollutionEffect extends BaseGameEffect
   {
      
      private static const SPREAD_SECONDS:int = 20 * 10;
      
      private var _grid:a_3491;
      
      private var _tick:int = 0;
      
      public function HaMaKnightMouseSingleGridPollutionEffect()
      {
         super();
      }
      
      public static function CreatePollution(grid:a_3491) : void
      {
         var params:BattleBuffParams = null;
         if(grid == null)
         {
            return;
         }
         if(grid.m_isNeedTray == false)
         {
            return;
         }
         if(grid.tagCom.HasTag(20028))
         {
            return;
         }
         params = new BattleBuffParams();
         params.gameMoveClipClass = HaMaKnightMouseSingleGridPollutionEffectMovie;
         params.effectClass = HaMaKnightMouseSingleGridPollutionEffect;
         params.y = 0;
         params.x = 0;
         params.offsetType = 0;
         var buffData:BattleBuffData = grid.buffCom.AddBuff(20029,999999,params);
         if(buffData != null && buffData.stEffect != null)
         {
            (buffData.stEffect as HaMaKnightMouseSingleGridPollutionEffect).InitData(grid);
            grid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECTS_BASE2_TYPE,grid);
         }
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         this._tick = 0;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         if(this._tick % 10 == 0)
         {
            this.DamageFieldGrid(this._grid,50);
         }
         if(this._tick == SPREAD_SECONDS)
         {
         }
      }
      
      private function DamageFieldGrid(stFieldGrid:a_3491, damage:int) : void
      {
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(damage);
         }
         if(stFieldGrid.m_stTrayDefense == null)
         {
            BattleDestroyUtil.ClearOneGridIgnoreFangYu(stFieldGrid);
         }
      }
      
      private function CreatePollution(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = this._grid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         HaMaKnightMouseSingleGridPollutionEffect.CreatePollution(grid);
      }
   }
}

