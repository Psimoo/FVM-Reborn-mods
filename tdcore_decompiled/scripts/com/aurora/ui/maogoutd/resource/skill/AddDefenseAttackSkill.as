package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class AddDefenseAttackSkill extends BaseSkill
   {
      
      public function AddDefenseAttackSkill()
      {
         super();
      }
      
      public static function a_3926() : AddDefenseAttackSkill
      {
         return PoolManager.getInstance().CheckOutOne(AddDefenseAttackSkill) as AddDefenseAttackSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         if(m_stBaseAvatar)
         {
            sourceID = "AddDefenseAttack_" + m_uiSkillID + "_" + (m_stBaseAvatar.m_isMyPlaced ? "MySkill" : "OtherSkill");
         }
      }
      
      override public function OnTimeInterval(pop:uint) : void
      {
         super.OnTimeInterval(pop);
         if(Boolean(pop % 20 == 0 && m_stBattleFieldView && m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid) && sourceID != "")
         {
            AttackBuffManager.instance.UpdateBuffRange(sourceID,m_stBaseAvatar.stFieldGrid,1,1,null,this.ApplyBuff);
         }
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(pop:int) : void
      {
         super.UseSkill(pop);
      }
      
      override public function a_4330() : void
      {
         if(sourceID != "")
         {
            AttackBuffManager.instance.RemoveBuffBySource(sourceID);
         }
         super.a_4330();
      }
      
      private function ApplyBuff(srcID:String, target:a_3953) : void
      {
         target.AddAttackBuffFromSource(srcID,this.GetSkillEffectAattackRate());
      }
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var _loc_1:Number = 0.05;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 0.06;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 0.07;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 0.09;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 0.11;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 0.13;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 0.16;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 0.19;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 0.22;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 0.26;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 0.3;
         }
         return _loc_1;
      }
   }
}

