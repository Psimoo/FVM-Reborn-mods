package com.aurora.ui.maogoutd.resource.defender.doubleGu
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   
   public class DoubleGuFirstFlameEnergyFlower extends a_3971
   {
      
      private var m_iGrowTime:int;
      
      public function DoubleGuFirstFlameEnergyFlower()
      {
         super();
         this.m_iGrowTime = 1800;
         a_1347 = 4;
         a_1346 = 2;
         a_1335 = 65545;
         a_1095 = DoubleGuDefine.DEFENSE_PRICE;
         a_1344 = b_180.a_421;
         a_1333 = true;
         a_1345 = DoubleGuDefine.GetCardSkillEffectMinValue(m_iSkillDegree);
         a_1343 = DoubleGuDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(DoubleGuFirstFlameEnergyFlower) as DoubleGuFirstFlameEnergyFlower;
      }
      
      override protected function getBindMovie() : Class
      {
         return DoubleGuFirstFlameEnergyFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_iGrowTime = 1800;
         a_1344 = b_180.a_421;
         a_1345 = DoubleGuDefine.GetCardSkillEffectMinValue(m_iSkillDegree);
         a_1343 = DoubleGuDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(this.m_iGrowTime > 0)
         {
            --this.m_iGrowTime;
            if(this.m_iGrowTime == 0)
            {
               a_1345 = DoubleGuDefine.a_3966(m_iSkillDegree);
               a_1344 = b_180.a_420;
               BattleFieldView.a_1044.play();
            }
         }
         if(iCurrentTime % 3 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iGrowTime = 1800;
         a_1344 = b_180.a_421;
         return true;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
   }
}

