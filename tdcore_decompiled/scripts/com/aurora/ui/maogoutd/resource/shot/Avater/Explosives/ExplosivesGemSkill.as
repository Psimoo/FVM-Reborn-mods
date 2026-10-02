package com.aurora.ui.maogoutd.resource.shot.Avater.Explosives
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class ExplosivesGemSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function ExplosivesGemSkill()
      {
         super();
      }
      
      public static function a_3926() : ExplosivesGemSkill
      {
         return PoolManager.getInstance().CheckOutOne(ExplosivesGemSkill) as ExplosivesGemSkill;
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
         var numEffectValue:Number = 0;
         if(m_iSkillDegree == 0)
         {
            numEffectValue = 1;
         }
         else if(m_iSkillDegree == 1)
         {
            numEffectValue = 1;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 1;
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
            numEffectValue = 2;
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
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 4;
         }
         return numEffectValue;
      }
      
      protected function GetSkillEffectSputteringRate() : Number
      {
         var numEffectValue:Number = 0.5;
         if(m_iSkillDegree == 0)
         {
            numEffectValue = 0.52;
         }
         else if(m_iSkillDegree == 1)
         {
            numEffectValue = 0.54;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0.56;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.58;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.6;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.64;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.68;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.72;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 0.76;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 0.8;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 0.8;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 0.85;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 0.9;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 0.95;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 1;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 1;
         }
         return numEffectValue;
      }
   }
}

