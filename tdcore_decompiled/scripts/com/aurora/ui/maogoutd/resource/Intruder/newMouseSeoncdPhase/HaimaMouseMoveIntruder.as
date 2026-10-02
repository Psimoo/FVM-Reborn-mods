package com.aurora.ui.maogoutd.resource.Intruder.newMouseSeoncdPhase
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class HaimaMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3600;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private var a_1547:Boolean;
      
      private var m_iJumpPath:Array;
      
      private var jumpType:int = 0;
      
      private var m_isWaitting:Boolean;
      
      private var m_isWaiteTime:int;
      
      private var targetFieldGrid:a_3491 = null;
      
      public function HaimaMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HaimaMouseMoveIntruder) as HaimaMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HaimaMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1464 = true;
         this.a_1547 = false;
         this.m_isWaitting = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1547 = false;
         this.m_isWaitting = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(this.a_1547)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isWaitting)
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
            if(this.a_1547)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(this.m_isWaitting)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 8)
         {
            a_1275 = 8;
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
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iPst:Array = null;
         if(this.m_isWaitting)
         {
            --this.m_isWaiteTime;
            if(this.m_isWaiteTime == 0)
            {
               this.m_isWaitting = false;
               this.a_1547 = true;
               this.ResetMovieStatus();
            }
         }
         else if(this.a_1547)
         {
            if(a_1339 > MAX_INJURED_LIFE && a_1273 == (a_1276[6] as FrameLabel).frame - 1)
            {
               this.a_4200(iCurrentTime);
               this.a_1547 = false;
               this.ResetMovieStatus();
            }
            else if(a_1339 > 0 && a_1273 == (a_1276[8] as FrameLabel).frame - 1)
            {
               this.a_4200(iCurrentTime);
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
         else
         {
            this.jumpHandle();
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function jumpHandle() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var iXGridNo1:int = 0;
         var stFieldGridAhead:a_3491 = null;
         var stFieldGridTop:a_3491 = null;
         var stFieldGridBottom:a_3491 = null;
         if(!this.a_1547)
         {
            if(m_stCurrentFieldGrid == null)
            {
               return;
            }
            iXGridNo = m_stCurrentFieldGrid.m_iXGridNo + 1;
            iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            iXGridNo1 = int(x / a_3491.a_1080);
            stFieldGridAhead = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo - 1,iYGridNo);
            stFieldGridTop = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo - 1);
            stFieldGridBottom = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo + 1);
            if(Boolean(stFieldGridAhead) && stFieldGridAhead.a_3492())
            {
               this.jumpType = 1;
               this.m_isWaitting = true;
               this.m_isWaiteTime = 3 * 20;
               this.ResetMovieStatus();
               this.buildPath((iXGridNo - 1) * a_3491.a_1080,1);
               this.targetFieldGrid = stFieldGridAhead;
               m_stCurrentFieldGrid = this.targetFieldGrid;
            }
            else if(Boolean(stFieldGridTop) && stFieldGridTop.a_3492())
            {
               this.jumpType = 2;
               this.m_isWaitting = true;
               this.m_isWaiteTime = 3 * 20;
               this.ResetMovieStatus();
               this.buildPath((iYGridNo - 1) * a_3491.a_1081 - 56,2);
               this.targetFieldGrid = stFieldGridTop;
               m_stCurrentFieldGrid = this.targetFieldGrid;
            }
            else if(Boolean(stFieldGridBottom) && stFieldGridBottom.a_3492())
            {
               this.jumpType = 3;
               this.m_isWaitting = true;
               this.m_isWaiteTime = 3 * 20;
               this.ResetMovieStatus();
               this.buildPath((iYGridNo + 1) * a_3491.a_1081 - 30,3);
               this.targetFieldGrid = stFieldGridBottom;
               m_stCurrentFieldGrid = this.targetFieldGrid;
            }
         }
      }
      
      private function buildPath(iX:Number, iTpye:int) : void
      {
         var speedX:Number = NaN;
         var frames:int = (a_1276[6] as FrameLabel).frame - (a_1276[5] as FrameLabel).frame - 1;
         var speedY:Number = 0;
         switch(iTpye)
         {
            case 1:
               speedY = 0;
               speedX = -Math.abs(iX - x) / frames;
               break;
            case 2:
               speedY = -Math.abs(iX - y) / frames;
               speedX = 0;
               break;
            case 3:
               speedY = Math.abs(iX - y) / frames;
               speedX = 0;
         }
         this.m_iJumpPath = new Array();
         var i:int = 0;
         var len:int = frames;
         while(i < len)
         {
            this.m_iJumpPath.push([x + speedX * i,y + speedY * i]);
            i++;
         }
      }
      
      private function a_4200(iCurrentTime:int) : void
      {
         if(this.targetFieldGrid == null)
         {
            return;
         }
         if(null != this.targetFieldGrid.m_stProtector)
         {
            this.targetFieldGrid.m_stProtector.m_iDieType = 1;
            this.targetFieldGrid.m_stProtector.a_3969(900);
         }
         if(null != this.targetFieldGrid.m_stAttackFighter)
         {
            this.targetFieldGrid.m_stAttackFighter.m_iDieType = 1;
            this.targetFieldGrid.m_stAttackFighter.a_3969(900);
         }
         if(null != this.targetFieldGrid.m_stBoomDefense)
         {
            if(!this.targetFieldGrid.m_stBoomDefense.isCanBeEaten || this.targetFieldGrid.m_stBoomDefense.isSleeping)
            {
               this.targetFieldGrid.m_stBoomDefense.m_iDieType = 1;
               this.targetFieldGrid.m_stBoomDefense.a_3969(900);
            }
         }
         if(null != this.targetFieldGrid.m_stFlowerDefense)
         {
            this.targetFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            this.targetFieldGrid.m_stFlowerDefense.a_3969(900);
         }
         if(null != this.targetFieldGrid.m_stBaseAuxiliaryFighter)
         {
            this.targetFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            this.targetFieldGrid.m_stBaseAuxiliaryFighter.a_3969(900);
         }
         this.targetFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != this.targetFieldGrid.m_stTrayDefense)
         {
            this.targetFieldGrid.m_stTrayDefense.m_iDieType = 1;
            this.targetFieldGrid.m_stTrayDefense.a_3969(900);
         }
      }
   }
}

