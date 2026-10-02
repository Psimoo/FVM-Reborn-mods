package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class PoisonGasSkillEffectGas extends BaseSkillEffect
   {
      
      public function PoisonGasSkillEffectGas()
      {
         a_1271 = true;
         mouseEnabled = false;
         super();
      }
      
      public static function a_3926() : PoisonGasSkillEffectGas
      {
         return PoolManager.getInstance().CheckOutOne(PoisonGasSkillEffectGas) as PoisonGasSkillEffectGas;
      }
      
      override protected function getBindMovie() : Class
      {
         return PoisonGasSkillEffectGasMovie;
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
         if(a_1273 == a_1274)
         {
            gotoAndStop(2);
         }
      }
   }
}

