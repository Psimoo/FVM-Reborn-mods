package com.aurora.ui.maogoutd.resource.avatar.effects.masterShield
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class GodBlessEyeSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_iEffectValue:int;
      
      public function GodBlessEyeSkill()
      {
         super();
      }
      
      public static function a_3926() : GodBlessEyeSkill
      {
         return PoolManager.getInstance().CheckOutOne(GodBlessEyeSkill) as GodBlessEyeSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
         m_uiSkillCoolingTime = this.GetSkillCoolingIntervalTime();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stFreeEnergy:a_4157 = null;
         var iCellEnergyValue:int = 0;
         var iAllEnergyValue:int = 0;
         var iEnergyNum:int = 0;
         var iRestEnergy:int = 0;
         var i:int = 0;
         var iDropEnergyValue:int = 0;
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % GetSkillCoolingTime() == 0)
         {
            if(AvatarIsOk)
            {
               iCellEnergyValue = 20;
               iAllEnergyValue = this.GetSkillEffectValue();
               iEnergyNum = Math.floor(iAllEnergyValue / iCellEnergyValue);
               iRestEnergy = iAllEnergyValue - iEnergyNum * iCellEnergyValue;
               for(i = 0; i < iEnergyNum; i++)
               {
                  iDropEnergyValue = m_stBattleFieldView.isOwnBattleField ? iCellEnergyValue : 5;
                  if(0 == i)
                  {
                     iDropEnergyValue += iRestEnergy;
                     iRestEnergy = 0;
                  }
                  stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
                  stFreeEnergy.m_stCurrentBattleField = m_stBattleFieldView;
                  if(m_stBattleFieldView.isOwnBattleField)
                  {
                     stFreeEnergy.a_1797(0,iDropEnergyValue,a_3491.a_1080 * m_stBaseAvatar.stFieldGrid.m_iXGridNo + i * 20,a_3491.a_1081 * m_stBaseAvatar.stFieldGrid.m_iYGridNo + Math.random() * 20 - 30);
                     m_stBattleFieldView.addChild(stFreeEnergy);
                  }
                  else
                  {
                     stFreeEnergy.a_1797(0,iDropEnergyValue,a_3491.a_1080 * (BattleFieldView.a_1011 - m_stBaseAvatar.stFieldGrid.m_iXGridNo - 1) - i * 20,a_3491.a_1081 * m_stBaseAvatar.stFieldGrid.m_iYGridNo + Math.random() * 20 - 30);
                     m_stBattleFieldView.addChild(stFreeEnergy);
                  }
               }
               if(iRestEnergy > 0)
               {
                  stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
                  stFreeEnergy.m_stCurrentBattleField = m_stBattleFieldView;
                  stFreeEnergy.a_1797(0,iRestEnergy,a_3491.a_1080 * m_stBaseAvatar.stFieldGrid.m_iXGridNo + Math.random() * 30 - 30,a_3491.a_1081 * m_stBaseAvatar.stFieldGrid.m_iYGridNo + Math.random() * 20 - 30);
                  m_stBattleFieldView.addChild(stFreeEnergy);
               }
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 0;
      }
      
      public function GetSkillCoolingIntervalTime() : uint
      {
         var iSkillCoolingTime:uint = 15;
         switch(m_iSkillDegree)
         {
            case 0:
               iSkillCoolingTime = 15;
               break;
            case 1:
               iSkillCoolingTime = 15;
               break;
            case 2:
               iSkillCoolingTime = 15;
               break;
            case 3:
               iSkillCoolingTime = 14;
               break;
            case 4:
               iSkillCoolingTime = 14;
               break;
            case 5:
               iSkillCoolingTime = 14;
               break;
            case 6:
               iSkillCoolingTime = 13;
               break;
            case 7:
               iSkillCoolingTime = 13;
               break;
            case 8:
               iSkillCoolingTime = 12;
               break;
            case 9:
               iSkillCoolingTime = 11;
               break;
            case 10:
               iSkillCoolingTime = 10;
               break;
            case 11:
               iSkillCoolingTime = 10;
               break;
            case 12:
               iSkillCoolingTime = 10;
               break;
            case 13:
               iSkillCoolingTime = 10;
               break;
            case 14:
               iSkillCoolingTime = 10;
               break;
            case 15:
               iSkillCoolingTime = 10;
               break;
            default:
               throw Error("GetSkillIntervalTime::星级越界！！！");
         }
         return uint(iSkillCoolingTime * 20);
      }
      
      protected function GetSkillEffectValue() : int
      {
         var iEffectValue:int = 6;
         switch(m_iSkillDegree)
         {
            case 0:
               iEffectValue = 20;
               break;
            case 1:
               iEffectValue = 30;
               break;
            case 2:
               iEffectValue = 40;
               break;
            case 3:
               iEffectValue = 50;
               break;
            case 4:
               iEffectValue = 60;
               break;
            case 5:
               iEffectValue = 75;
               break;
            case 6:
               iEffectValue = 90;
               break;
            case 7:
               iEffectValue = 105;
               break;
            case 8:
               iEffectValue = 120;
               break;
            case 9:
               iEffectValue = 135;
               break;
            case 10:
               iEffectValue = 150;
               break;
            case 11:
               iEffectValue = 170;
               break;
            case 12:
               iEffectValue = 190;
               break;
            case 13:
               iEffectValue = 210;
               break;
            case 14:
               iEffectValue = 230;
               break;
            case 15:
               iEffectValue = 260;
               break;
            default:
               throw Error("GetSkillEffectValue::星级越界！！！");
         }
         return iEffectValue;
      }
   }
}

