package com.aurora.ui.maogoutd.resource.defender.SnakeYear.newTransCard
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class JellyPuddingSecondTransAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function JellyPuddingSecondTransAuxiliaryFighter()
      {
         super();
         a_1095 = 75;
         m_numMoveSpeedMultiplier = -1;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(JellyPuddingSecondTransAuxiliaryFighter) as JellyPuddingSecondTransAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return JellyPuddingSecondTransAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 50 + this.a_3965();
         m_numAttackAddend = this.GetCardStarDegreeEffectValueHurt();
         return true;
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
      
      private function GetCardStarDegreeEffectValueHurt() : int
      {
         var addArray:Array = [10,12,14,16,18,20,22,24,26,30,45,60,80,100,120,140,160];
         if(a_1094 < addArray.length)
         {
            return addArray[a_1094];
         }
         return addArray[0];
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 6)
         {
            iStarDegreeEffect = 10 * a_1094;
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 10 * 6 + 20 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 10 * 6 + 20 * 3 + 40 * (a_1094 - 9);
         }
         return iStarDegreeEffect;
      }
   }
}

