package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class TakoyakiFollowFirstTransAttackFighter extends a_3953
   {
      
      public function TakoyakiFollowFirstTransAttackFighter()
      {
         super();
         a_1095 = 225;
         a_1096 = true;
         a_1304 = b_183.b_196;
         a_1313 = true;
         a_1309 = 60;
         a_1310 = 10;
         a_1314 = true;
         a_1317 = 8;
         a_1333 = true;
         a_1335 = 17;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(TakoyakiFollowFirstTransAttackFighter) as TakoyakiFollowFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TakoyakiFollowFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 60;
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
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(a_1334.m_stCurrentBattbleFieldView.a_3431())
         {
            super.a_3954(iCurrentTime);
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
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

