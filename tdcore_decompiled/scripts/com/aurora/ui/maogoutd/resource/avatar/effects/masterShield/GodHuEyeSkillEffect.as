package com.aurora.ui.maogoutd.resource.avatar.effects.masterShield
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkillEffect;
   import flash.display.FrameLabel;
   
   public class GodHuEyeSkillEffect extends BaseSkillEffect
   {
      
      public function GodHuEyeSkillEffect()
      {
         super();
      }
      
      public static function a_3926() : GodHuEyeSkillEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodHuEyeSkillEffect) as GodHuEyeSkillEffect;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodHuEyeSkillEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         var iFrameLabelStartIndex:int = 0;
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               iFrameLabelStartIndex = (a_1276[1] as FrameLabel).frame;
               gotoAndStop(iFrameLabelStartIndex);
            }
         }
      }
   }
}

