package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class PoisonGasSkillTextEffect extends BaseSkillEffect
   {
      
      public function PoisonGasSkillTextEffect()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : PoisonGasSkillTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(PoisonGasSkillTextEffect) as PoisonGasSkillTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return PoisonGasSkillTextEffectMovie;
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

