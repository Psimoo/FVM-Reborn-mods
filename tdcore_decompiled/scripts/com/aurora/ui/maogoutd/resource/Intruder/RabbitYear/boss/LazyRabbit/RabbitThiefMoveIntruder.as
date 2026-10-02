package com.aurora.ui.maogoutd.resource.Intruder.RabbitYear.boss.LazyRabbit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class RabbitThiefMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 90000;
      
      private const HURT_HP:int = 45000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      public function RabbitThiefMoveIntruder()
      {
         super();
         a_1279 = 5 - 8;
         a_1467 = 30 - 6;
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RabbitThiefMoveIntruder) as RabbitThiefMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return RabbitThiefMoveIntruderMovie;
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
            this.m_iWattingTime = 20 * 3 + 10;
            a_1275 = 1 + this.IsInjured;
            gotoAndStop((a_1276[a_1275 - 1] as FrameLabel).frame);
         }
         if(this.m_iWattingTime > 0)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               a_1275 = 2 + this.IsInjured;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 17 || a_1273 == 37)
            {
               if(m_stCurrentFieldGrid)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
            }
            else if(a_1273 == a_1274 || a_1273 == 20)
            {
               this.a_3940();
            }
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
               a_1275 += this.IsInjured;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            catch(error:Error)
            {
               throw new Error("m_iFrameLabelIndex:" + a_1275);
            }
         }
      }
      
      public function get IsInjured() : int
      {
         var iIsInjured:int = 0;
         if(a_1339 < this.HURT_HP)
         {
            iIsInjured = 3;
         }
         return iIsInjured;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

