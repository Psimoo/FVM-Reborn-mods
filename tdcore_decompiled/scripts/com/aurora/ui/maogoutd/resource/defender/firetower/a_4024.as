package com.aurora.ui.maogoutd.resource.defender.firetower
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class a_4024 extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function a_4024()
      {
         super();
         a_1095 = FireTowerCommonAuxiliaryDefine.DEFENSE_PRICE;
         this.InitNumHotMultiplier();
         a_1333 = true;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(a_4024) as a_4024;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireTowerCommonAuxiliaryFighterMovie;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 0.7 + 0.1);
         a_1325 = fBaseHotiplier.Value + 0.1 * FireTowerCommonAuxiliaryDefine.a_3965(a_1094);
         if(a_1325 > 1.6 * 2)
         {
            a_1325 = 0;
         }
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.InitNumHotMultiplier();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return FireTowerCommonAuxiliaryDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
   }
}

