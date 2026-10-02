package com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class LampGodSummonSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function LampGodSummonSkill()
      {
         super();
      }
      
      public static function a_3926() : LampGodSummonSkill
      {
         return PoolManager.getInstance().CheckOutOne(LampGodSummonSkill) as LampGodSummonSkill;
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
               this.m_isSkillUsed = true;
               m_stBaseAvatar.SetSuperOnceShotNum(this.GetSkillOnceShotNum());
            }
         }
      }
      
      protected function GetSkillOnceShotNum() : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 2;
               break;
            case 1:
               numEffectValue = 2;
               break;
            case 2:
               numEffectValue = 2;
               break;
            case 3:
               numEffectValue = 2;
               break;
            case 4:
               numEffectValue = 4;
               break;
            case 5:
               numEffectValue = 4;
               break;
            case 6:
               numEffectValue = 4;
               break;
            case 7:
               numEffectValue = 4;
               break;
            case 8:
               numEffectValue = 6;
               break;
            case 9:
               numEffectValue = 6;
               break;
            case 10:
               numEffectValue = 6;
               break;
            case 11:
               numEffectValue = 9;
               break;
            case 12:
               numEffectValue = 9;
               break;
            case 13:
               numEffectValue = 9;
               break;
            case 14:
               numEffectValue = 9;
               break;
            case 15:
               numEffectValue = 12;
         }
         return numEffectValue;
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(pop:int) : void
      {
         super.UseSkill(pop);
      }
   }
}

