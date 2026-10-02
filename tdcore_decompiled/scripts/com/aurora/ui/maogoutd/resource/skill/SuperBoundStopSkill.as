package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SuperBoundStopSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      public function SuperBoundStopSkill()
      {
         super();
      }
      
      public static function a_3926() : SuperBoundStopSkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperBoundStopSkill) as SuperBoundStopSkill;
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
               m_stBaseAvatar.SetShotBoundStopTime(this.GetSkillEffect());
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
         var numShotBoundStopTime:Number = 0.2;
         if(m_iSkillDegree == 1)
         {
            numShotBoundStopTime = 0.5;
         }
         else if(m_iSkillDegree == 2)
         {
            numShotBoundStopTime = 0.8;
         }
         else if(m_iSkillDegree == 3)
         {
            numShotBoundStopTime = 1.2;
         }
         else if(m_iSkillDegree == 4)
         {
            numShotBoundStopTime = 1.6;
         }
         else if(m_iSkillDegree == 5)
         {
            numShotBoundStopTime = 2;
         }
         else if(m_iSkillDegree == 6)
         {
            numShotBoundStopTime = 2.5;
         }
         else if(m_iSkillDegree == 7)
         {
            numShotBoundStopTime = 3;
         }
         else if(m_iSkillDegree == 8)
         {
            numShotBoundStopTime = 3.5;
         }
         else if(m_iSkillDegree == 9)
         {
            numShotBoundStopTime = 4;
         }
         else if(m_iSkillDegree == 10)
         {
            numShotBoundStopTime = 5;
         }
         return 20 * numShotBoundStopTime;
      }
   }
}

