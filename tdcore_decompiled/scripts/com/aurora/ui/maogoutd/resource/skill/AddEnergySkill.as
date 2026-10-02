package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   
   public class AddEnergySkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function AddEnergySkill()
      {
         super();
      }
      
      public static function a_3926() : AddEnergySkill
      {
         return PoolManager.getInstance().CheckOutOne(AddEnergySkill) as AddEnergySkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 500;
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stFreeEnergy:a_4157 = null;
         var iDropEnergyValue:int = 0;
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum % m_uiSkillCoolingTime == 0 && Boolean(m_stBattleFieldView))
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
               if(null != stFreeEnergy)
               {
                  iDropEnergyValue = m_stBattleFieldView.isOwnBattleField ? int(this.GetSkillEffect()) : 5;
                  stFreeEnergy.m_stCurrentBattleField = m_stBattleFieldView;
                  stFreeEnergy.a_1797(0,iDropEnergyValue,a_3491.a_1080 * m_stBaseAvatar.stFieldGrid.m_iXGridNo + Math.random() * 30 - 30,a_3491.a_1081 * m_stBaseAvatar.stFieldGrid.m_iYGridNo + Math.random() * 20 - 30);
                  m_stBattleFieldView.addChild(stFreeEnergy);
               }
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
      
      protected function GetSkillEffect() : int
      {
         var iEffectValue:int = 5;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 10;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 15;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 20;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 25;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 30;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 40;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 50;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 60;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 80;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 100;
         }
         else if(m_iSkillDegree == 11)
         {
            iEffectValue = 110;
         }
         else if(m_iSkillDegree == 12)
         {
            iEffectValue = 120;
         }
         else if(m_iSkillDegree == 13)
         {
            iEffectValue = 130;
         }
         else if(m_iSkillDegree == 14)
         {
            iEffectValue = 140;
         }
         else if(m_iSkillDegree == 15)
         {
            iEffectValue = 150;
         }
         return iEffectValue;
      }
   }
}

