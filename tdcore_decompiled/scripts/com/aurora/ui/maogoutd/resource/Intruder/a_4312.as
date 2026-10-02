package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class a_4312 extends a_4206
   {
      
      private var m_isJumping:Boolean = false;
      
      private var a_1363:a_4448;
      
      public function a_4312()
      {
         super();
         a_1461 = true;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(a_4312,WaterClimbMouseMoveIntruderMovie) as a_4312;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 16;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1473 = 20;
         this.m_isJumping = false;
         a_1339 = 170;
         a_1279 = -width * 0.2;
         a_1275 = 4;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            if(a_1475)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[11] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 7)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 12)
         {
            a_1275 = 12;
            gotoAndStop((a_1276[12] as FrameLabel).frame);
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
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 100)
         {
            if(this.m_isJumping)
            {
               a_1275 = 6;
            }
            else if(a_1475)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
         }
         else if(a_1339 == 50)
         {
            if(this.m_isJumping)
            {
               a_1275 = 7;
            }
            else if(a_1475)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[11] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 7)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 12)
         {
            a_1275 = 12;
            gotoAndStop((a_1276[12] as FrameLabel).frame);
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
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var numMoveSpeed:Number = NaN;
         var numOrigXPos:Number = x;
         if(null == this.a_1363 && Boolean(parent))
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (stDisplayBitmap.width - this.a_1363.width) + 25;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (stDisplayBitmap.width - this.a_1363.width) - 25;
            }
            this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
            parent.addChildAt(this.a_1363,1);
         }
         super.a_4216(iCurrentTime);
         if(Boolean(20 == a_1473) && Boolean(m_stCurrentFieldGrid) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid))
         {
            --a_1473;
            this.m_isJumping = true;
            BattleFieldView.a_1020.play();
            if(a_1339 > 100)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               a_3419();
            }
            else if(a_1339 > 50)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
               a_3419();
            }
            else
            {
               this.m_isJumping = false;
               a_1473 = 0;
            }
            return true;
         }
         if(a_1473 > 0 && this.m_isJumping && Boolean(m_stCurrentFieldGrid))
         {
            --a_1473;
            if(a_1473 <= 0)
            {
               this.m_isJumping = false;
               a_1350 = a_3491.a_1080 / 120;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
            }
            if(a_1473 <= 14 && a_1473 > 6)
            {
               play();
               numMoveSpeed = a_3491.a_1080 / 8;
               if(!a_1283)
               {
                  numMoveSpeed *= -1;
               }
               if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
               {
                  numMoveSpeed = 0;
               }
               x += numMoveSpeed;
            }
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo).a_3459(this);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.a_3940();
               return true;
            }
         }
         if(this.a_1363)
         {
            this.a_1363.nextFrame();
            this.a_1363.x += x - numOrigXPos;
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function a_4207() : void
      {
         if(this.a_1363)
         {
            this.a_1363.gotoAndStop(1);
            this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
         }
      }
   }
}

