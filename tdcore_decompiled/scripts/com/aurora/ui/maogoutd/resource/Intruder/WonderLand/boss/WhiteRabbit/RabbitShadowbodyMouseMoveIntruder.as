package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.WhiteRabbit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class RabbitShadowbodyMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 900000;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      public function RabbitShadowbodyMouseMoveIntruder()
      {
         super();
         a_1279 = 72 - 5;
         a_1467 = 124 - 30;
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RabbitShadowbodyMouseMoveIntruder) as RabbitShadowbodyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return RabbitShadowbodyMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         a_1275 = 1;
         a_1463 = true;
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
            this.m_iWattingTime = 30 * 20 + 12;
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(this.m_iWattingTime > 0)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         return true;
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

