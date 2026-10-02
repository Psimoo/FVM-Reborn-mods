package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class a_3996 extends a_3953
   {
      
      public function a_3996()
      {
         super();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         a_1095 = 75;
         a_1335 = 3;
         a_1304 = b_183.b_190;
         a_1310 = 6;
         a_1312 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_3996) as a_3996;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeBottleAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.iBattleFieldStageType == 1)
         {
            a_1340 = true;
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
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
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
         var stFieldGrid:a_3491 = null;
         var isExistIntruder:Boolean = false;
         if(!a_1340)
         {
            isExistIntruder = a_1334.a_1511.length > 0;
            if(!a_1283)
            {
               for(i = 1; i <= 4; i++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo);
                  if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
                  {
                     isExistIntruder = true;
                  }
               }
            }
            else
            {
               for(i = 1; i <= 4; i++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - i,a_1334.m_iYGridNo);
                  if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
                  {
                     isExistIntruder = true;
                  }
               }
            }
            if(isExistIntruder)
            {
               super.a_3954(iCurrentTime);
               if(a_1321 == iCurrentTime)
               {
                  BattleFieldView.a_1032.play();
                  a_1275 = 2;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
         }
         return true;
      }
      
      override public function a_3970() : Boolean
      {
         if(a_1340)
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            a_1321 = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.6 * height;
      }
   }
}

