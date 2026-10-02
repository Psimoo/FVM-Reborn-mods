package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class GodEdgeSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function GodEdgeSkill()
      {
         super();
      }
      
      public static function a_3926() : GodEdgeSkill
      {
         return PoolManager.getInstance().CheckOutOne(GodEdgeSkill) as GodEdgeSkill;
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
               m_stBaseAvatar.SetAttackValue(this.GetSkillEffectAttackValue());
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
      
      override public function a_4330() : void
      {
         super.a_4330();
         this.m_isSkillUsed = false;
      }
      
      protected function GetSkillEffectAttackValue() : Number
      {
         var numEffectValue:Number = 5;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 5;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 5;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 5;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 8;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 8;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 8;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 11;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 11;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 11;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 14;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 14;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 17;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 17;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 20;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 30;
         }
         return numEffectValue;
      }
      
      protected function GetSkillEffectAttakSpeedRate() : Number
      {
         var _loc_1:Number = 1.9;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 1.9;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 1.9;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 1.8;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 1.8;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 1.8;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 1.7;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 1.7;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 1.7;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 1.6;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 1.6;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 1.6;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 1.5;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 1.5;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 1.5;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 1.5;
         }
         return _loc_1 * 20 / 40;
      }
   }
}

