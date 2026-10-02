package com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class SlowGemSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public var m_iSex:int;
      
      public function SlowGemSkill()
      {
         super();
      }
      
      public static function a_3926() : SlowGemSkill
      {
         return PoolManager.getInstance().CheckOutOne(SlowGemSkill) as SlowGemSkill;
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
               m_stBaseAvatar.SetSuperShotSlowRate(this.GetSkillSlowRate());
               m_stBaseAvatar.SetSuperShotSlowTime(this.GetSkillSlowTime());
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
         this.m_iSex = 0;
      }
      
      protected function GetSkillSlowTime() : int
      {
         var numEffectValue:Number = 0.2;
         switch(m_iSkillDegree)
         {
            case 1:
               numEffectValue = 1;
               break;
            case 2:
               numEffectValue = 1.5;
               break;
            case 3:
               numEffectValue = 2;
               break;
            case 4:
               numEffectValue = 2;
               break;
            case 5:
               numEffectValue = 2.5;
               break;
            case 6:
               numEffectValue = 2.5;
               break;
            case 7:
               numEffectValue = 3;
               break;
            case 8:
               numEffectValue = 3;
               break;
            case 9:
               numEffectValue = 3.5;
               break;
            case 10:
               numEffectValue = 3.5;
               break;
            case 11:
               numEffectValue = 4;
               break;
            case 12:
               numEffectValue = 5;
               break;
            case 13:
               numEffectValue = 6;
               break;
            case 14:
               numEffectValue = 7;
               break;
            case 15:
               numEffectValue = 9;
         }
         return numEffectValue * 10;
      }
      
      protected function GetSkillSlowRate() : Number
      {
         var numEffectValue:Number = 0.2;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 0.2;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0.25;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.25;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.3;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.3;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.35;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.35;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 0.4;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 0.4;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 0.45;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 0.45;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 0.5;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 0.5;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 0.55;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 0.6;
         }
         return numEffectValue * 100;
      }
   }
}

