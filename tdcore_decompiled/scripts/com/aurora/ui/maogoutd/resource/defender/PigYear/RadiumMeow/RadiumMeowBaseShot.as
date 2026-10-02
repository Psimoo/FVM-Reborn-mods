package com.aurora.ui.maogoutd.resource.defender.PigYear.RadiumMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RadiumMeowBaseShot extends a_4348
   {
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function RadiumMeowBaseShot()
      {
         super();
         a_1279 = -width * 0;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(RadiumMeowBaseShot,RadiumMeowBaseShotMovie) as RadiumMeowBaseShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(RadiumMeowBaseShot,RadiumMeowBaseShot1Movie) as RadiumMeowBaseShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(RadiumMeowBaseShot,RadiumMeowBaseShot2Movie) as RadiumMeowBaseShot;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.m_isParentAttackDie)
         {
            this.a_3940();
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
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

