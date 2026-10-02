package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   
   public class DropEnergySkill extends BaseSkill
   {
      
      private var m_iDropNum:int;
      
      public function DropEnergySkill()
      {
         super();
      }
      
      public static function a_3926() : DropEnergySkill
      {
         return PoolManager.getInstance().CheckOutOne(DropEnergySkill) as DropEnergySkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 800 - this.GetSkillCoolingReduceTime();
         this.m_iDropNum = this.GetSkillEffectDropNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var i:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iDropEnergyValue:int = 0;
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum % m_uiSkillCoolingTime == 0 && Boolean(m_stBattleFieldView))
         {
            for(i = 0; i < this.m_iDropNum; i++)
            {
               stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
               if(null != stFreeEnergy)
               {
                  iDropEnergyValue = m_stBattleFieldView.isOwnBattleField ? int(a_3971.a_1341 * this.GetSkillEffectBaseEnergy()) : 5;
                  stFreeEnergy.m_stCurrentBattleField = m_stBattleFieldView;
                  stFreeEnergy.a_1797(0,iDropEnergyValue,0.6 * BattleFieldView.a_1013 * Math.random(),-50,a_3491.a_1081 / 30,160 + 160 * Math.random());
                  m_stBattleFieldView.addChild(stFreeEnergy);
               }
            }
         }
      }
      
      protected function GetSkillEffectBaseEnergy() : Number
      {
         if(m_iSkillDegree <= 10)
         {
            return 25;
         }
         if(m_iSkillDegree == 11)
         {
            return 26;
         }
         if(m_iSkillDegree == 12)
         {
            return 27;
         }
         if(m_iSkillDegree == 13)
         {
            return 29;
         }
         if(m_iSkillDegree == 14)
         {
            return 31;
         }
         if(m_iSkillDegree == 15)
         {
            return 33;
         }
         return 25;
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         if(m_iSkillDegree == 1)
         {
            iReduceTime = 0;
         }
         else if(m_iSkillDegree == 2)
         {
            iReduceTime = 5;
         }
         else if(m_iSkillDegree == 3)
         {
            iReduceTime = 0;
         }
         else if(m_iSkillDegree == 4)
         {
            iReduceTime = 5;
         }
         else if(m_iSkillDegree == 5)
         {
            iReduceTime = 10;
         }
         else if(m_iSkillDegree == 6)
         {
            iReduceTime = 5;
         }
         else if(m_iSkillDegree == 7)
         {
            iReduceTime = 10;
         }
         else if(m_iSkillDegree == 8)
         {
            iReduceTime = 20;
         }
         else if(m_iSkillDegree == 9)
         {
            iReduceTime = 20;
         }
         else if(m_iSkillDegree == 10)
         {
            iReduceTime = 25;
         }
         else if(m_iSkillDegree == 11)
         {
            iReduceTime = 25;
         }
         else if(m_iSkillDegree == 12)
         {
            iReduceTime = 25;
         }
         else if(m_iSkillDegree == 13)
         {
            iReduceTime = 25;
         }
         else if(m_iSkillDegree == 14)
         {
            iReduceTime = 25;
         }
         else if(m_iSkillDegree == 15)
         {
            iReduceTime = 25;
         }
         return 20 * iReduceTime;
      }
      
      protected function GetSkillEffectDropNum() : int
      {
         var iEffectValue:int = 1;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 1;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 1;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 2;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 2;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 2;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 4;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 11)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 12)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 13)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 14)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 15)
         {
            iEffectValue = 5;
         }
         return iEffectValue;
      }
   }
}

