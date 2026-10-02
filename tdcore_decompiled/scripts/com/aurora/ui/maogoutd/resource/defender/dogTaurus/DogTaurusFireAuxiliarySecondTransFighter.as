package com.aurora.ui.maogoutd.resource.defender.dogTaurus
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class DogTaurusFireAuxiliarySecondTransFighter extends a_3959
   {
      
      public function DogTaurusFireAuxiliarySecondTransFighter()
      {
         super();
         a_1095 = DogTaurusFireAuxiliaryDefine.DEFENSE_PRICE - DogTaurusFireAuxiliaryDefine.REDUCE_DEFENSE_PRICE;
         a_1333 = false;
         a_1338 = 10;
         a_1339 = DogTaurusFireAuxiliaryDefine.GetCardLifeValueStarDegreeEffect(a_1094);
         this.InitNumHotMultiplier();
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(DogTaurusFireAuxiliarySecondTransFighter) as DogTaurusFireAuxiliarySecondTransFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogTaurusFireAuxiliarySecondTransFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         a_1325 = 0.1 * DogTaurusFireAuxiliaryDefine.a_3965(a_1094) * (1 + DogTaurusFireAuxiliaryDefine.HURT_ADDITION);
      }
      
      override public function a_1797(Point:a_3491) : Boolean
      {
         super.a_1797(Point);
         this.InitNumHotMultiplier();
         a_1339 = DogTaurusFireAuxiliaryDefine.GetCardLifeValueStarDegreeEffect(a_1094);
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

