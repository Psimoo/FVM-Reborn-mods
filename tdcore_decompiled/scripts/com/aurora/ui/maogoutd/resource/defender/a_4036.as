package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_4036 extends a_3953
   {
      
      public function a_4036()
      {
         super();
         a_1335 = 65537;
         a_1095 = 250;
         a_1096 = true;
         a_1304 = b_183.b_184;
         a_1310 = 8;
         a_1315 = true;
         a_1317 = 2;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4036) as a_4036;
      }
      
      override protected function getBindMovie() : Class
      {
         return FourShotGunAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 26;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3966();
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
         return 0.2 * height;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 3 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (6 - 3) + 5 * (m_iSkillDegree - 6);
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

