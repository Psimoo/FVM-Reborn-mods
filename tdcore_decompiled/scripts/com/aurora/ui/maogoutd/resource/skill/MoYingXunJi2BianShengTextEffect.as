package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class MoYingXunJi2BianShengTextEffect extends BaseSkillEffect
   {
      
      public function MoYingXunJi2BianShengTextEffect()
      {
         super();
      }
      
      public static function a_3926() : MoYingXunJi2BianShengTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(MoYingXunJi2BianShengTextEffect) as MoYingXunJi2BianShengTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MoYingXunJi2BianShengTextEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
         }
      }
   }
}

