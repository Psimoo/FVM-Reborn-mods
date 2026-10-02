package com.aurora.ui.maogoutd.resource.EgihtAnniversary.dianMan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DianManFirstShot extends a_4348
   {
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function DianManFirstShot()
      {
         super();
         a_1279 = -width * 0;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         alpha = 0.5;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DianManFirstShot) as DianManFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DianManFristShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         a_1275 = 1;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.m_isParentAttackDie)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
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
               this.a_3940();
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

