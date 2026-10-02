package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BlisterBlockSkill extends BaseSkill
   {
      
      private var m_stBlisterBlockSkillEffectBlister:BlisterBlockSkillEffectBlister;
      
      public function BlisterBlockSkill()
      {
         super();
      }
      
      public static function a_3926() : BlisterBlockSkill
      {
         return PoolManager.getInstance().CheckOutOne(BlisterBlockSkill) as BlisterBlockSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 3600 - this.GetSkillCoolingReduceTime();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum - m_uiStartCoolingTime < 110)
         {
            if(this.m_stBlisterBlockSkillEffectBlister)
            {
               this.m_stBlisterBlockSkillEffectBlister.OnTimeInterval(iTimeNum);
            }
         }
         else if(iTimeNum - m_uiStartCoolingTime == 110)
         {
            if(this.m_stBlisterBlockSkillEffectBlister)
            {
               this.m_stBlisterBlockSkillEffectBlister.a_3940();
               this.m_stBlisterBlockSkillEffectBlister = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
         this.m_stBlisterBlockSkillEffectBlister = BlisterBlockSkillEffectBlister.a_3926();
         if(m_stBattleFieldView)
         {
            this.m_stBlisterBlockSkillEffectBlister.a_1797(!m_stBattleFieldView.isOwnBattleField);
            this.m_stBlisterBlockSkillEffectBlister.x = 250;
            this.m_stBlisterBlockSkillEffectBlister.y = 90;
            m_stBattleFieldView.addChild(this.m_stBlisterBlockSkillEffectBlister);
         }
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         if(this.m_stBlisterBlockSkillEffectBlister)
         {
            this.m_stBlisterBlockSkillEffectBlister.a_3940();
            this.m_stBlisterBlockSkillEffectBlister = null;
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         return 0;
      }
      
      protected function GetSkillEffectRowNum() : int
      {
         return 0;
      }
   }
}

