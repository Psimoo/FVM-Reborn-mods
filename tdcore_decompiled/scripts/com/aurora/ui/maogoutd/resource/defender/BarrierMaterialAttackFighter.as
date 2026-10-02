package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class BarrierMaterialAttackFighter extends a_3953
   {
      
      public function BarrierMaterialAttackFighter()
      {
         super();
         a_1095 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BarrierMaterialAttackFighter) as BarrierMaterialAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BarrierMaterialAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 50000000 + this.a_3965();
         if(a_1334.m_iFieldGridType == 0)
         {
            a_1334.m_iFieldGridType = 1;
         }
         if(a_1334.m_stTrayDefense)
         {
            a_1334.m_stTrayDefense.a_3969(a_1334.m_stTrayDefense.iLifeValue);
         }
         this.a_3969(a_1339);
         if(stFieldGrid.ClimbIsEmpty())
         {
            stFieldGrid.InitClimb();
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 10 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(a_1334.m_iFieldGridType == 0)
         {
            a_1334.m_iFieldGridType = 1;
         }
         if(a_1334.ClimbIsEmpty())
         {
            a_1334.InitClimb();
         }
         this.a_3969(a_1339);
         return true;
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
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 4 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 4 * 3 + 6 * (a_1094 - 3);
         }
         else if(a_1094 > 6)
         {
            iStarDegreeEffect = 4 * 3 + 6 * (6 - 3) + 8 * (a_1094 - 6);
         }
         return 10 * iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 2 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 2 * 3 + 2 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 2 * 3 + 2 * (6 - 3) + 3 * (m_iSkillDegree - 6);
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

