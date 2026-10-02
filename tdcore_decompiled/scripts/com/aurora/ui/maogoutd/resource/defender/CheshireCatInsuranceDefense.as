package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class CheshireCatInsuranceDefense extends a_3972
   {
      
      public function CheshireCatInsuranceDefense()
      {
         super();
         a_1095 = 0;
      }
      
      public static function a_3926() : a_3972
      {
         return PoolManager.getInstance().CheckOutOne(CheshireCatInsuranceDefense) as CheshireCatInsuranceDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return CheshireCatInsuranceDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3973(iCurrentTime:int) : Boolean
      {
         super.a_3973(iCurrentTime);
         return false;
      }
   }
}

