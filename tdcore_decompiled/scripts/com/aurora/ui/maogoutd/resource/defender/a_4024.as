package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_4024 extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function a_4024()
      {
         super();
         a_1095 = 175;
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
         a_1325 = fBaseHotiplier.Value + 0.1 * this.a_3965();
         if(a_1325 > 1.4 * 2)
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
         return 70;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:Number = 0;
         if(a_1094 <= 1)
         {
            iStarDegreeEffect = 0;
         }
         else if(a_1094 <= 3)
         {
            iStarDegreeEffect = 0.1;
         }
         else if(a_1094 <= 5)
         {
            iStarDegreeEffect = 0.2;
         }
         else if(a_1094 <= 7)
         {
            iStarDegreeEffect = 0.3;
         }
         else if(a_1094 <= 8)
         {
            iStarDegreeEffect = 0.4;
         }
         else if(a_1094 <= 9)
         {
            iStarDegreeEffect = 0.5;
         }
         else if(a_1094 <= 10)
         {
            iStarDegreeEffect = 0.7;
         }
         else if(a_1094 <= 11)
         {
            iStarDegreeEffect = 0.9;
         }
         else if(a_1094 <= 12)
         {
            iStarDegreeEffect = 1.1;
         }
         else if(a_1094 <= 13)
         {
            iStarDegreeEffect = 1.3;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

