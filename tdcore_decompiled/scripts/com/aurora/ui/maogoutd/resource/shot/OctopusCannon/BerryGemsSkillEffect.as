package com.aurora.ui.maogoutd.resource.shot.OctopusCannon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   
   public class BerryGemsSkillEffect extends a_3909
   {
      
      public function BerryGemsSkillEffect()
      {
         super();
      }
      
      public static function a_3926() : BerryGemsSkillEffect
      {
         return PoolManager.getInstance().CheckOutOne(BerryGemsSkillEffect) as BerryGemsSkillEffect;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return BerryGemsSkillEffectMovie;
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

