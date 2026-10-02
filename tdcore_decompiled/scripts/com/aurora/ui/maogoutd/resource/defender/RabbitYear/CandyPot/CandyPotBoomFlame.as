package com.aurora.ui.maogoutd.resource.defender.RabbitYear.CandyPot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class CandyPotBoomFlame extends a_3909
   {
      
      private var a_1425:int;
      
      public function CandyPotBoomFlame()
      {
         super();
      }
      
      public static function a_3926() : CandyPotBoomFlame
      {
         return PoolManager.getInstance().CheckOutOne(CandyPotBoomFlame) as CandyPotBoomFlame;
      }
      
      override protected function getBindMovie() : Class
      {
         return CandyPotBoomFlameMovie;
      }
      
      public function a_1797(iStartPlayTimeNum:int) : Boolean
      {
         this.a_1425 = iStartPlayTimeNum;
         a_1272 = 0;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_4140(iTimeInterval:int) : Boolean
      {
         if(iTimeInterval < this.a_1425)
         {
            return false;
         }
         if(iTimeInterval == this.a_1425)
         {
            gotoAndStop(1);
            this.visible = true;
            return true;
         }
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.visible = false;
            gotoAndStop(1);
            if(Boolean(parent) && parent.contains(this))
            {
               parent.removeChild(this);
            }
            return false;
         }
         return false;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

