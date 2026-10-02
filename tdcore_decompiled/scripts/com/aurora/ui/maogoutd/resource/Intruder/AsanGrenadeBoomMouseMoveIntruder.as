package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class AsanGrenadeBoomMouseMoveIntruder extends a_4206
   {
      
      protected var m_iThrowBoomTime:int;
      
      protected var m_isGoBack:Boolean;
      
      protected var a_1304:uint = b_183.enm_MouseAsanBoomShot;
      
      protected var a_1311:int = 90;
      
      protected var a_1312:int = 15;
      
      public function AsanGrenadeBoomMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AsanGrenadeBoomMouseMoveIntruder,AsanGrenadeBoomMouseMoveIntruderMovie) as AsanGrenadeBoomMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 600;
         a_1279 = -width * 0.5;
         a_1464 = true;
         this.m_iThrowBoomTime = 0;
         this.m_isGoBack = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 100)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(this.m_isGoBack)
            {
               if(this.m_iThrowBoomTime <= 0 && a_1275 != 6)
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
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.m_isGoBack)
            {
               if(this.m_iThrowBoomTime <= 0 && a_1275 != 7)
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
         else if(a_1339 <= 0 && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
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
         var numShotXpos:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         var shotPower:int = 0;
         var numOrigXPos:Number = x;
         if(this.m_iThrowBoomTime <= 0)
         {
            super.a_4216(iCurrentTime);
         }
         if(!this.m_isGoBack && this.m_iThrowBoomTime == 0 && (m_stCurrentFieldGrid.a_3492() || m_stCurrentFieldGrid.m_iXGridNo <= 6))
         {
            if(!a_1283 && x <= 0 || a_1283 && x >= BattleFieldView.a_1013)
            {
               a_1350 = a_3491.a_1080 / 120;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               x -= a_1350 * a_1470;
            }
            this.m_isGoBack = true;
            this.m_iThrowBoomTime = 116;
            a_1464 = false;
            if(a_1339 > 50)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1339 > 0)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
         }
         if(this.m_iThrowBoomTime > 0)
         {
            --this.m_iThrowBoomTime;
            if(16 == this.m_iThrowBoomTime)
            {
               if(a_1339 > 50)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != 7)
                  {
                     a_1275 = 7;
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
               }
            }
            if(this.m_iThrowBoomTime == 0)
            {
               this.m_isGoBack = true;
               numShotXpos = this.a_3955();
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = a_4388.getInstance().a_4389(this.a_1304);
               if(null != stLastWaitShot)
               {
                  shotPower = HasTag(40009) ? 0 : this.a_1311;
                  stLastWaitShot.a_1797(0,this.a_1312,shotPower,x + numShotXpos,y + this.a_3956(),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitShot);
               }
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

