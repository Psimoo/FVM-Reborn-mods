package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperTransEnergySkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperTransEnergySkill()
      {
         super();
      }
      
      public static function a_3926() : SuperTransEnergySkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperTransEnergySkill) as SuperTransEnergySkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % 20 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               m_stBaseAvatar.SetShotTransEnergyCount(this.GetSkillEffect());
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
      
      protected function GetSkillEffect() : Number
      {
         var numReduceLife:Number = 5;
         if(m_iSkillDegree == 1)
         {
            numReduceLife = 10;
         }
         else if(m_iSkillDegree == 2)
         {
            numReduceLife = 15;
         }
         else if(m_iSkillDegree == 3)
         {
            numReduceLife = 20;
         }
         else if(m_iSkillDegree == 4)
         {
            numReduceLife = 25;
         }
         else if(m_iSkillDegree == 5)
         {
            numReduceLife = 30;
         }
         else if(m_iSkillDegree == 6)
         {
            numReduceLife = 40;
         }
         else if(m_iSkillDegree == 7)
         {
            numReduceLife = 50;
         }
         else if(m_iSkillDegree == 8)
         {
            numReduceLife = 60;
         }
         else if(m_iSkillDegree == 9)
         {
            numReduceLife = 80;
         }
         else if(m_iSkillDegree == 10)
         {
            numReduceLife = 100;
         }
         else if(m_iSkillDegree == 11)
         {
            numReduceLife = 105;
         }
         else if(m_iSkillDegree == 12)
         {
            numReduceLife = 110;
         }
         else if(m_iSkillDegree == 13)
         {
            numReduceLife = 115;
         }
         else if(m_iSkillDegree == 14)
         {
            numReduceLife = 125;
         }
         else if(m_iSkillDegree == 15)
         {
            numReduceLife = 140;
         }
         return numReduceLife;
      }
   }
}

