package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class AddAvatarLifeSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function AddAvatarLifeSkill()
      {
         super();
      }
      
      public static function a_3926() : AddAvatarLifeSkill
      {
         return PoolManager.getInstance().CheckOutOne(AddAvatarLifeSkill) as AddAvatarLifeSkill;
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
               m_stBaseAvatar.a_3969(-1 * this.GetSkillEffect());
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
      
      protected function GetSkillEffect() : Number
      {
         var numEffectValue:Number = 10;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 20;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 30;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 40;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 50;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 60;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 80;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 100;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 120;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 150;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 180;
         }
         return numEffectValue;
      }
   }
}

