package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class NewBaseSkillEffect extends a_3909
   {
      
      public function NewBaseSkillEffect()
      {
         super();
         mouseEnabled = false;
      }
      
      public function a_1797(isReversed:Boolean = false) : Boolean
      {
         a_1283 = isReversed;
         visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
      }
      
      public function a_3940() : Boolean
      {
         visible = false;
         gotoAndStop(1);
         return true;
      }
      
      public function SpecialSkillCallBack(... args) : void
      {
      }
   }
}

