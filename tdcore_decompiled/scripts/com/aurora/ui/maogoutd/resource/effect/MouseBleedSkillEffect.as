package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.Sprite;
   
   public class MouseBleedSkillEffect extends Sprite
   {
      
      public function MouseBleedSkillEffect()
      {
         super();
      }
      
      public static function a_3926() : MouseBleedSkillEffect
      {
         return PoolManager.getInstance().CheckOutOne(MouseBleedSkillEffect) as MouseBleedSkillEffect;
      }
      
      public function a_4330() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

