package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WangLingQiangXiSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function WangLingQiangXiSkill()
      {
         super();
      }
      
      public static function a_3926() : WangLingQiangXiSkill
      {
         return PoolManager.getInstance().CheckOutOne(WangLingQiangXiSkill) as WangLingQiangXiSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % 16 == 0)
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
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         this.m_isSkillUsed = false;
      }
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var numEffectValue:Number = 31;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 36;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 41;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 46;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 53;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 60;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 68;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 79;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 90;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 101;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 120;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 130;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 137;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 144;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 151;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 165;
         }
         return numEffectValue / 20;
      }
   }
}

