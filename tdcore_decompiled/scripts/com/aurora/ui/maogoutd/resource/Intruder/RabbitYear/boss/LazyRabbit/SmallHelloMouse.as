package com.aurora.ui.maogoutd.resource.Intruder.RabbitYear.boss.LazyRabbit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SmallHelloMouse extends a_4206
   {
      
      private const FULL_HP:int = 90000;
      
      private const HURT_HP:int = 45000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      public var m_stParentMouse:BaseBossMoveIntruder = null;
      
      public var m_iIsInjured:int;
      
      public function SmallHelloMouse()
      {
         super();
         a_1279 = 15 - 48;
         a_1467 = -3 + 68;
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SmallHelloMouse) as SmallHelloMouse;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallHelloMouseMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1463 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_stParentMouse = null;
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_stMouseObstacle)
            {
               m_stCurrentFieldGrid.m_stMouseObstacle = null;
            }
         }
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.m_iWattingTime = 20 * 2 + 10;
            a_1275 = 0 + this.m_iIsInjured;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.m_iWattingTime > 0)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               this.a_3940();
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == a_1274 || a_1273 == 18)
            {
               this.a_3940();
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_stParentMouse != null)
         {
            this.m_stParentMouse.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.HURT_HP)
         {
            if(a_1339 <= 0)
            {
               if(a_1339 <= 0)
               {
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.a_3457(this);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  }
                  this.a_3940();
               }
            }
         }
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1273 == a_1274 && a_1339 <= 0)
         {
            this.a_3940();
            return;
         }
         if(a_1278 != null)
         {
            if(a_1339 <= 0)
            {
               this.a_3940();
               return;
            }
            try
            {
               a_1275 += this.m_iIsInjured;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            catch(error:Error)
            {
               throw new Error("m_iFrameLabelIndex:" + a_1275);
            }
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

