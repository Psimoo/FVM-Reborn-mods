package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   
   public class ChanNengGemSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_iDropNum:int;
      
      public function ChanNengGemSkill()
      {
         super();
      }
      
      public static function a_3926() : ChanNengGemSkill
      {
         return PoolManager.getInstance().CheckOutOne(ChanNengGemSkill) as ChanNengGemSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 400;
         this.m_isSkillUsed = false;
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
               if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
               {
                  stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
                  if(null != stFreeEnergy)
                  {
                     iDropEnergyValue = m_stBattleFieldView.isOwnBattleField ? int(this.GetSkillEffect()) : 5;
                     iDropEnergyValue /= this.m_iDropNum;
                     stFreeEnergy.m_stCurrentBattleField = m_stBattleFieldView;
                     stFreeEnergy.a_1797(0,iDropEnergyValue,0.6 * BattleFieldView.a_1013 * Math.random(),-50,a_3491.a_1081 / 30,160 + 160 * Math.random());
                     m_stBattleFieldView.addChild(stFreeEnergy);
                  }
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
         var iEffectValue:int = 20;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 25;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 30;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 40;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 50;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 60;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 70;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 80;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 90;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 120;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 180;
         }
         else if(m_iSkillDegree == 11)
         {
            iEffectValue = 200;
         }
         else if(m_iSkillDegree == 12)
         {
            iEffectValue = 220;
         }
         else if(m_iSkillDegree == 13)
         {
            iEffectValue = 240;
         }
         else if(m_iSkillDegree == 14)
         {
            iEffectValue = 260;
         }
         else if(m_iSkillDegree == 15)
         {
            iEffectValue = 280;
         }
         return iEffectValue;
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

