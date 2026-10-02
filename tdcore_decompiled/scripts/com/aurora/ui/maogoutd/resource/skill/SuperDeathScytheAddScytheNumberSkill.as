package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperDeathScytheAddScytheNumberSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperDeathScytheAddScytheNumberSkill()
      {
         super();
      }
      
      public static function a_3926() : SuperDeathScytheAddScytheNumberSkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperDeathScytheAddScytheNumberSkill) as SuperDeathScytheAddScytheNumberSkill;
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
               this.m_isSkillUsed = true;
               if(m_iSkillDegree >= 15)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(4);
               }
               else if(m_iSkillDegree >= 10)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(3);
               }
               else if(m_iSkillDegree >= 6)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(2);
               }
               else
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(1);
               }
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
   }
}

