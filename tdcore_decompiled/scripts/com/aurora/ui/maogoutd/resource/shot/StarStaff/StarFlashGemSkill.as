package com.aurora.ui.maogoutd.resource.shot.StarStaff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class StarFlashGemSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function StarFlashGemSkill()
      {
         super();
      }
      
      public static function a_3926() : StarFlashGemSkill
      {
         return PoolManager.getInstance().CheckOutOne(StarFlashGemSkill) as StarFlashGemSkill;
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
      
      protected function GetSkillEffectAttakSpeedRate() : Number
      {
         var _loc_1:Number = 3;
         if(m_iSkillDegree == 0)
         {
            _loc_1 = 2.9;
         }
         else if(m_iSkillDegree == 1)
         {
            _loc_1 = 2.85;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 2.8;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 2.75;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 2.7;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 2.65;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 2.6;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 2.55;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 2.5;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 2.45;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 2.4;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 2.3;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 2.2;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 2.1;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 2;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 1.8;
         }
         return _loc_1 * 20 / 60;
      }
   }
}

