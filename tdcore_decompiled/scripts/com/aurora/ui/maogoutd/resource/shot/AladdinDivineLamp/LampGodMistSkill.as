package com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class LampGodMistSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function LampGodMistSkill()
      {
         super();
      }
      
      public static function a_3926() : LampGodMistSkill
      {
         return PoolManager.getInstance().CheckOutOne(LampGodMistSkill) as LampGodMistSkill;
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
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSkillEffectSputteringRate());
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
      
      protected function GetSkillEffectSputteringRate() : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 15;
               break;
            case 1:
               numEffectValue = 16;
               break;
            case 2:
               numEffectValue = 17;
               break;
            case 3:
               numEffectValue = 18;
               break;
            case 4:
               numEffectValue = 19;
               break;
            case 5:
               numEffectValue = 20;
               break;
            case 6:
               numEffectValue = 21;
               break;
            case 7:
               numEffectValue = 22;
               break;
            case 8:
               numEffectValue = 23;
               break;
            case 9:
               numEffectValue = 24;
               break;
            case 10:
               numEffectValue = 25;
               break;
            case 11:
               numEffectValue = 27;
               break;
            case 12:
               numEffectValue = 29;
               break;
            case 13:
               numEffectValue = 32;
               break;
            case 14:
               numEffectValue = 37;
               break;
            case 15:
               numEffectValue = 45;
         }
         return numEffectValue / 100;
      }
   }
}

