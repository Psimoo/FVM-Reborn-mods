package com.aurora.ui.maogoutd.resource.shot.ShotTrigger
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.termiThreeShotGun.IntruderBurnEffect;
   
   public class BurnBuffTrigger extends BaseShotTrigger
   {
      
      private var m_SkillDuration:int;
      
      private var m_SkillPower:Number;
      
      public function BurnBuffTrigger(probability:int = 100, seed:int = -1, duration:int = 30, power:Number = 10)
      {
         super(probability,seed);
         this.m_SkillDuration = duration;
         this.m_SkillPower = power;
      }
      
      override protected function OnExecute() : void
      {
         this.addFireBurnBuff(m_target);
      }
      
      private function addFireBurnBuff(baseMoveIntruder:a_4206) : void
      {
         var buff:IntruderBurnEffect = null;
         if(!baseMoveIntruder.m_stCurrentFieldGrid)
         {
            return;
         }
         if(!baseMoveIntruder.m_stGeneralBurnEffect)
         {
            buff = IntruderBurnEffect.a_3926();
            buff.stTargetIntruder = baseMoveIntruder;
            buff.a_1797(baseMoveIntruder.IsReversed());
            buff.AddBuff(this.m_SkillDuration,this.m_SkillPower);
            buff.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x - 20;
            buff.y = baseMoveIntruder.y + baseMoveIntruder.stDisplayBitmap.y;
            baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,baseMoveIntruder.m_stCurrentFieldGrid);
         }
         else
         {
            IntruderBurnEffect(baseMoveIntruder.m_stGeneralBurnEffect).AddBuff(this.m_SkillDuration,this.m_SkillPower);
         }
      }
      
      override public function a_4451() : BaseShotTrigger
      {
         return new BurnBuffTrigger(m_probability,m_seed,this.m_SkillDuration,this.m_SkillPower);
      }
   }
}

