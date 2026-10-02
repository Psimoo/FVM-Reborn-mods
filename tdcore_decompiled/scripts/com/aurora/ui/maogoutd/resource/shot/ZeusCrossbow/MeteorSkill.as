package com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class MeteorSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function MeteorSkill()
      {
         super();
      }
      
      public static function a_3926() : MeteorSkill
      {
         return PoolManager.getInstance().CheckOutOne(MeteorSkill) as MeteorSkill;
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
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSputteringHurtRate());
               m_stBaseAvatar.SetOnceShotNum(this.GetSkillOnceShot());
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
      
      protected function GetSputteringHurtRate() : Number
      {
         var numEffectValue:Number = 0.2;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 0.23;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0.24;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.25;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.26;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.27;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.28;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.29;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 0.3;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 0.32;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 0.35;
         }
         return numEffectValue;
      }
      
      protected function GetSkillOnceShot() : Number
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
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 4;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 4;
         }
         return numEffectValue;
      }
   }
}

