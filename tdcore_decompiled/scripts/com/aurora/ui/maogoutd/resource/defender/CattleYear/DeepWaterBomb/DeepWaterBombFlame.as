package com.aurora.ui.maogoutd.resource.defender.CattleYear.DeepWaterBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class DeepWaterBombFlame extends a_3909
   {
      
      private var a_1425:int;
      
      public function DeepWaterBombFlame()
      {
         super();
      }
      
      public static function a_3926() : DeepWaterBombFlame
      {
         return PoolManager.getInstance().CheckOutOne(DeepWaterBombFlame) as DeepWaterBombFlame;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeepWaterBombFlameMovie;
      }
      
      public function a_1797(iStartPlayTimeNum:int) : Boolean
      {
         this.a_1425 = iStartPlayTimeNum;
         a_1272 = 0;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_4140(iTimeInterval:int) : void
      {
         if(iTimeInterval < this.a_1425)
         {
            return;
         }
         if(iTimeInterval == this.a_1425)
         {
            gotoAndStop(1);
            this.visible = true;
            return;
         }
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
            return;
         }
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

