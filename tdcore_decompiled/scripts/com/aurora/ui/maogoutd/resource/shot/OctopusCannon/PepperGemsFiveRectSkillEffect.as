package com.aurora.ui.maogoutd.resource.shot.OctopusCannon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkillEffect;
   import flash.display.FrameLabel;
   
   public class PepperGemsFiveRectSkillEffect extends BaseSkillEffect
   {
      
      public function PepperGemsFiveRectSkillEffect()
      {
         super();
      }
      
      public static function a_3926() : PepperGemsFiveRectSkillEffect
      {
         return PoolManager.getInstance().CheckOutOne(PepperGemsFiveRectSkillEffect) as PepperGemsFiveRectSkillEffect;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return PepperGemsFiveRectSkillEffectMovie;
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
               iFrameLabelStartIndex = (a_1276[0] as FrameLabel).frame;
               gotoAndStop(iFrameLabelStartIndex);
            }
         }
      }
   }
}

