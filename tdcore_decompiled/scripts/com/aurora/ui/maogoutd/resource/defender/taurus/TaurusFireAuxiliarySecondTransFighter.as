package com.aurora.ui.maogoutd.resource.defender.taurus
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class TaurusFireAuxiliarySecondTransFighter extends a_3959
   {
      
      public function TaurusFireAuxiliarySecondTransFighter()
      {
         super();
         a_1095 = TaurusFireAuxiliaryDefine.DEFENSE_PRICE - TaurusFireAuxiliaryDefine.REDUCE_DEFENSE_PRICE;
         a_1333 = false;
         a_1338 = 10;
         a_1339 = 7 * 7 + 1 + TaurusFireAuxiliaryDefine.GetCardLifeValueStarDegreeEffect(a_1094);
         this.InitNumHotMultiplier();
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(TaurusFireAuxiliarySecondTransFighter) as TaurusFireAuxiliarySecondTransFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusFireAuxiliarySecondTransFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 1.1 + 0.1);
         a_1325 = (fBaseHotiplier.Value + 0.1 * TaurusFireAuxiliaryDefine.a_3965(a_1094)) * (1 + TaurusFireAuxiliaryDefine.HURT_ADDITION);
         if(a_1325 > 2 * 3 * 1.2 + 0.0001)
         {
            a_1325 = 0;
         }
      }
      
      override public function a_1797(Point:a_3491) : Boolean
      {
         super.a_1797(Point);
         this.InitNumHotMultiplier();
         a_1339 = 7 * 7 + 1 + TaurusFireAuxiliaryDefine.GetCardLifeValueStarDegreeEffect(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3957(visible:int) : void
      {
         if(visible % 2 == 0)
         {
            super.a_3957(visible);
         }
      }
   }
}

