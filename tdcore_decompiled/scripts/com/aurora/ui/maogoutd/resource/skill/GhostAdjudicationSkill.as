package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class GhostAdjudicationSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function GhostAdjudicationSkill()
      {
         super();
      }
      
      public static function a_3926() : GhostAdjudicationSkill
      {
         return PoolManager.getInstance().CheckOutOne(GhostAdjudicationSkill) as GhostAdjudicationSkill;
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
            numEffectValue = 10;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 10;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 10;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 15;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 15;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 15;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 20;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 25;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 30;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 35;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 40;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 45;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 50;
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
            _loc_1 = 1.5;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 1.5;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 1.4;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 1.3;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 1.2;
         }
         return _loc_1 * 20 / 40;
      }
   }
}

