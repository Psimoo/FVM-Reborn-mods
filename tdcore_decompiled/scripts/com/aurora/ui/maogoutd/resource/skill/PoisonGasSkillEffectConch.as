package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class PoisonGasSkillEffectConch extends BaseSkillEffect
   {
      
      public function PoisonGasSkillEffectConch()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : PoisonGasSkillEffectConch
      {
         return PoolManager.getInstance().CheckOutOne(PoisonGasSkillEffectConch) as PoisonGasSkillEffectConch;
      }
      
      override protected function getBindMovie() : Class
      {
         return PoisonGasSkillEffectConchMovie;
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

