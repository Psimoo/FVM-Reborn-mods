package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   
   public class a_4092 extends a_3953
   {
      
      private var a_1363:a_4448;
      
      public function a_4092()
      {
         super();
         a_1305 = true;
         a_1095 = 0;
         a_1304 = b_183.b_188;
         a_1310 = 6;
         a_1338 = -8;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4092) as a_4092;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterCoffeeCupAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 200;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
         var stFieldGrid:a_3491 = null;
         var isExistIntruder:Boolean = a_1334.a_1511.length > 0;
         for(i = 1; i <= 3; i++)
         {
            stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               isExistIntruder = true;
            }
         }
         if(isExistIntruder)
         {
            super.a_3954(iCurrentTime);
         }
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
               this.a_1363.x = x - 0.5 * (width - this.a_1363.width);
            }
            else
            {
               this.a_1363.x = x + 0.5 * (width - this.a_1363.width);
            }
            this.a_1363.y = y + height - 0.5 * this.a_1363.height - 5;
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
      
      override protected function a_3955() : Number
      {
         return width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.4 * height;
      }
   }
}

