package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.WaterLime
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SmallWaterLimeMouseMoveIntruder extends a_4206
   {
      
      public var FULL_HP:int = 20000;
      
      private var HURT_HP:int = 500;
      
      private var DEAD_HP:int = 0;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iAppearedTime:int;
      
      protected var m_isBorning:Boolean = false;
      
      protected var m_MoveState:int;
      
      protected var a_1581:int;
      
      protected var m_numTargetYPos:Number;
      
      protected var m_numTargetXPos:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      private var m_iYGridNo:int;
      
      private var m_iXGridNo:int;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var a_1598:a_3491;
      
      private var m_RandomIndex:int;
      
      public function SmallWaterLimeMouseMoveIntruder()
      {
         super();
         a_1467 = 36;
         a_1279 = -47;
         m_iYDisplayCenterPos = -32;
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SmallWaterLimeMouseMoveIntruder) as SmallWaterLimeMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallWaterLimeMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = this.m_fOrginSpeed = a_3491.a_1080 / (4 * 20);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         this.m_isBorning = false;
         this.m_MoveState = -1;
         this.a_1581 = -1;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && iEffectType != b_182.a_435)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(!this.m_isBorning)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_isBorning)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
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
         var iXGridNo:int = 0;
         var m_RandomIndex:int = 0;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.m_isBorning = true;
            a_1275 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(null != m_stCurrentFieldGrid)
         {
            if(this.m_isBorning && a_1273 == 8)
            {
               this.m_isBorning = false;
               this.m_MoveState = 1;
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
               this.m_numTargetXPos = this.getPosXByXGridNo(m_stCurrentFieldGrid.m_iXGridNo - 2);
               this.m_numTargetYPos = this.getPosYByYGridNo(m_stCurrentFieldGrid.m_iYGridNo);
               this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
            }
         }
         if(this.a_1581 > 0 && Boolean(m_stCurrentFieldGrid))
         {
            this.MoveMySelf();
            iXGridNo = this.getXGridNoByPosX();
            if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               a_3940();
               return false;
            }
            --this.a_1581;
            if(this.a_1581 <= 0)
            {
               y = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
               x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
               if(this.m_MoveState == 1)
               {
                  do
                  {
                     m_RandomIndex = this.m_stRandomSeed.nextInt(10) + 1;
                     this.m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
                     this.m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + (m_RandomIndex > 5 ? -1 : 1);
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,this.m_iYGridNo);
                  }
                  while(this.a_1598 == null);
                  this.m_numTargetYPos = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
                  this.m_numTargetXPos = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
                  this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
                  this.m_MoveState = m_RandomIndex > 5 ? 2 : 3;
               }
               else
               {
                  this.m_MoveState = 1;
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
                  this.m_numTargetXPos = this.getPosXByXGridNo(m_stCurrentFieldGrid.m_iXGridNo - 2);
                  this.m_numTargetYPos = this.getPosYByYGridNo(m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
               }
            }
         }
         return true;
      }
      
      protected function MoveMySelf() : void
      {
         this.x = Math.round(10000 * this.x + 10000 * this.m_fMoveSpeedX) * 0.0001;
         this.y = Math.round(10000 * this.y + 10000 * this.m_fMoveSpeedY) * 0.0001;
         var iXGridNo:int = this.getXGridNoByPosX();
         var iYGridNo:int = this.getYGridNoByPosY();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = this.ChangeToFieldGrid(stNextFieldGrid);
         if(bIsCanChangeToFieldGrid)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
      }
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number = -0.1234) : int
      {
         if(-0.1234 == fMoveSpeed)
         {
            fMoveSpeed = Math.abs(a_1350);
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
      
      protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         var fPosX:Number = a_3491.a_1080 * iXGridNo;
         return fPosX + a_3491.a_1080 * 0.5;
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
      
      protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         var fPosY:Number = a_3491.a_1081 * iYGridNo;
         return fPosY + a_3491.a_1081 * 0.5;
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
   }
}

