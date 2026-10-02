package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class MiddleRentalPoMouseMoveIntruder extends a_4206
   {
      
      public function MiddleRentalPoMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MiddleRentalPoMouseMoveIntruder) as MiddleRentalPoMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MiddleRentalPoMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 100;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 400;
         a_1466 = 1000;
         a_1279 = -width * 0.4;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            if(a_1466 > 190)
            {
               if(a_1475)
               {
                  if(a_1275 != 8)
                  {
                     a_1275 = 8;
                     gotoAndStop((a_1276[8] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 9)
                  {
                     a_1275 = 9;
                     gotoAndStop((a_1276[9] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1466 <= 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 12)
                  {
                     a_1275 = 12;
                     if(-100 != a_1466)
                     {
                        gotoAndStop((a_1276[4] as FrameLabel).frame);
                        a_1466 = -100;
                     }
                     else
                     {
                        gotoAndStop((a_1276[12] as FrameLabel).frame);
                     }
                  }
               }
               else if(a_1275 != 6)
               {
                  a_1275 = 6;
                  if(-100 != a_1466)
                  {
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                     a_1466 = -100;
                  }
                  else
                  {
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
               }
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1466 > 190)
            {
               if(a_1475)
               {
                  if(a_1275 != 10)
                  {
                     a_1275 = 10;
                     gotoAndStop((a_1276[10] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 11)
                  {
                     a_1275 = 11;
                     gotoAndStop((a_1276[11] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1466 <= 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 13)
                  {
                     a_1275 = 13;
                     if(-100 != a_1466)
                     {
                        gotoAndStop((a_1276[5] as FrameLabel).frame);
                        a_1466 = -100;
                     }
                     else
                     {
                        gotoAndStop((a_1276[13] as FrameLabel).frame);
                     }
                  }
               }
               else if(a_1275 != 7)
               {
                  a_1275 = 7;
                  if(-100 != a_1466)
                  {
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                     a_1466 = -100;
                  }
                  else
                  {
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
                  }
               }
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1466 > 0)
            {
               if(a_1275 != 15)
               {
                  a_1275 = 15;
                  gotoAndStop((a_1276[15] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 14)
            {
               a_1275 = 14;
               gotoAndStop((a_1276[14] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid != null)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

