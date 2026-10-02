package com.aurora.ui.maogoutd.resource.Intruder.newMouseSeoncdPhase
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class DiveGuanTouMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 800;
      
      private const HURT_HP:int = 300;
      
      private const DEAD_HP:int = 0;
      
      private const TURTLEBACK_HP:int = 1000;
      
      private var a_1546:Boolean;
      
      private var m_isMoving:Boolean;
      
      private var a_1547:Boolean;
      
      private var a_1548:Boolean;
      
      private var m_iJumpPath:Array;
      
      public function DiveGuanTouMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DiveGuanTouMouseMoveIntruder) as DiveGuanTouMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DiveGuanTouMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6.5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1466 = this.TURTLEBACK_HP;
         a_1279 = -width * 0.5;
         a_1272 = 0;
         this.m_isMoving = true;
         this.a_1546 = true;
         this.a_1547 = false;
         this.a_1548 = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.a_1547)
         {
            if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         else if(this.a_1548)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
         }
         else if(a_1339 > this.HURT_HP)
         {
            if(this.a_1546)
            {
               if(a_1475)
               {
                  if(a_1275 != 2)
                  {
                     a_1275 = 2;
                     gotoAndStop((a_1276[2] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
         }
         else if(a_1339 > this.DEAD_HP)
         {
            if(this.a_1546)
            {
               if(a_1475)
               {
                  if(a_1275 != 3)
                  {
                     a_1275 = 3;
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 7)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= this.DEAD_HP && a_1275 != 11 && a_1275 != 10)
         {
            if(this.a_1546)
            {
               a_1275 = 11;
               gotoAndStop((a_1276[11] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var temp_iLifeValue:int = a_1339;
         if(a_1466 > 0)
         {
            a_1466 -= iRduceLifeValue;
            if(a_1466 < 0)
            {
               a_1339 += a_1466;
            }
         }
         else
         {
            a_1339 -= iRduceLifeValue;
         }
         trace("ReduceLife>>",iRduceLifeValue,a_1339,a_1466);
         if(a_1339 > this.DEAD_HP && this.a_1546)
         {
            if(this.TURTLEBACK_HP == iRduceLifeValue)
            {
               if(a_1339 > 100)
               {
                  a_1339 = 100;
               }
               this.a_1548 = true;
               this.a_1546 = false;
               this.ResetMovieStatus();
            }
         }
         if(a_1339 <= this.DEAD_HP && a_1275 != 11 && a_1275 != 10)
         {
            if(this.a_1546)
            {
               a_1275 = 11;
               gotoAndStop((a_1276[11] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
            a_3419();
         }
         else if(temp_iLifeValue > this.HURT_HP && a_1339 <= this.HURT_HP)
         {
            this.ResetMovieStatus();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= this.DEAD_HP)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            a_3940();
         }
         else
         {
            this.jumpHandle();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= this.DEAD_HP)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= this.DEAD_HP)
         {
            a_4212();
         }
         else
         {
            this.jumpHandle();
         }
         return true;
      }
      
      override public function get isFearCatHead() : Boolean
      {
         if(this.a_1547 == true)
         {
            return false;
         }
         return a_1481;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iPst:Array = null;
         if(this.a_1547)
         {
            if(a_1273 == (a_1276[5] as FrameLabel).frame - 1)
            {
               this.a_1547 = false;
               this.ResetMovieStatus();
            }
            if(this.m_iJumpPath.length > 0)
            {
               iPst = this.m_iJumpPath.shift();
               x = iPst[0];
               y = iPst[1];
            }
         }
         else if(this.a_1548)
         {
            if(a_1273 == (a_1276[6] as FrameLabel).frame - 1)
            {
               this.a_1548 = false;
               this.ResetMovieStatus();
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      private function jumpHandle() : void
      {
         if(this.a_1546)
         {
            if(!this.a_1547)
            {
               if(m_stCurrentFieldGrid.m_iXGridNo - 3 >= 0)
               {
                  this.a_1547 = true;
                  this.ResetMovieStatus();
                  this.buildPath((m_stCurrentFieldGrid.m_iXGridNo - 3 + 0.6) * a_3491.a_1080);
               }
            }
         }
      }
      
      private function buildPath(iX:Number) : void
      {
         var frames:int = (a_1276[5] as FrameLabel).frame - (a_1276[4] as FrameLabel).frame - 1;
         var iY:Number = y - a_3491.a_1081 * 0.5;
         var speedX:Number = (iX - x) / (frames * 2);
         var speedY:Number = (iY - y) / frames;
         this.m_iJumpPath = new Array();
         var i:int = 0;
         var len:int = frames * 2;
         while(i < len)
         {
            this.m_iJumpPath.push([x + speedX * i,iY + (frames - i) * speedY]);
            i++;
         }
      }
   }
}

