package com.aurora.ui.maogoutd.resource.defender.taurus
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class TaurusFireAuxiliaryFighter extends a_3959
   {
      
      public function TaurusFireAuxiliaryFighter()
      {
         super();
         a_1095 = TaurusFireAuxiliaryDefine.DEFENSE_PRICE;
         a_1333 = false;
         a_1338 = 10;
         a_1339 = 7 * 7 + 1 + this.GetCardLifeValueStarDegreeEffect();
         this.InitNumHotMultiplier();
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(TaurusFireAuxiliaryFighter) as TaurusFireAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusFireAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 1.1 + 0.1);
         a_1325 = fBaseHotiplier.Value + 0.1 * TaurusFireAuxiliaryDefine.a_3965(a_1094);
         if(a_1325 > 2 * 3)
         {
            a_1325 = 0;
         }
      }
      
      override public function a_1797(Point:a_3491) : Boolean
      {
         super.a_1797(Point);
         this.InitNumHotMultiplier();
         a_1339 = 7 * 7 + 1 + this.GetCardLifeValueStarDegreeEffect();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TaurusFireAuxiliaryDefine.a_3964(a_1094);
      }
      
      override public function a_3957(visible:int) : void
      {
         if(visible % 2 == 0)
         {
            super.a_3957(visible);
         }
      }
      
      protected function GetCardLifeValueStarDegreeEffect() : int
      {
         var _loc_1:int = 0;
         if(a_1094 <= 6)
         {
            _loc_1 = 10 * a_1094;
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            _loc_1 = 10 * 6 + 20 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            _loc_1 = 10 * 6 + 20 * 3 + 30 * (a_1094 - 9);
         }
         return _loc_1;
      }
   }
}

