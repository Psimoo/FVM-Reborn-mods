package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.utils.Timer;
   
   public class ShadowShuttleEffect extends a_4206
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iBegin:int;
      
      private var m_iEnd:int;
      
      private var m_stMap:SeasonBaseGameMap;
      
      private var m_lBallPath:Array;
      
      private var m_iBallType:int = 1;
      
      private var m_iState:int = 0;
      
      private var m_iTick:int = 0;
      
      private var m_bTriggerSkill:Boolean = false;
      
      private var m_iSeekIndex:int = 0;
      
      private var m_stRay:LaserEffect;
      
      private var m_iRayIndex:int = 0;
      
      private var m_iMoveState:int = 0;
      
      protected var m_fMoveSpeedX:Number = 0;
      
      protected var m_fMoveSpeedY:Number = 0;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      protected var m_iInitPosY:int = -1;
      
      protected var m_iInitPosX:int = -1;
      
      public function ShadowShuttleEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : ShadowShuttleEffect
      {
         return PoolManager.getInstance().CheckOutOne(ShadowShuttleEffect) as ShadowShuttleEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShadowShuttleEffectMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1465 = 1;
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 999999;
         a_1279 = -10;
         m_iYDisplayCenterPos = -75;
         a_1272 = 0;
         SetCannotSeeByFighter(true);
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         return true;
      }
      
      public function InitData(iBegin:int, iEnd:int, map:SeasonBaseGameMap, lBallPath:Array, iBallType:int, rayIndex:int) : void
      {
         this.m_iRayIndex = rayIndex;
         this.m_iBegin = iBegin;
         this.m_iEnd = iEnd;
         this.m_stMap = map;
         this.m_iBallType = iBallType;
         this.m_iTick = 0;
         this.m_iState = 0;
         this.m_iSeekIndex = 0;
         this.m_bTriggerSkill = false;
         this.m_lBallPath = lBallPath;
         this.m_fMoveSpeedX = 0;
         this.m_fMoveSpeedY = 0;
         this.m_fOrginSpeed = 0;
         this.a_1581 = 0;
         this.m_iInitPosY = -1;
         this.m_iInitPosX = -1;
         this.m_iMoveState = 0;
         this.SetFrameIndex2(0,1);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetFrameIndex(7);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         return true;
      }
      
      private function Move2Next() : void
      {
         this.SetFrameIndex(1);
         this.Move2Target2(this.m_lBallPath[this.m_iSeekIndex][0],this.m_lBallPath[this.m_iSeekIndex][1],20 * 4);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var ii:int = 0;
         var state:int = 0;
         if(x >= 700 || a_1273 == 144)
         {
            a_3940();
            return true;
         }
         ++this.m_iTick;
         if(this.m_iTick == 40)
         {
            if(this.m_iBallType == 4)
            {
               this.SetFrameIndex(1);
               this.Move2Target3(this.m_lBallPath[this.m_iSeekIndex][0],this.m_lBallPath[this.m_iSeekIndex][1],50);
            }
            else
            {
               this.Move2Next();
            }
         }
         this.x += this.m_fMoveSpeedX;
         this.y += this.m_fMoveSpeedY;
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            if(this.a_1581 <= 0)
            {
               this.m_fMoveSpeedX = 0;
               this.m_fMoveSpeedY = 0;
               if(this.m_iMoveState == 0)
               {
                  if(this.m_iBallType == 4)
                  {
                     this.a_1581 = 20;
                  }
                  else
                  {
                     this.a_1581 = 40;
                  }
                  this.m_iMoveState = 1;
               }
               else
               {
                  if(this.m_iBallType != 1)
                  {
                     if(this.m_iBallType == 2)
                     {
                        this.SetFrameIndex2(2,1);
                        this.m_bTriggerSkill = false;
                     }
                     else if(this.m_iBallType == 3)
                     {
                        this.m_bTriggerSkill = false;
                        this.SetFrameIndex2(3,5);
                     }
                     else if(this.m_iBallType == 4)
                     {
                        this.m_bTriggerSkill = false;
                        if(this.m_iBegin + this.m_iSeekIndex == this.m_iEnd - 1)
                        {
                           this.SetFrameIndex(5);
                        }
                        else
                        {
                           this.SetFrameIndex(3);
                        }
                     }
                  }
                  ++this.m_iSeekIndex;
               }
            }
         }
         if((a_1273 == 73 || a_1273 == 105) && this.m_bTriggerSkill == false && this.m_iBallType == 4)
         {
            this.m_bTriggerSkill = true;
            ii = this.m_iBegin + this.m_iSeekIndex - 1;
            state = 1;
            if(ii == this.m_iBegin)
            {
               state = 0;
            }
            else if(ii == this.m_iEnd - 1)
            {
               state = 2;
            }
            this.m_stRay = this.m_stMap.ActiveBall(this.m_iBegin + this.m_iSeekIndex - 1,this,state,this.m_stRay,this.m_iRayIndex);
         }
         else if(a_1273 == 104 && this.m_bTriggerSkill == false && this.m_iBallType == 3)
         {
            this.m_bTriggerSkill = true;
            this.m_stMap.BoomBall(this.m_iBegin + this.m_iSeekIndex - 1,this.m_iRayIndex);
         }
         else if(a_1273 == 44 && this.m_bTriggerSkill == false)
         {
            this.m_bTriggerSkill = true;
            this.m_stMap.AbsorbBall(this.m_iBegin + this.m_iSeekIndex - 1,this.m_iRayIndex);
         }
         if(this.m_iBallType == 4)
         {
            if(a_1273 == 73)
            {
               this.SetFrameIndex(1);
               this.Move2Target3(this.m_lBallPath[this.m_iSeekIndex][0],this.m_lBallPath[this.m_iSeekIndex][1],50);
               this.SetFrameIndex(4);
            }
            else if(a_1273 == 105)
            {
               this.SetFrameIndex(7);
            }
         }
         if(a_1273 == 62 || a_1273 == 105)
         {
            if(this.m_iBegin + this.m_iSeekIndex >= this.m_iEnd)
            {
               this.GoLeave();
            }
            else
            {
               this.Move2Next();
            }
         }
         trace("-----[m_iCurrentFrame]-----:" + a_1273);
         return true;
      }
      
      private function GoLeave() : void
      {
         if(x >= 60 * 6)
         {
            this.SetFrameIndex(1);
            this.Move2Target(15,this.m_lBallPath[this.m_iSeekIndex - 1][1],a_3491.a_1080 / 30);
         }
         else
         {
            this.SetFrameIndex(7);
         }
      }
      
      private function Move2Target(iNoX:Number, iNoY:Number, speed:Number) : void
      {
         var m_numTargetYPos:Number = (iNoY + 0.5) * a_3491.a_1081;
         var m_numTargetXPos:Number = (iNoX + 0.5) * a_3491.a_1080;
         this.a_1581 = this.setMoveToPosition(m_numTargetXPos,m_numTargetYPos,speed);
      }
      
      private function Move2Target2(iNoX:Number, iNoY:Number, duration:int) : void
      {
         var m_numTargetYPos:Number = (iNoY + 0.5) * a_3491.a_1081;
         var m_numTargetXPos:Number = (iNoX + 0.5) * a_3491.a_1080;
         this.a_1581 = this.setMoveToPosition2(m_numTargetXPos,m_numTargetYPos,duration);
      }
      
      private function Move2Target3(iNoX:Number, iNoY:Number, duration:int) : void
      {
         var speed:Number = NaN;
         var m_numTargetYPos:Number = (iNoY + 0.5) * a_3491.a_1081;
         var m_numTargetXPos:Number = (iNoX + 0.5) * a_3491.a_1080;
         var fDistanceX:Number = m_numTargetXPos - this.x;
         var fDistanceY:Number = m_numTargetYPos - this.y;
         var dis:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         if(dis <= 0.1)
         {
            this.m_fMoveSpeedY = 0;
            this.m_fMoveSpeedX = 0;
            this.a_1581 = 1;
         }
         else
         {
            speed = dis / duration;
            if(speed < 6)
            {
               speed = 6;
            }
            if(speed > 10)
            {
               speed = 10;
            }
            duration = dis / speed;
            this.m_fMoveSpeedY = fDistanceY / duration;
            this.m_fMoveSpeedX = fDistanceX / duration;
            this.a_1581 = duration;
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      public function IsBOSS(stMoveIntruder:a_4206) : Boolean
      {
         return stMoveIntruder.IsBossIntruder;
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetFrameIndex2(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
         a_3419();
      }
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number = -0.1234) : int
      {
         if(-0.1234 == fMoveSpeed)
         {
            fMoveSpeed = Math.abs(this.m_fOrginSpeed);
         }
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         return iMoveTick;
      }
      
      protected function setMoveToPosition2(fPosX:Number, fPosY:Number, duration:int) : int
      {
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var dis:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         if(dis <= 0.1)
         {
            this.m_fMoveSpeedY = 0;
            this.m_fMoveSpeedX = 0;
            return 1;
         }
         var speed:Number = dis / duration;
         if(speed < 4)
         {
            speed = 4;
         }
         if(speed > 6)
         {
            speed = 6;
         }
         duration = dis / speed;
         this.m_fMoveSpeedY = fDistanceY / duration;
         this.m_fMoveSpeedX = fDistanceX / duration;
         return duration;
      }
      
      protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080;
         return iXGridNo - 10000;
      }
      
      protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY) / a_3491.a_1081;
         return iYGridNo - 10000;
      }
      
      protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         trace("改变格子::" + stNextFieldGrid.m_iXGridNo + "--" + stNextFieldGrid.m_iYGridNo);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(stNextFieldGrid.m_iYGridNo));
         return true;
      }
   }
}

