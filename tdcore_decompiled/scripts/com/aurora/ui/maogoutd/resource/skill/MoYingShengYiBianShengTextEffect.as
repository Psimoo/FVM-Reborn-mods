package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class MoYingShengYiBianShengTextEffect extends BaseSkillEffect
   {
      
      public function MoYingShengYiBianShengTextEffect()
      {
         super();
      }
      
      public static function a_3926() : MoYingShengYiBianShengTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(MoYingShengYiBianShengTextEffect) as MoYingShengYiBianShengTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MoYingShengYiBianShengTextEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         if(parent)
         {
            parent.removeChild(this);
         }
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

