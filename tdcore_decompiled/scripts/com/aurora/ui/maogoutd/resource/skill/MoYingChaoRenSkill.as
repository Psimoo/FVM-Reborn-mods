package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class MoYingChaoRenSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function MoYingChaoRenSkill()
      {
         super();
      }
      
      public static function a_3926() : MoYingChaoRenSkill
      {
         return PoolManager.getInstance().CheckOutOne(MoYingChaoRenSkill) as MoYingChaoRenSkill;
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
               m_stBaseAvatar.SetOnceShotNum(this.GetSkillEffectAattackRate());
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
      
      protected function GetSkillEffectAattackRate() : Number
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
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 4;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 4;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 5;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 5;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 6;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 6;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 6;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 6;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 6;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 7;
         }
         return numEffectValue;
      }
   }
}

