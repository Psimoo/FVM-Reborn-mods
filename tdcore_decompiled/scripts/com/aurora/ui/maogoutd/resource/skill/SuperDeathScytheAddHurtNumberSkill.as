package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperDeathScytheAddHurtNumberSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperDeathScytheAddHurtNumberSkill()
      {
         super();
      }
      
      public static function a_3926() : SuperDeathScytheAddHurtNumberSkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperDeathScytheAddHurtNumberSkill) as SuperDeathScytheAddHurtNumberSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(pop:uint) : void
      {
         super.OnTimeInterval(pop);
         if(!this.m_isSkillUsed && pop % 80 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               m_stBaseAvatar.SetSuperAddNumber(this.GetSkillEffectAattack());
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
      
      protected function GetSkillEffectAattack() : Number
      {
         var _loc_1:Number = 50;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 60;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 70;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 80;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 90;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 100;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 120;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 150;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 180;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 210;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 300;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 350;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 370;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 390;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 410;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 450;
         }
         return _loc_1;
      }
   }
}

