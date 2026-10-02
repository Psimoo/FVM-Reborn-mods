package com.aurora.ui.maogoutd.resource.Intruder.newBoss.baby
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.BabyDiamondsWarningSign;
   import flash.display.FrameLabel;
   
   public class BabyDiamondsMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 600;
      
      protected var m_bIsTarget:Boolean;
      
      protected var m_iMoveTickNum:int;
      
      protected var m_fTargetPosX:Number;
      
      protected var m_fTargetPosY:Number;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_iMouseMoveIntruderGlobalID:uint;
      
      protected var m_stWarningSign:BabyDiamondsWarningSign;
      
      private var m_iInitialStartXGridNo:int;
      
      private var m_iInitialStartYGridNo:int;
      
      public function BabyDiamondsMoveIntruder()
      {
         super();
         a_1481 = false;
         this.m_stWarningSign = BabyDiamondsWarningSign.a_3926();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BabyDiamondsMoveIntruder) as BabyDiamondsMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         var stFieldGrid:a_3491 = null;
         if(m_stCurrentFieldGrid)
         {
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetInitialFieldGrid(this.m_iInitialStartXGridNo,this.m_iInitialStartYGridNo);
            if(Boolean(stFieldGrid) && 4 == stFieldGrid.m_iFieldGridType)
            {
               stFieldGrid.m_iFieldGridType = 0;
            }
         }
         this.RemoveWarningSign();
         super.a_3940();
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return BabyDiamondsMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1279 = 0;
         this.visible = false;
         this.m_stWarningSign.visible = false;
         stop();
         return true;
      }
      
      private function RemoveWarningSign() : void
      {
         if(this.m_stWarningSign.parent)
         {
            this.m_stWarningSign.parent.removeChild(this.m_stWarningSign);
         }
      }
      
      private function AddWarningSign() : void
      {
         this.m_stWarningSign.a_1797();
         this.m_stWarningSign.visible = true;
         this.m_stWarningSign.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - this.m_stWarningSign.width);
         this.m_stWarningSign.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - this.m_stWarningSign.height);
         this.parent.addChildAt(this.m_stWarningSign,this.parent.getChildIndex(this) + 1);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.GotoAndStopFrame(3,false);
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_bIsTarget)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      protected function InitData() : void
      {
         this.AddWarningSign();
         this.GotoAndStopFrame(0);
         this.m_bIsTarget = false;
         this.visible = true;
         this.setIsShow(false);
         this.m_fTargetPosX = this.x;
         this.m_fTargetPosY = this.y;
         this.y = -166;
         var fDistance:Number = this.m_fTargetPosY - this.y;
         if(fDistance < 1)
         {
            fDistance = 1;
         }
         this.m_fMoveSpeedY = Math.min(30,this.m_fTargetPosY - this.y);
         this.m_iMoveTickNum = fDistance / this.m_fMoveSpeedY;
         this.m_fMoveSpeedY = fDistance / this.m_iMoveTickNum;
         this.m_fMoveSpeedX = -this.m_fMoveSpeedY * Math.tan(Math.PI * 20 / 180);
         this.x = this.m_fTargetPosX - this.m_fMoveSpeedX * this.m_iMoveTickNum;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime & 1)
         {
            return false;
         }
         if(!a_1460)
         {
            this.InitData();
            a_1460 = true;
         }
         nextFrame();
         if(a_1339 <= 0)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            return true;
         }
         if(this.m_bIsTarget)
         {
            if(null != a_1278)
            {
               this.GotoAndStopFrame(2);
            }
         }
         else
         {
            this.m_stWarningSign.nextFrame();
            --this.m_iMoveTickNum;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            if(0 == this.m_iMoveTickNum)
            {
               this.m_bIsTarget = true;
               this.RemoveWarningSign();
               this.setIsShow(true);
               this.GotoAndStopFrame(1);
               this.DeleteFieldGridDefense(m_stCurrentFieldGrid);
               if(0 == m_stCurrentFieldGrid.m_iFieldGridType)
               {
                  m_stCurrentFieldGrid.m_iFieldGridType = 4;
               }
               this.m_iInitialStartXGridNo = m_stCurrentFieldGrid.m_iInitialXGridNo;
               this.m_iInitialStartYGridNo = m_stCurrentFieldGrid.m_iInitialYGridNo;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3466();
            }
            else if(null != a_1278)
            {
               this.GotoAndStopFrame(0);
            }
         }
         return true;
      }
      
      protected function DeleteFieldGridDefense(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         if(!bIsNeed && a_1275 == iFrame)
         {
            return;
         }
         a_1275 = iFrame;
         gotoAndStop((a_1276[iFrame] as FrameLabel).frame);
         a_3419();
      }
      
      protected function setIsShow(bIsShow:Boolean) : void
      {
         a_1465 = bIsShow ? 0 : 3;
         a_1463 = !bIsShow;
         SetCannotSeeByFighter(!bIsShow);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function get MouseMoveIntruderGlobalID() : uint
      {
         return this.m_iMouseMoveIntruderGlobalID;
      }
      
      public function set MouseMoveIntruderGlobalID(iValue:uint) : void
      {
         this.m_iMouseMoveIntruderGlobalID = iValue;
      }
   }
}

