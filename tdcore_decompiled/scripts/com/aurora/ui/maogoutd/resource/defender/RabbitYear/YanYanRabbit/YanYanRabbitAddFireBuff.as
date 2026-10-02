package com.aurora.ui.maogoutd.resource.defender.RabbitYear.YanYanRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class YanYanRabbitAddFireBuff extends a_4108
   {
      
      public var m_stTargetField:a_3491;
      
      public function YanYanRabbitAddFireBuff()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : YanYanRabbitAddFireBuff
      {
         return PoolManager.getInstance().CheckOutOne(YanYanRabbitAddFireBuff) as YanYanRabbitAddFireBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return YanYanRabbitAddFireBuffMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.m_stTargetField != null && Boolean(this.m_stTargetField.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            this.m_stTargetField.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
   }
}

