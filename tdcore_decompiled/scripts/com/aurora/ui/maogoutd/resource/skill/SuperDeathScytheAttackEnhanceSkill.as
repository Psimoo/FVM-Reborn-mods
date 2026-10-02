package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperDeathScytheAttackEnhanceSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperDeathScytheAttackEnhanceSkill()
      {
         super();
      }
      
      public static function a_3926() : SuperDeathScytheAttackEnhanceSkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperDeathScytheAttackEnhanceSkill) as SuperDeathScytheAttackEnhanceSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(pop:uint) : void
      {
         super.OnTimeInterval(pop);
         if(!this.m_isSkillUsed && pop % 20 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               m_stBaseAvatar.SetSuperAttackRate(this.GetSkillEffectAattackRate());
               this.m_isSkillUsed = true;
            }
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
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var _loc_1:Number = 1.3;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 1.5;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 1.7;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 1.9;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 2.2;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 2.5;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 2.8;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 3.2;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 3.6;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 4;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 4.5;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 4.75;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 5;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 5.25;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 5.5;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 6;
         }
         return _loc_1;
      }
   }
}

