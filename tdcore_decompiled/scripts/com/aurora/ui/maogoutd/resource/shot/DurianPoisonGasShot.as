package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class DurianPoisonGasShot extends a_4348
   {
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function DurianPoisonGasShot()
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
         return PoolManager.getInstance().CheckOutOne(DurianPoisonGasShot) as DurianPoisonGasShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DurianPoisonGasShotMovie;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(this.a_1596 <= 0)
         {
            this.m_isParentAttackDie = false;
            a_1275 = 1;
            gotoAndStop(1);
            this.a_1596 = setTimeout(this.a_3940,200000);
         }
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
               this.a_3940();
            }
         }
         var stCurrentFieldGrid:a_3491 = a_1584;
         if(Boolean(stCurrentFieldGrid) && iCurrentTime % 20 == 0)
         {
            if(null != stCurrentFieldGrid)
            {
               arrMouveIntruder = stCurrentFieldGrid.a_1511.slice();
               for each(stMouseIntruder in arrMouveIntruder)
               {
                  if(!stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                  {
                     stMouseIntruder.a_4209(a_1580);
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1596 = -1;
         return true;
      }
   }
}

