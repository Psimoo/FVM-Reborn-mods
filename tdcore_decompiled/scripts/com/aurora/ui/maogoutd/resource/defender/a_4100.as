package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   
   public class a_4100 extends a_3977
   {
      
      private var a_1363:a_4448;
      
      public function a_4100()
      {
         super();
         a_1095 = 25;
         a_1338 = 5;
         a_1281 = false;
      }
      
      public static function a_3926() : a_3977
      {
         return PoolManager.getInstance().CheckOutOne(a_4100) as a_4100;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterTrayDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 50 + this.a_3965();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(null == this.a_1363 && Boolean(parent))
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (width - this.a_1363.width) + 5;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (width - this.a_1363.width) - 5;
            }
            this.a_1363.y = y + height - 0.5 * this.a_1363.height - 20;
            parent.addChildAt(this.a_1363,0);
         }
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            if(this.a_1363)
            {
               this.a_1363.nextFrame();
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         return true;
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
            iStarDegreeEffect = 10 * 6 + 20 * 3 + 30 * (a_1094 - 9);
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

