package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBLionDanceBodyMouseMoveIntruder extends a_4206
   {
      
      private static const ONE_GRID_SPEED:int = 3;
      
      private var m_iWaitTick:int = -1;
      
      private var m_stBody:WBLionDanceBodyMouseMoveIntruder;
      
      private var m_stHead:WBLionDanceMouseMoveIntruder;
      
      public function WBLionDanceBodyMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLionDanceBodyMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLionDanceBodyMouseMoveIntruder) as WBLionDanceBodyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLionDanceBodyMouseMoveIntruderMovie;
      }
      
      public function RealeaseBody() : void
      {
         a_3940();
      }
      
      public function ResetMovieStatus2() : void
      {
         this.ResetMovieStatus();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_iWaitTick = -1;
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 999999;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         this.SetAnimation2(3);
         AddTag(2);
         AddTag(3);
         return true;
      }
      
      public function InitHead(head:WBLionDanceMouseMoveIntruder) : void
      {
         this.m_stHead = head;
      }
      
      private function SwitchState(bWait:Boolean) : void
      {
         if(bWait)
         {
            this.m_iWaitTick = 81;
            a_1350 = 0;
         }
         else
         {
            a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         this.ResetMovieStatus();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.m_stHead == null)
         {
            return true;
         }
         if(!this.m_stHead.IsDead())
         {
            if(this.m_iWaitTick > 0)
            {
               if(this.m_stHead != null && this.m_stHead.InHealth())
               {
                  this.SetAnimation2(0);
               }
               else if(a_1275 == 0 && a_1339 > 0)
               {
                  this.SetAnimationOnce2Loop2(1,2);
               }
               else
               {
                  this.SetAnimation2(2);
               }
            }
            else if(this.m_stHead != null && this.m_stHead.InHealth())
            {
               this.SetAnimation2(3);
            }
            else if(a_1275 == 3 && a_1339 > 0)
            {
               this.SetAnimationOnce2Loop2(4,5);
            }
            else
            {
               this.SetAnimation2(5);
            }
         }
         else
         {
            this.SetAnimation2(7);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function get iArmorLifeValue() : int
      {
         return this.m_stHead.iArmorLifeValue;
      }
      
      override public function ReduceLife2(iRduceLifeValue:int, damageParams:Array = null) : Boolean
      {
         return this.m_stHead.ReduceLife2(iRduceLifeValue,damageParams);
      }
      
      override public function ReduceLifeIgnoreArmor2(iRduceLifeValue:int, damageParams:Array = null) : Boolean
      {
         return this.m_stHead.ReduceLifeIgnoreArmor2(iRduceLifeValue,damageParams);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return this.m_stHead.a_3969(iRduceLifeValue);
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return this.m_stHead.a_4209(iRduceLifeValue);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = NaN;
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var newX:int = 0;
         var iNewXGridNo:int = 0;
         if(this.m_stHead == null || !this.m_stHead.m_bInit)
         {
            return true;
         }
         numOrigXPos = x;
         if(!a_1460)
         {
            a_1460 = true;
         }
         x += a_1350;
         iXGridNo = int(x / a_3491.a_1080);
         if(m_stCurrentFieldGrid != null && iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            if(stNextFieldGrid.m_stBaseLander != null)
            {
               SetClarmLanderTime();
            }
         }
         if(m_stMianYiEffect != null)
         {
            m_stMianYiEffect.x = x + 0.5 * (width - m_stMianYiEffect.width) + stDisplayBitmap.x - 20;
            m_stMianYiEffect.y = y + m_stMianYiEffect.height + stDisplayBitmap.y - 50;
         }
         if(m_stShanDianEffect != null)
         {
            m_stShanDianEffect.x = x + 0.5 * (width - m_stShanDianEffect.width) + stDisplayBitmap.x - 20;
            m_stShanDianEffect.y = y + 0.5 * (height - m_stShanDianEffect.height) + stDisplayBitmap.y;
         }
         if(m_stPoisonGasEffect != null)
         {
            m_stPoisonGasEffect.x = x + 0.5 * width + stDisplayBitmap.x;
            m_stPoisonGasEffect.y = y + stDisplayBitmap.y;
         }
         if(m_stSnakePoisonEffect != null)
         {
            m_stSnakePoisonEffect.x = x + 0.5 * width + stDisplayBitmap.x;
            m_stSnakePoisonEffect.y = y + stDisplayBitmap.y;
         }
         if(m_stCurrentFieldGrid != null && this.m_iWaitTick <= 0)
         {
            newX = x + a_1350 * a_1470;
            iNewXGridNo = int(newX / a_3491.a_1080);
            if(m_stCurrentFieldGrid.m_iXGridNo != iNewXGridNo)
            {
               if(!a_1283)
               {
                  if(iNewXGridNo == 2 || iNewXGridNo == 6)
                  {
                     this.SwitchState(true);
                  }
               }
            }
         }
         if(newX < 0)
         {
            if(a_1283 == false)
            {
               x = 60;
            }
            a_1283 = true;
            a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         if(newX > BattleFieldView.a_1013)
         {
            if(a_1283 == true)
            {
               x = BattleFieldView.a_1013 - 60;
            }
            a_1283 = false;
            a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         if(this.m_iWaitTick > 0)
         {
            --this.m_iWaitTick;
            if(this.m_iWaitTick == 0)
            {
               this.SwitchState(false);
            }
         }
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

