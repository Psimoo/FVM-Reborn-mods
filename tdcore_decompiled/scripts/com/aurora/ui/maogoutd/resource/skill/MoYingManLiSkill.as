package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class MoYingManLiSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function MoYingManLiSkill()
      {
         super();
      }
      
      public static function a_3926() : MoYingManLiSkill
      {
         return PoolManager.getInstance().CheckOutOne(MoYingManLiSkill) as MoYingManLiSkill;
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
               m_stBaseAvatar.SetAttackRate(this.GetSkillEffectAattackRate());
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
         var numEffectValue:Number = 1.2;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 1.4;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 1.6;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 1.8;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 2;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 2.2;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 2.4;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 2.6;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 2.8;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 3;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 3.5;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 3.7;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 3.9;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 4.1;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 4.3;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 4.5;
         }
         return numEffectValue;
      }
   }
}

