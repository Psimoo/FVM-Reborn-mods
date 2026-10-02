package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BuzzSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function BuzzSkill()
      {
         super();
      }
      
      public static function a_3926() : BuzzSkill
      {
         return PoolManager.getInstance().CheckOutOne(BuzzSkill) as BuzzSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % 20 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               m_stBaseAvatar.SetSuperOnceShotNum(this.GetSkillOnceShotNum());
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSkillEffectSputteringRate());
               this.m_isSkillUsed = true;
            }
         }
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      protected function GetSkillOnceShotNum() : Number
      {
         var numEffectValue:Number = 2;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 4;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 4;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 4;
         }
         return numEffectValue;
      }
      
      protected function GetSkillEffectSputteringRate() : Number
      {
         var numEffectValue:Number = 0.2;
         if(m_iSkillDegree == 0)
         {
            numEffectValue = 0.21;
         }
         else if(m_iSkillDegree == 1)
         {
            numEffectValue = 0.22;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0.23;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.24;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.25;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.26;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.27;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.28;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 0.29;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 0.3;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 0.32;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 0.34;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 0.36;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 0.38;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 0.4;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 0.45;
         }
         return numEffectValue;
      }
   }
}

