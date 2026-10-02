package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.boss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.utils.setTimeout;
   
   public class TheSnakeBarrier extends a_4135
   {
      
      private var m_bDead:Boolean = false;
      
      public function TheSnakeBarrier()
      {
         a_1279 = -5;
         m_iYDisplayCenterPos = -40;
         super();
      }
      
      public static function a_3926() : TheSnakeBarrier
      {
         return PoolManager.getInstance().CheckOutOne(TheSnakeBarrier) as TheSnakeBarrier;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheSnakeBarrierMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            timerout = setTimeout(this.DoDying,15 * 1000,m_stCurrentFieldGrid);
            a_3502(m_stCurrentFieldGrid);
            m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
         }
         this.addShield(m_stCurrentFieldGrid);
         a_1275 = 0;
         a_1271 = true;
         this.m_bDead = false;
         this.SetAnimationOnce2Loop(0,1);
         return true;
      }
      
      protected function DoDying(stFieldGrid:a_3491) : void
      {
         this.SetAnimation(2);
         timerout = setTimeout(this.DoRealease,15 * 1000,m_stCurrentFieldGrid);
      }
      
      private function DoRealease(stFieldGrid:a_3491) : void
      {
         this.SetAnimation(3);
         this.m_bDead = true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stMouseEarthHole != null)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
            stFieldGrid.m_iFieldGridType = 0;
         }
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 4;
            stFieldGrid.m_stMouseEarthHole = this;
         }
         a_3502(stFieldGrid);
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_iFieldGridType = m_iOldFieldGridType;
         }
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stMouseEarthHole = null;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(m_stCurrentFieldGrid);
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function SetAnimation(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var i:int = 0;
         var stMoveIntruder:a_4206 = null;
         var grid:a_3491 = m_stCurrentFieldGrid;
         if(grid != null && this.m_bDead == false)
         {
            if(grid.a_1511.length > 0)
            {
               for(i = 0; i < grid.a_1511.length; i++)
               {
                  stMoveIntruder = grid.a_1511[i];
                  if(stMoveIntruder.m_stMoveIntruderTypeID == 134224545)
                  {
                     stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                     this.DoRealease(grid);
                  }
               }
            }
         }
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
}

