package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GuiHuaJiuBuff
   {
      
      public static const DRUNK_TAG:int = 40004;
      
      public static const DRUNK_DURATION:int = 25 * 20;
      
      public function GuiHuaJiuBuff()
      {
         super();
      }
      
      public static function AddDrunkBuff(baseMoveIntruder:a_4206, stFieldGrid:a_3491) : void
      {
         var params:BattleBuffParams = null;
         if(!baseMoveIntruder || baseMoveIntruder.iLifeValue <= 0 || !stFieldGrid || baseMoveIntruder.IsBossIntruder)
         {
            return;
         }
         params = new BattleBuffParams();
         params.gameMoveClipClass = GuiHuaJiuDrunkBuffEffectMovie;
         params.effectClass = GuiHuaJiuDrunkBuffEffect;
         params.x = 10;
         params.y = -50;
         params.offsetType = 1;
         var buffData:BattleBuffData = baseMoveIntruder.buffCom.AddBuff(DRUNK_TAG,DRUNK_DURATION,params);
         if(Boolean(buffData != null && buffData.stEffect != null) && Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stCurrentBattbleFieldView))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
         }
      }
   }
}

