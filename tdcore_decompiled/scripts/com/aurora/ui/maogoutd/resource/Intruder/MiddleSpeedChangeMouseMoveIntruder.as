package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class MiddleSpeedChangeMouseMoveIntruder extends a_4206
   {
      
      private var a_1537:int;
      
      public function MiddleSpeedChangeMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MiddleSpeedChangeMouseMoveIntruder) as MiddleSpeedChangeMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MiddleSpeedChangeMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 100;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 200;
         a_1466 = 300;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1466 <= 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 8)
                  {
                     a_1275 = 8;
                     if(-100 != a_1466)
                     {
                        gotoAndStop((a_1276[2] as FrameLabel).frame);
                        a_1466 = -100;
                     }
                     else
                     {
                        gotoAndStop((a_1276[8] as FrameLabel).frame);
                     }
                  }
               }
               else if(a_1275 != 4)
               {
                  a_1275 = 4;
                  if(-100 != a_1466)
                  {
                     gotoAndStop((a_1276[2] as FrameLabel).frame);
                     a_1466 = -100;
                  }
                  else
                  {
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 7)
                  {
                     a_1275 = 7;
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
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
                  if(a_1275 != 9)
                  {
                     a_1275 = 9;
                     if(-100 != a_1466)
                     {
                        gotoAndStop((a_1276[3] as FrameLabel).frame);
                        a_1466 = -100;
                     }
                     else
                     {
                        gotoAndStop((a_1276[9] as FrameLabel).frame);
                     }
                  }
               }
               else if(a_1275 != 5)
               {
                  a_1275 = 5;
                  if(-100 != a_1466)
                  {
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                     a_1466 = -100;
                  }
                  else
                  {
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != 11 && a_1275 != 10)
         {
            if(a_1466 > 0)
            {
               a_1275 = 11;
               gotoAndStop((a_1276[11] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
            }
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         if(a_1466 <= 0 && Math.abs(a_1350) != a_3491.a_1080 / 40)
         {
            a_1350 = a_3491.a_1080 / 40;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         this.ResetMovieStatus();
         if(a_1466 <= 0 && Math.abs(a_1350) != a_3491.a_1080 / 40)
         {
            a_1350 = a_3491.a_1080 / 40;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(a_1273 > (a_1276[2] as FrameLabel).frame && a_1273 < (a_1276[4] as FrameLabel).frame)
         {
            if(a_1285 > 0)
            {
               if(a_1285 > this.a_1537)
               {
                  this.a_1537 = a_1285;
               }
               a_1285 = 0;
            }
            return true;
         }
         if(this.a_1537 > 0)
         {
            a_1285 = this.a_1537;
            this.a_1537 = 0;
         }
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

