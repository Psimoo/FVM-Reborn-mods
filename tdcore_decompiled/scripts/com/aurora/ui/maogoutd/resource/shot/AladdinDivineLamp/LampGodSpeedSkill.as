package com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class LampGodSpeedSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function LampGodSpeedSkill()
      {
         super();
      }
      
      public static function a_3926() : LampGodSpeedSkill
      {
         return PoolManager.getInstance().CheckOutOne(LampGodSpeedSkill) as LampGodSpeedSkill;
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
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 14.5;
               break;
            case 1:
               numEffectValue = 14;
               break;
            case 2:
               numEffectValue = 13.5;
               break;
            case 3:
               numEffectValue = 13;
               break;
            case 4:
               numEffectValue = 12.5;
               break;
            case 5:
               numEffectValue = 12;
               break;
            case 6:
               numEffectValue = 11.5;
               break;
            case 7:
               numEffectValue = 11;
               break;
            case 8:
               numEffectValue = 10.5;
               break;
            case 9:
               numEffectValue = 10;
               break;
            case 10:
               numEffectValue = 9.5;
               break;
            case 11:
               numEffectValue = 9;
               break;
            case 12:
               numEffectValue = 8;
               break;
            case 13:
               numEffectValue = 7;
               break;
            case 14:
               numEffectValue = 6;
               break;
            case 15:
               numEffectValue = 5;
         }
         return numEffectValue / 15;
      }
   }
}

