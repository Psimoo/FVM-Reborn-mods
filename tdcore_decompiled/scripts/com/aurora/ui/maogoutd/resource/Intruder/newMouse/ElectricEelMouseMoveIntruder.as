package com.aurora.ui.maogoutd.resource.Intruder.newMouse
{
   import a_4718.b_181;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ElectricEelMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 800;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      protected var m_iThrowBoomTime:int;
      
      protected var m_isGoBack:Boolean;
      
      protected var a_1304:uint = b_183.enm_ElectricEelMouseBombShot;
      
      protected var a_1311:int = 400;
      
      protected var a_1312:int = 15;
      
      protected var m_isCarrying:Boolean = true;
      
      protected var a_1496:int;
      
      public function ElectricEelMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ElectricEelMouseMoveIntruder) as ElectricEelMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricEelMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.5;
         a_1464 = true;
         this.m_iThrowBoomTime = 0;
         this.m_isGoBack = false;
         a_1465 = 3;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 4 && a_1275 != 5)
         {
            if(this.m_isCarrying)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         else if(a_1339 <= MAX_INJURED_LIFE)
         {
            if(this.m_isCarrying)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= MAX_LIFE)
         {
            if(this.m_isCarrying)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= 0)
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
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= 0)
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
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
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
            this.m_iThrowBoomTime = 0;
            a_1464 = false;
            if(this.m_iThrowBoomTime == 0)
            {
               this.m_isGoBack = true;
               numShotXpos = this.a_3955();
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = ElectricEelMouseBombShot.a_4344();
               if(null != stLastWaitShot)
               {
                  shotPower = HasTag(40009) ? 0 : this.a_1311;
                  stLastWaitShot.a_1797(0,this.a_1312,shotPower,x + numShotXpos,y + this.a_3956(),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitShot);
               }
               this.m_isCarrying = false;
            }
            this.ResetMovieStatus();
         }
         if(this.m_iThrowBoomTime > 0)
         {
            --this.m_iThrowBoomTime;
            if(16 == this.m_iThrowBoomTime)
            {
               this.ResetMovieStatus();
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

