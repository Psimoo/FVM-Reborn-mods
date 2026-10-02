package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class AlcoholLampFirstTransDefense extends a_3971
   {
      
      private var m_iGrowTime:int;
      
      public function AlcoholLampFirstTransDefense()
      {
         super();
         a_1335 = 9;
         a_1343 = 500 - this.a_3965();
         a_1095 = 15;
         a_1344 = b_180.a_421;
         a_1345 = 15 + a_3966();
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(AlcoholLampFirstTransDefense) as AlcoholLampFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return AlcoholLampFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_iGrowTime = 1800;
         a_1275 = 0;
         a_1346 = 1;
         a_1344 = b_180.a_421;
         super.a_1797(stFieldGrid);
         a_1343 = 500 - this.a_3965();
         a_1345 = 15 + a_3966();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
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
               a_1275 = 3;
               a_1346 = 4;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               a_1345 = 25 + a_3966();
               a_1344 = b_180.a_420;
               BattleFieldView.a_1044.play();
            }
         }
         if(iCurrentTime % 3 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.4;
      }
      
      override protected function a_3956() : Number
      {
         return -0.2 * height;
      }
      
      override protected function a_3965() : int
      {
         return 20 * a_1094;
      }
   }
}

