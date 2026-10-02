package com.aurora.ui.maogoutd.resource.shot.OctopusCannon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class OctopusCannonGunSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function OctopusCannonGunSkill()
      {
         super();
      }
      
      public static function a_3926() : OctopusCannonGunSkill
      {
         return PoolManager.getInstance().CheckOutOne(OctopusCannonGunSkill) as OctopusCannonGunSkill;
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
         var _loc_1:Number = 3.45;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 3.4;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 3.35;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 3.3;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 3.25;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 3.2;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 3.15;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 3.1;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 3;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 2.9;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 2.8;
         }
         return _loc_1 * 20 / 70;
      }
   }
}

