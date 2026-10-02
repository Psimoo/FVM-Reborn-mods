package com.aurora.ui.maogoutd.resource.defender.HorseYear.thunder
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ThunderboltHorseSecondShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const BURN_TOTAL_TIME:int = 24;
      
      private static const BURN_HIT_COUNT:int = 10;
      
      private static var m_lastVisibleShot:a_4348 = null;
      
      private var m_iBurnedTimes:int = 0;
      
      private var m_numBurnProgress:Number = 0;
      
      private var m_numBurnStep:Number = 0;
      
      private var m_iStartAttckTime:int;
      
      private var m_iCurrentTime:int;
      
      private var m_stTargetMoveIntruder:a_4206;
      
      private var stTargetiXGridNo:int;
      
      private var stTargetiYGridNo:int;
      
      protected var m_targetDead:Boolean = false;
      
      protected var m_deadTargetX:Number;
      
      protected var m_deadTargetY:Number;
      
      private var m_iLoopFrame:int;
      
      private var m_iDisappearFrame:int;
      
      private var m_nextBurnFrame:int;
      
      private var m_BurnIntervalTimeNum:int;
      
      public function ThunderboltHorseSecondShot()
      {
         super();
         a_1573 = 2;
         a_1588 = true;
         a_1587 = 1;
         m_iYDisplayCenterPos = -15;
         a_1279 = -25;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1275 = 0;
         a_1587 = 1;
         this.m_iLoopFrame = 2;
         this.m_iDisappearFrame = 3;
         this.m_BurnIntervalTimeNum = int(BURN_TOTAL_TIME / BURN_HIT_COUNT);
      }
      
      public static function a_4344() : ThunderboltHorseSecondShot
      {
         var stShot:ThunderboltHorseSecondShot = ms_arrShot.pop();
         if(!stShot)
         {
            stShot = new ThunderboltHorseSecondShot();
         }
         return stShot;
      }
      
      public function get stTargetMoveIntruder() : a_4206
      {
         return this.m_stTargetMoveIntruder;
      }
      
      public function set stTargetMoveIntruder(value:a_4206) : void
      {
         this.m_stTargetMoveIntruder = value;
         this.m_targetDead = false;
         if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
         {
            this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
         }
      }
      
      override protected function getBindMovie() : Class
      {
         return ThunderboltHorseSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1275 = 0;
         a_1588 = true;
         a_1577 = false;
         m_isPenetrate = true;
         m_isChangeYGridNo = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         this.m_iCurrentTime = iCurrentTime;
         if(m_isHited)
         {
            nextFrame();
            if(this.m_iStartAttckTime < 0)
            {
               if(a_1278 != null)
               {
                  this.ChangeToFrameLable(this.m_iLoopFrame);
                  this.m_iStartAttckTime = this.m_iCurrentTime;
                  this.m_iBurnedTimes = 0;
                  this.m_nextBurnFrame = this.m_iStartAttckTime + this.m_BurnIntervalTimeNum + 2;
               }
               return;
            }
            if(this.m_iCurrentTime - this.m_iStartAttckTime < BURN_TOTAL_TIME)
            {
               this.BurnDamage();
            }
            else if(this.m_iCurrentTime - this.m_iStartAttckTime == BURN_TOTAL_TIME)
            {
               this.ChangeToFrameLable(this.m_iDisappearFrame);
            }
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         if(m_isHited)
         {
            return;
         }
         if(a_1578)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var iModNum:int = 0;
         var far:a_4206 = null;
         if(this.isLinkInvalid())
         {
            far = ThunderboltHorseDefence.GetTheFarthestIntruder(a_1584,x);
            if(far)
            {
               this.stTargetMoveIntruder = far;
            }
            else
            {
               this.m_deadTargetX = (this.stTargetiXGridNo + 0.5) * a_3491.a_1080;
               this.m_deadTargetY = (this.stTargetiYGridNo + 0.5) * a_3491.a_1081;
               this.m_targetDead = true;
            }
         }
         else
         {
            this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
         }
         if(!this.m_stTargetMoveIntruder)
         {
            this.a_3940();
            return false;
         }
         var numXDistance:Number = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x - x;
         var numYDistance:Number = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height / 2 - y;
         var numMaxDistance:Number = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
         if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
         {
            this.a_3940();
            return false;
         }
         var iMaxConstTime:int = numMaxDistance / 15;
         if(iMaxConstTime < 1)
         {
            iMaxConstTime = 1;
         }
         var numXSpeed:Number = numXDistance / iMaxConstTime;
         var numYSpeed:Number = numYDistance / iMaxConstTime;
         if(m_numXSpeed != numXSpeed)
         {
            iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
            m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
         }
         if(m_numYSpeed != numYSpeed)
         {
            iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
            m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
         }
         y += m_numYSpeed;
         return true;
      }
      
      private function isLinkInvalid() : Boolean
      {
         return !this.m_stTargetMoveIntruder || this.m_stTargetMoveIntruder.iLifeValue <= 0 || !this.m_stTargetMoveIntruder.m_stCurrentFieldGrid || !this.m_stTargetMoveIntruder.visible;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x <= -20 || x >= BattleFieldView.a_1013 + 20)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(m_iCanHitGostMouse && BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
         {
            return true;
         }
         if(stMoveIntruder.isCannotSeeByFighter || stMoveIntruder.iLifeValue <= 0 || !stMoveIntruder.m_stCurrentFieldGrid)
         {
            return false;
         }
         if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 3)
         {
            return true;
         }
         return false;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         if(this.m_stTargetMoveIntruder == stMoveIntruder)
         {
            return;
         }
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         var finalHurt:Number = GetFinalDamage() * 10;
         stMoveIntruder.a_3969(finalHurt);
         if(stMoveIntruder.m_stCurrentFieldGrid == null || stMoveIntruder.iLifeValue <= 0 || stMoveIntruder.parent == null)
         {
            return;
         }
         if(a_1573 > 0)
         {
            stMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var dx:Number = NaN;
         var dy:Number = NaN;
         super.a_4351();
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_isChangeYGridNo ? int(y / a_3491.a_1081) : m_iYGridNo;
         if(!this.isInHitRadius(iXGridNo,iYGridNo))
         {
            return;
         }
         if(Boolean(this.m_stTargetMoveIntruder) && hitTestObject(this.m_stTargetMoveIntruder))
         {
            if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
            {
               this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
               this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
               if(Math.abs(this.stTargetiXGridNo - iXGridNo) > 2)
               {
                  this.stTargetiXGridNo = iXGridNo + (m_numXSpeed > 0 ? 1 : -1);
               }
            }
            this.ChangeToAttackState();
            return;
         }
         if(this.m_targetDead)
         {
            dx = this.m_deadTargetX - x;
            dy = this.m_deadTargetY - y;
            if(Math.abs(dx) < 30 && Math.abs(dy) < 30)
            {
               this.ChangeToAttackState();
            }
         }
      }
      
      private function isInHitRadius(iXGridNo:int, iYGridNo:int) : Boolean
      {
         if(!this.m_stTargetMoveIntruder)
         {
            return false;
         }
         if(this.stTargetiXGridNo == iXGridNo && this.stTargetiYGridNo == iYGridNo)
         {
            return true;
         }
         var dx:Number = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x - x;
         var dy:Number = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height * 0.5 - y;
         return dx * dx + dy * dy <= 400;
      }
      
      private function ChangeToAttackState() : void
      {
         m_isHited = true;
         a_1588 = false;
         this.ChangeToFrameLable(a_1587);
         this.m_iStartAttckTime = -1;
         a_1583.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1584);
         this.y = (this.stTargetiYGridNo + 0.5) * a_3491.a_1081;
         if(!a_1283)
         {
            this.x = (this.stTargetiXGridNo + 0.5) * a_3491.a_1080;
         }
         else
         {
            this.x = (BattleFieldView.a_1011 - 1 - this.stTargetiXGridNo + 0.5) * a_3491.a_1080;
         }
         if(m_lastVisibleShot)
         {
            m_lastVisibleShot.visible = false;
         }
         m_lastVisibleShot = this;
         this.visible = true;
      }
      
      private function ChangeToFrameLable(iFrameLable:int) : void
      {
         if(a_1275 != iFrameLable)
         {
            a_1275 = iFrameLable;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      private function BurnDamage() : void
      {
         if(this.m_iBurnedTimes < BURN_HIT_COUNT && this.m_iCurrentTime >= this.m_nextBurnFrame)
         {
            ++this.m_iBurnedTimes;
            this.DoBurnDamageOnce();
            this.m_nextBurnFrame += this.m_BurnIntervalTimeNum;
         }
      }
      
      private function DoBurnDamageOnce() : void
      {
         var x:int = 0;
         var arr:Array = null;
         var intr:a_4206 = null;
         if(!a_1584)
         {
            return;
         }
         var xStart:int = Math.max(this.stTargetiXGridNo - 2,0);
         var xEnd:int = Math.min(this.stTargetiXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(this.stTargetiYGridNo - 2,0);
         var yEnd:int = Math.min(this.stTargetiYGridNo + 2,BattleFieldView.a_1012 - 1);
         var grids:Array = a_1584.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var y:int = yStart; y <= yEnd; y++)
         {
            for(x = xStart; x <= xEnd; x++)
            {
               arr = grids[y][x].a_1511.slice();
               for each(intr in arr)
               {
                  if(Boolean(intr) && !intr.isCannotSeeByFighter)
                  {
                     a_4352(intr);
                     if(intr.iLifeValue <= 0 && Boolean(intr.m_stCurrentFieldGrid))
                     {
                        intr.a_4210();
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_lastVisibleShot == this)
         {
            m_lastVisibleShot = null;
         }
         trace("m_iBurnedTimes" + this.m_iBurnedTimes);
         super.a_3940();
         if(ms_arrShot.indexOf(this) == -1)
         {
            ms_arrShot.push(this);
         }
         m_isHited = false;
         return true;
      }
   }
}

