package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperDeathScytheAddAttackSpeedSKill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperDeathScytheAddAttackSpeedSKill()
      {
         super();
      }
      
      public static function a_3926() : SuperDeathScytheAddAttackSpeedSKill
      {
         return PoolManager.getInstance().CheckOutOne(SuperDeathScytheAddAttackSpeedSKill) as SuperDeathScytheAddAttackSpeedSKill;
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
               m_stBaseAvatar.SetSuperAttakSpeedRate(this.GetSkillEffectAattackRate());
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
         var _loc_1:Number = 0.98;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 0.95;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 0.92;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 0.89;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 0.85;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 0.81;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 0.77;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 0.71;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 0.65;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 0.55;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 0.45;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 0.44;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 0.43;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 0.417;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 0.4;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 0.383;
         }
         return _loc_1;
      }
   }
}

