package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class SpaceMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 360;
      
      private static const MAX_INJURED_LIFE:int = 200;
      
      private static const NORMAL_SPEED:int = 6;
      
      private static const JUMP_SPEED:int = 1.5;
      
      private var m_isJump:Boolean = false;
      
      private var m_bFirstEnter:Boolean = false;
      
      public function SpaceMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceMouseMoveIntruder) as SpaceMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * NORMAL_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.m_isJump = false;
         a_1464 = false;
         this.m_bFirstEnter = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_isJump == false)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isJump == false)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 6)
         {
            a_1275 = 6;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(this.m_bFirstEnter == false)
         {
            this.m_bFirstEnter = true;
            this.DoStateChange();
         }
         super.a_4216(iCurrentTime);
         var numOrigXPos:Number = x;
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function DoStateChange() : void
      {
         var jump:Boolean = false;
         jump = m_stCurrentFieldGrid.m_iXGridNo % 2 == 0 && m_stCurrentFieldGrid.m_iXGridNo != 0;
         if(this.m_isJump != jump)
         {
            a_1464 = jump;
            this.m_isJump = jump;
            if(jump == false)
            {
               a_1465 = 0;
               a_1350 = a_3491.a_1080 / (20 * NORMAL_SPEED);
            }
            else
            {
               a_1465 = 3;
               a_1350 = a_3491.a_1080 / (20 * JUMP_SPEED);
               if(a_1339 > MAX_INJURED_LIFE)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               a_3419();
            }
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         super.ChangeFieldGrid(stNextFieldGrid);
         this.DoStateChange();
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

