package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WangLingXingHuoSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function WangLingXingHuoSkill()
      {
         super();
      }
      
      public static function a_3926() : WangLingXingHuoSkill
      {
         return PoolManager.getInstance().CheckOutOne(WangLingXingHuoSkill) as WangLingXingHuoSkill;
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
               m_stBaseAvatar.SetSuperAttakSpeedRate(this.GetSkillEffectAattackRate());
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
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var _loc_1:Number = 26.9;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 26;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 25.1;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 24.2;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 23;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 21.8;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 20.6;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 18.8;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 19;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 16;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 13;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 12.5;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 12;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 11.5;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 11;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 10;
         }
         return _loc_1 / 30;
      }
   }
}

