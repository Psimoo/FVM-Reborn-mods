package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_4103 extends a_3953
   {
      
      public function a_4103()
      {
         super();
         a_1095 = 100;
         a_1304 = b_183.b_184;
         a_1310 = 8;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4103) as a_4103;
      }
      
      override protected function getBindMovie() : Class
      {
         return XiaoNongBaoAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
   }
}

