package com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class LampGodNirvanaSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function LampGodNirvanaSkill()
      {
         super();
      }
      
      public static function a_3926() : LampGodNirvanaSkill
      {
         return PoolManager.getInstance().CheckOutOne(LampGodNirvanaSkill) as LampGodNirvanaSkill;
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
               numEffectValue = 110;
               break;
            case 1:
               numEffectValue = 120;
               break;
            case 2:
               numEffectValue = 130;
               break;
            case 3:
               numEffectValue = 140;
               break;
            case 4:
               numEffectValue = 150;
               break;
            case 5:
               numEffectValue = 160;
               break;
            case 6:
               numEffectValue = 170;
               break;
            case 7:
               numEffectValue = 180;
               break;
            case 8:
               numEffectValue = 200;
               break;
            case 9:
               numEffectValue = 220;
               break;
            case 10:
               numEffectValue = 240;
               break;
            case 11:
               numEffectValue = 270;
               break;
            case 12:
               numEffectValue = 300;
               break;
            case 13:
               numEffectValue = 330;
               break;
            case 14:
               numEffectValue = 360;
               break;
            case 15:
               numEffectValue = 400;
         }
         return numEffectValue / 50;
      }
   }
}

