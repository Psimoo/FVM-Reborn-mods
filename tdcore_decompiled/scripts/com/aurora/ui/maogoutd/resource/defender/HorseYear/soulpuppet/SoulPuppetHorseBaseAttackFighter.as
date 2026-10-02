package com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.intruder.SoulPuppetBaseIntruderIntruder;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class SoulPuppetHorseBaseAttackFighter extends a_3953
   {
      
      private var m_damageRate:Number;
      
      private var m_durationTick:Number;
      
      public function SoulPuppetHorseBaseAttackFighter()
      {
         super();
         a_1095 = SoulPuppetHorseDefence.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SoulPuppetHorseBaseAttackFighter) as SoulPuppetHorseBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SoulPuppetHorseBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.m_damageRate = SoulPuppetHorseDefence.a_3965(a_1094);
            this.m_durationTick = SoulPuppetHorseDefence.a_3966(m_iSkillDegree);
         }
         return true;
      }
      
      override public function finalizeInitialization() : void
      {
         super.finalizeInitialization();
         if(m_bServerIssued)
         {
            this.addDeathGhostMouse(stFieldGrid);
            m_iDieType = 1;
            this.a_3969(this.iLifeValue);
         }
      }
      
      private function addDeathGhostMouse(stFieldGrid:a_3491) : Boolean
      {
         var puppet:SoulPuppetBaseIntruderIntruder = null;
         if(!stFieldGrid)
         {
            return false;
         }
         var obtainIntruder:a_4206 = SoulPuppetTargetHelper.GetGlobalSoulPuppetIntruder(stFieldGrid);
         if(Boolean(obtainIntruder) && Boolean(obtainIntruder.m_stCurrentFieldGrid))
         {
            obtainIntruder.SpecialSkillCallBack(2);
         }
         puppet = SoulPuppetBaseIntruderIntruder.a_3926() as SoulPuppetBaseIntruderIntruder;
         if(puppet)
         {
            puppet.a_1797(-1,a_1283 ? 1 : -1);
            puppet.a_1094 = a_1094;
            puppet.m_stMoveIntruderTypeID = 134217728;
            puppet.m_damageRate = this.m_damageRate;
            puppet.m_durationTick = this.m_durationTick;
            puppet.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            puppet.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(puppet,stFieldGrid,false);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SoulPuppetHorseDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

