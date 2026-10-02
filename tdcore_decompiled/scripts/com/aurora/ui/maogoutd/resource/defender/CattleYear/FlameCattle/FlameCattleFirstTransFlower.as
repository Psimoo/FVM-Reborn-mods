package com.aurora.ui.maogoutd.resource.defender.CattleYear.FlameCattle
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   
   public class FlameCattleFirstTransFlower extends a_3971
   {
      
      public function FlameCattleFirstTransFlower()
      {
         super();
         a_1343 = FlameCattleFlowerDefine.a_3965(a_1094);
         a_1347 = 3;
         a_1335 = 65538;
         a_1095 = FlameCattleFlowerDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1344 = b_180.a_420;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FlameCattleFirstTransFlower) as FlameCattleFirstTransFlower;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameCattleFirstTransFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1343 = FlameCattleFlowerDefine.a_3965(a_1094);
         a_1345 = FlameCattleFlowerDefine.a_3966(m_iSkillDegree);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FlameCattleFlowerDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 3 == 0)
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

