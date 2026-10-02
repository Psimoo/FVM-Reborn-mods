package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DarkMessenger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DarkMessengerBaseShot extends a_4348
   {
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function DarkMessengerBaseShot()
      {
         super();
         a_1279 = -155;
         m_iYDisplayCenterPos = -153 + 45 - 37;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DarkMessengerBaseShot,DarkMessengerBaseShotMovie) as DarkMessengerBaseShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DarkMessengerBaseShot,DarkMessengerBaseShot1Movie) as DarkMessengerBaseShot;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(this.m_isParentAttackDie)
            {
               this.a_3940();
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
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1596 = -1;
         this.m_isParentAttackDie = false;
         return true;
      }
   }
}

