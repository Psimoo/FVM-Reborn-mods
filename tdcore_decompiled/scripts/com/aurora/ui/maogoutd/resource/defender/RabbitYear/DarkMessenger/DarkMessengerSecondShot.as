package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DarkMessenger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DarkMessengerSecondShot extends a_4348
   {
      
      private static var ms_stDarkMessengerBaseAttackFighterShotVector:Array = new Array();
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function DarkMessengerSecondShot()
      {
         super();
         a_1279 = -155;
         m_iYDisplayCenterPos = -161 - 50 - 6;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stDarkMessengerBaseAttackFighterShot:DarkMessengerSecondShot = ms_stDarkMessengerBaseAttackFighterShotVector.pop();
         if(null == stDarkMessengerBaseAttackFighterShot)
         {
            stDarkMessengerBaseAttackFighterShot = new DarkMessengerSecondShot();
         }
         BattleFieldView.a_1017.play();
         return stDarkMessengerBaseAttackFighterShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DarkMessengerSecondShotMovie;
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
         if(-1 == ms_stDarkMessengerBaseAttackFighterShotVector.indexOf(this))
         {
            ms_stDarkMessengerBaseAttackFighterShotVector.push(this);
         }
         this.a_1596 = -1;
         this.m_isParentAttackDie = false;
         return true;
      }
   }
}

