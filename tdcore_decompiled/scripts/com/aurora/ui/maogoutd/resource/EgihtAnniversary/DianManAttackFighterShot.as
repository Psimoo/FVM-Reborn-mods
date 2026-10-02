package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DianManAttackFighterShot extends a_4348
   {
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function DianManAttackFighterShot()
      {
         super();
         a_1279 = -width * 0;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         alpha = 0.5;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DianManAttackFighterShot,DianManAttackFighterShotMovie) as DianManAttackFighterShot;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.m_isParentAttackDie)
         {
            gotoAndStop((a_1276[2] as FrameLabel).frame);
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
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_isParentAttackDie = false;
         return true;
      }
   }
}

