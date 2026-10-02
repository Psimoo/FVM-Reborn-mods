package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.FlyingCarpet
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class FlyingCarpetMouseMoveIntruder extends a_4206
   {
      
      protected var m_isFlying:Boolean = true;
      
      protected var a_1496:int;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var a_1598:a_3491;
      
      protected var m_numTargetYPos:Number;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private const FULL_HP:int = 1800;
      
      private const HURT_HP:int = 900;
      
      private const DEAD_HP:int = 0;
      
      public function FlyingCarpetMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FlyingCarpetMouseMoveIntruder) as FlyingCarpetMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyingCarpetMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_isFlying = true;
         this.a_1496 = 12;
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.5 + 18;
         a_1465 = 3;
         this.m_iSummonUpMoveIntruderSequence = 1;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_isFlying)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_isFlying)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
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
            play();
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
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         a_4212();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var n:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stRindMouseMoveIntruder:RindMouseMoveIntruder = null;
         if(!a_1460)
         {
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            n = 0;
            while(++n <= 50)
            {
               m_iXGridNo = 4 + this.m_stRandomSeed.nextInt(3);
               m_iYGridNo = 3 + this.m_stRandomSeed.nextInt(4);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(!(this.a_1598 == null || this.a_1598 != null && this.a_1598.m_isNeedTray || m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomYGridNo == m_iYGridNo))
               {
                  break;
               }
            }
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomYGridNo = m_iYGridNo;
            x = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5);
            y = -60;
            this.m_numTargetYPos = iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - height);
            a_1460 = true;
            this.m_isFlying = true;
            ChangeFieldGrid(this.a_1598);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(this.a_1598.m_iYGridNo));
         }
         if(this.m_numTargetYPos - y > 5 && this.m_isFlying)
         {
            y += 5;
            iXGridNo = int(x / a_3491.a_1080);
            iYGridNo = int((y + 71) / a_3491.a_1081);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
         }
         else if(y != this.m_numTargetYPos && this.m_isFlying == true)
         {
            ChangeFieldGrid(this.a_1598);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(this.a_1598.m_iYGridNo));
            y = this.m_numTargetYPos + 25;
            this.m_isFlying = false;
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            stRindMouseMoveIntruder = RindMouseMoveIntruder.a_3926() as RindMouseMoveIntruder;
            if(stRindMouseMoveIntruder)
            {
               stRindMouseMoveIntruder.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo,-1);
               stRindMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
               stRindMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               stRindMouseMoveIntruder.x = a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stRindMouseMoveIntruder.width);
               stRindMouseMoveIntruder.y = a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - stRindMouseMoveIntruder.height);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stRindMouseMoveIntruder,m_stCurrentFieldGrid);
               stRindMouseMoveIntruder.y -= 78;
               parent.addChild(this);
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 23)
            {
               a_1465 = 0;
            }
         }
         if(!this.m_isFlying && a_1465 == 0)
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
   }
}

