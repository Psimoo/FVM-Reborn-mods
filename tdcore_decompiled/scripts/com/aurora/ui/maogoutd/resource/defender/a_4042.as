package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4117;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   
   public class a_4042 extends a_3953
   {
      
      private var m_isUsed:Boolean = false;
      
      private var a_1363:a_4448;
      
      public function a_4042()
      {
         super();
         a_1305 = true;
         a_1095 = 25;
         a_1304 = 0;
         a_1310 = 8;
         a_1338 = 5;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4042) as a_4042;
      }
      
      override protected function getBindMovie() : Class
      {
         return GangGomerularAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isUsed = false;
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 300 - this.a_3965();
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
            parent.addChildAt(this.a_1363,1);
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
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stDropWaterSpray:a_4117 = null;
         if(!this.m_isUsed && a_1334.a_1511.length > 0)
         {
            stBaseMoveIntruder = a_1334.a_1511[0];
            stDropWaterSpray = a_4117.a_3926();
            stDropWaterSpray.a_1797(a_1283);
            stDropWaterSpray.a_4118(this,stBaseMoveIntruder);
            stDropWaterSpray.x = (a_1334.m_iXGridNo + 1.4) * a_3491.a_1080;
            stDropWaterSpray.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            parent.addChild(stDropWaterSpray);
            this.m_isUsed = true;
         }
         return true;
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
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 1 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * (a_1094 - 6);
         }
         else if(a_1094 > 9 && a_1094 <= 14)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * 3 + 2 * (a_1094 - 9);
         }
         else if(a_1094 == 15)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * 3 + 2 * 5 + 1 * (a_1094 - 14);
         }
         else if(a_1094 == 16)
         {
            iStarDegreeEffect = 27;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

