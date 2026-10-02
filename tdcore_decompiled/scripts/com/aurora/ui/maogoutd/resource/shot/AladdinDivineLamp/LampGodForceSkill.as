package com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class LampGodForceSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function LampGodForceSkill()
      {
         super();
      }
      
      public static function a_3926() : LampGodForceSkill
      {
         return PoolManager.getInstance().CheckOutOne(LampGodForceSkill) as LampGodForceSkill;
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
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 70;
               break;
            case 1:
               numEffectValue = 75;
               break;
            case 2:
               numEffectValue = 80;
               break;
            case 3:
               numEffectValue = 85;
               break;
            case 4:
               numEffectValue = 90;
               break;
            case 5:
               numEffectValue = 95;
               break;
            case 6:
               numEffectValue = 100;
               break;
            case 7:
               numEffectValue = 105;
               break;
            case 8:
               numEffectValue = 115;
               break;
            case 9:
               numEffectValue = 125;
               break;
            case 10:
               numEffectValue = 135;
               break;
            case 11:
               numEffectValue = 150;
               break;
            case 12:
               numEffectValue = 170;
               break;
            case 13:
               numEffectValue = 190;
               break;
            case 14:
               numEffectValue = 220;
               break;
            case 15:
               numEffectValue = 260;
         }
         return numEffectValue / 50;
      }
   }
}

