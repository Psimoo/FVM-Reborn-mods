package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class FlyGranuleMouseMoveIntruder extends a_4206
   {
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var a_1598:a_3491;
      
      protected var stNextFieldGrid:a_3491;
      
      protected var m_numTargetYPos:Number;
      
      protected var m_numTargetXPos:Number;
      
      private var m_iMoveDirection:int = 1;
      
      private var stLastFieldGrid:a_3491;
      
      private var FULL_HP:int = 1200;
      
      private var HURT_HP:int = 500;
      
      private const DEAD_HP:int = 0;
      
      private var m_iYGridNo:int;
      
      private var m_iXGridNo:int;
      
      protected var m_iRestTick:int;
      
      private var m_MouseState:int;
      
      private var m_iWaiteDownTick:int;
      
      private var m_iWaiteMoveTick:int;
      
      private var m_OutArray:Array = new Array([-2,0],[-1,2],[1,2],[2,0],[1,-2],[-1,-2]);
      
      public var m_iCallBack:int = 0;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      protected var m_iInitPosY:int = -1;
      
      protected var m_iInitPosX:int = -1;
      
      private var m_fCacheSpeed:Number = 0;
      
      private var m_bBossCreate:Boolean;
      
      public function FlyGranuleMouseMoveIntruder()
      {
         a_1279 = -42.5;
         m_iYDisplayCenterPos = -76;
         a_1464 = true;
         a_1463 = true;
         super();
         a_1481 = false;
         BoomIsReduceLife = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FlyGranuleMouseMoveIntruder) as FlyGranuleMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyGranuleMouseMoveIntruderMovie;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.m_MouseState != 3)
         {
            this.a_3969(BOOM_INJURE_LIFE);
         }
         else
         {
            a_1339 = 0;
         }
         ShowBoomDieEffect();
         if(a_1339 <= 0)
         {
            this.a_3940();
         }
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         visible = false;
         this.m_MouseState = -1;
         m_bPostEnemy = false;
         a_1339 = this.FULL_HP;
         this.m_iMoveDirection = 0;
         a_1465 = 3;
         m_iIntruderState = 1;
         this.m_iRestTick = -1;
         m_SecondDieFrame = 116;
         a_1462 = true;
         this.m_iWaiteMoveTick = this.m_iWaiteDownTick = -1;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.m_iCallBack < 4)
         {
            this.m_iCallBack = 4;
         }
         super.a_3940();
         this.a_1598 == null;
         this.m_iInitPosY = -1;
         this.m_iInitPosX = -1;
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_MouseState == 1)
            {
               if(a_1275 != 0 + this.m_iMoveDirection)
               {
                  a_1275 = 0 + this.m_iMoveDirection;
                  gotoAndStop((a_1276[0 + this.m_iMoveDirection] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 2)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 3)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 4)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 5)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_MouseState == 1)
            {
               if(a_1275 != 6 + this.m_iMoveDirection)
               {
                  a_1275 = 6 + this.m_iMoveDirection;
                  gotoAndStop((a_1276[6 + this.m_iMoveDirection] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 2)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 3)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 4)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[11] as FrameLabel).frame);
               }
            }
            else if(this.m_MouseState == 5)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(this.m_MouseState == 3)
            {
               if(a_1275 != 13)
               {
                  a_1275 = 13;
                  gotoAndStop((a_1276[13] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 12)
            {
               a_1275 = 12;
               gotoAndStop((a_1276[12] as FrameLabel).frame);
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
         if(this.m_MouseState == 3)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_MouseState == 3)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      public function CallBack() : void
      {
         if(this.m_iCallBack == 0)
         {
            this.m_iCallBack = 1;
         }
      }
      
      private function CheckBack() : Boolean
      {
         if(this.m_iCallBack == 2 && this.a_1581 <= 0)
         {
            this.m_iCallBack = 5;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      private function GetRandomSeed() : RandomSeed
      {
         if(this.m_bBossCreate == true)
         {
            return BattleFieldView.m_stRandomSeed;
         }
         return this.m_stRandomSeed;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var enterRoom:Object = null;
         var m_iXGridNo1:int = 0;
         var m_iYGridNo1:int = 0;
         var m_iSpeed:Number = NaN;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var m_RandomIndex:int = 0;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            this.m_iCallBack = 0;
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            m_iXGridNo1 = 0;
            m_iYGridNo1 = 0;
            m_iSpeed = -0.1234;
            if(this.m_iInitPosX == -1 && this.m_iInitPosY == -1)
            {
               if(this.a_1598 == null)
               {
                  do
                  {
                     this.m_iXGridNo = this.GetRandomSeed().nextInt(5) + 2;
                     this.m_iYGridNo = this.GetRandomSeed().nextInt(4) + 1;
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,this.m_iYGridNo);
                  }
                  while(this.a_1598 == null || m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomXGridNo == this.m_iXGridNo);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomXGridNo = this.m_iXGridNo;
               }
               x = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5);
               y = -60;
               m_iXGridNo1 = this.a_1598.m_iXGridNo;
               m_iYGridNo1 = 0;
            }
            else if(this.m_iInitPosX != -1 && this.m_iInitPosY != -1)
            {
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iInitPosX,this.m_iInitPosY);
               m_iXGridNo1 = 4;
               m_iYGridNo1 = 0;
               x = a_3491.a_1080 * (m_iXGridNo1 + 0.5);
               y = a_3491.a_1081 * (m_iYGridNo1 + 0.5) + 40;
               m_iSpeed = a_3491.a_1080 / 20;
            }
            else if(this.m_iInitPosX != -1)
            {
               if(this.a_1598 == null)
               {
                  do
                  {
                     this.m_iXGridNo = this.GetRandomSeed().nextInt(5) + 2;
                     this.m_iYGridNo = this.GetRandomSeed().nextInt(4) + 1;
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,this.m_iYGridNo);
                  }
                  while(this.a_1598 == null || m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomXGridNo == this.m_iYGridNo);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomXGridNo = this.m_iYGridNo;
               }
               x = this.m_iInitPosX;
               y = a_3491.a_1081 * (this.a_1598.m_iYGridNo + 0.5);
               m_iXGridNo1 = this.m_iInitPosX < 0 ? 0 : 8;
               m_iYGridNo1 = this.a_1598.m_iYGridNo;
            }
            else if(this.m_iInitPosY != -1)
            {
               if(this.a_1598 == null)
               {
                  do
                  {
                     this.m_iXGridNo = this.GetRandomSeed().nextInt(5) + 2;
                     this.m_iYGridNo = this.GetRandomSeed().nextInt(4) + 1;
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,this.m_iYGridNo);
                  }
                  while(this.a_1598 == null || m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomXGridNo == this.m_iXGridNo);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomXGridNo = this.m_iXGridNo;
               }
               x = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5);
               y = this.m_iInitPosY;
               m_iXGridNo1 = this.a_1598.m_iXGridNo;
               m_iYGridNo1 = this.m_iInitPosY < 0 ? 0 : 6;
            }
            if(this.a_1598 != null)
            {
               this.m_iXGridNo = this.a_1598.m_iXGridNo;
               this.m_iYGridNo = this.a_1598.m_iYGridNo;
            }
            this.FULL_HP = 100000;
            this.HURT_HP = this.FULL_HP * 0.3;
            this.m_fOrginSpeed = a_3491.a_1080 / (3 * 20);
            this.m_fCacheSpeed = a_3491.a_1080 / (3 * 20);
            visible = true;
            this.stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo1,m_iYGridNo1);
            this.ChangeToFieldGrid(this.stNextFieldGrid);
            this.m_numTargetYPos = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.m_numTargetXPos = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos,m_iSpeed);
            a_1460 = true;
            this.m_MouseState = 1;
            this.m_iMoveDirection = 0;
            this.ResetMovieStatus();
         }
         if((this.m_MouseState == 1 || this.m_MouseState == 5) && this.m_iCallBack == 1)
         {
            this.m_iCallBack = 2;
            this.m_numTargetYPos = 1 * a_3491.a_1081;
            this.m_numTargetXPos = 4.5 * a_3491.a_1080;
            this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos,a_3491.a_1080 / 20);
            this.m_iWaiteDownTick = 0;
            this.m_MouseState = 1;
            this.m_iMoveDirection = m_stCurrentFieldGrid.m_iXGridNo - this.m_iXGridNo < 0 ? 1 : 0;
            this.ResetMovieStatus();
            return true;
         }
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            if(this.a_1581 <= 0)
            {
               if(this.CheckBack())
               {
                  return true;
               }
               this.m_iWaiteDownTick = 2 * 20;
               this.m_MouseState = 5;
               this.ResetMovieStatus();
            }
         }
         else if(this.a_1581 == 0 && this.m_MouseState == 1)
         {
            if(this.CheckBack())
            {
               return true;
            }
            this.m_iWaiteDownTick = 2 * 20;
            this.m_MouseState = 5;
            this.ResetMovieStatus();
         }
         if(this.m_MouseState == 1)
         {
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            iXGridNo = this.getXGridNoByPosX();
            iYGridNo = this.getYGridNoByPosY();
            if(iYGridNo >= 0 && iYGridNo < BattleFieldView.a_1012)
            {
               SetCannotSeeByFighter(false);
            }
            else
            {
               SetCannotSeeByFighter(true);
            }
            this.stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            this.ChangeToFieldGrid(this.stNextFieldGrid);
         }
         if(this.m_iCallBack >= 2)
         {
            return true;
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 34 || a_1273 == 86)
            {
               m_stCurrentFieldGrid.ClearFieldGridDefenseNoraml();
            }
            else if(a_1273 == 36 || a_1273 == 88)
            {
               this.m_MouseState = 3;
               this.ResetMovieStatus();
               this.m_iRestTick = 3 * 20;
            }
            else if(a_1273 == 52 || a_1273 == 104)
            {
               this.m_iWaiteMoveTick = 2 * 20;
               this.m_MouseState = 5;
               this.ResetMovieStatus();
            }
         }
         if(this.m_iWaiteDownTick > 0)
         {
            --this.m_iWaiteDownTick;
            if(this.m_iWaiteDownTick == 0)
            {
               this.m_MouseState = 2;
               this.ResetMovieStatus();
            }
         }
         if(this.m_iWaiteMoveTick > 0 && this.m_iCallBack != 2)
         {
            --this.m_iWaiteMoveTick;
            if(this.m_iWaiteMoveTick == 0)
            {
               do
               {
                  m_RandomIndex = int(this.GetRandomSeed().nextInt(this.m_OutArray.length));
                  this.m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo + this.m_OutArray[m_RandomIndex][1];
                  this.m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + this.m_OutArray[m_RandomIndex][0];
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,this.m_iYGridNo);
               }
               while(this.a_1598 == null);
               this.m_numTargetYPos = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
               this.m_numTargetXPos = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
               this.a_1581 = this.setMoveToPosition(this.m_numTargetXPos,this.m_numTargetYPos);
               this.m_MouseState = 1;
               this.m_iMoveDirection = m_stCurrentFieldGrid.m_iXGridNo - this.m_iXGridNo < 0 ? 1 : 0;
               this.ResetMovieStatus();
            }
         }
         if(this.m_iRestTick > 0)
         {
            --this.m_iRestTick;
            if(this.m_iRestTick == 0)
            {
               this.m_MouseState = 4;
               a_1465 = 0;
               this.ResetMovieStatus();
            }
         }
         m_iIntruderState = this.m_MouseState == 3 ? 2 : 1;
         a_1465 = this.m_MouseState == 3 ? 0 : 3;
         return true;
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
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(this.a_1598.m_iYGridNo));
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         this.a_1598 = args[0];
         if(this.a_1598 != null)
         {
            this.m_iXGridNo = this.a_1598.m_iXGridNo;
            this.m_iYGridNo = this.a_1598.m_iYGridNo;
         }
         this.FULL_HP = args[1];
         this.HURT_HP = this.FULL_HP * 0.3;
         this.m_fOrginSpeed = args[2];
         this.m_fCacheSpeed = args[2];
         this.m_bBossCreate = false;
         if(Boolean(args[3] && args[4]) && Boolean(args[3] != -1) && args[4] != -1)
         {
            this.m_iInitPosY = args[3];
            this.m_iInitPosX = args[4];
            this.m_bBossCreate = true;
            return;
         }
         if(args[3])
         {
            this.m_iInitPosY = args[3];
         }
         else
         {
            this.m_iInitPosY = -60;
         }
         if(args[4])
         {
            this.m_iInitPosX = args[4];
         }
         else
         {
            this.m_iInitPosX = -1;
         }
      }
   }
}

