package com.aurora.ui.maogoutd.resource.defender.test
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3972;
   
   public class BaseInsuranceTest extends a_3972
   {
      
      public function BaseInsuranceTest()
      {
         super();
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         m_isSleep = true;
         m_isGoHit = false;
         return super.a_1797(stFieldGrid);
      }
   }
}

