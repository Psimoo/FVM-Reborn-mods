package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WangLingQieYueSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function WangLingQieYueSkill()
      {
         super();
      }
      
      public static function a_3926() : WangLingQieYueSkill
      {
         return PoolManager.getInstance().CheckOutOne(WangLingQieYueSkill) as WangLingQieYueSkill;
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
               if(m_iSkillDegree >= 15)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(5);
               }
               else if(m_iSkillDegree >= 12)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(4);
               }
               else if(m_iSkillDegree >= 8)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(3);
               }
               else if(m_iSkillDegree >= 4)
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(2);
               }
               else
               {
                  m_stBaseAvatar.SetSuperOnceShotNum(1);
               }
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
   }
}

