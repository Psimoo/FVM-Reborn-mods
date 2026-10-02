package com.aurora.ui.maogoutd.resource.shot.YouYouGun
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class YouYouGunSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function YouYouGunSkill()
      {
         super();
      }
      
      public static function a_3926() : YouYouGunSkill
      {
         return PoolManager.getInstance().CheckOutOne(YouYouGunSkill) as YouYouGunSkill;
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
               m_stBaseAvatar.SetAttakSpeedRate(this.GetSkillEffectAttakSpeedRate());
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
         var numEffectValue:Number = 0;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 0;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0;
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
         return numEffectValue;
      }
      
      protected function GetSkillEffectAttakSpeedRate() : Number
      {
         var _loc_1:Number = 34;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 33;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 32;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 31;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 30;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 28;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 26;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 24;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 22;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 20;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 15;
         }
         return _loc_1 * 20 / 700;
      }
   }
}

