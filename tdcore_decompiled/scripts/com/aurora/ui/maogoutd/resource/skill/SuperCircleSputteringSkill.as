package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperCircleSputteringSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperCircleSputteringSkill()
      {
         super();
      }
      
      public static function a_3926() : SuperCircleSputteringSkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperCircleSputteringSkill) as SuperCircleSputteringSkill;
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
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSkillEffectSputteringRate());
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
      
      protected function GetSkillEffectSputteringRate() : Number
      {
         var _loc_1:Number = 0.3;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 0.4;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 0.4;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 0.5;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 0.5;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 0.6;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 0.6;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 0.7;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 0.8;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 0.9;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 1;
         }
         return _loc_1;
      }
   }
}

