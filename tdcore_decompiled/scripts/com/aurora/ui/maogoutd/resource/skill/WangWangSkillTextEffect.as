package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WangWangSkillTextEffect extends BaseSkillEffect
   {
      
      public function WangWangSkillTextEffect()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : WangWangSkillTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(WangWangSkillTextEffect) as WangWangSkillTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WangWangSkillTextEffectMovie;
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

