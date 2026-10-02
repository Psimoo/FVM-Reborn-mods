package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.boss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TheBrozeSnakeBullet extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stNextFieldGrid:a_3491;
      
      private var iSpeedX:Number;
      
      private var iSpeedY:Number;
      
      private var iMoveTime:Number = 30;
      
      private var stTargetGrid:a_3491;
      
      public function TheBrozeSnakeBullet()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TheBrozeSnakeBullet
      {
         return PoolManager.getInstance().CheckOutOne(TheBrozeSnakeBullet) as TheBrozeSnakeBullet;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheBrozeSnakeBulletMovie;
      }
      
      public function a_1797(stNextFieldGrid:a_3491) : Boolean
      {
         this.m_stNextFieldGrid = stNextFieldGrid;
         stNextFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE);
         this.x = stNextFieldGrid.m_iXGridNo * a_3491.a_1080 - 20;
         this.y = stNextFieldGrid.m_iYGridNo * a_3491.a_1081 - 40;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1283 = false;
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex(0);
         this.play();
         return true;
      }
      
      public function SetMove2Target(stFieldGrid:a_3491) : void
      {
         var nX:Number = NaN;
         var nY:Number = NaN;
         nX = 6 * a_3491.a_1080;
         nY = 3 * a_3491.a_1081;
         this.iMoveTime = 15;
         this.x = nX;
         this.y = nY;
         this.stTargetGrid = stFieldGrid;
         this.iSpeedX = (stFieldGrid.m_iXGridNo * a_3491.a_1080 - 10 - nX) / this.iMoveTime;
         this.iSpeedY = (stFieldGrid.m_iYGridNo * a_3491.a_1081 + 10 - nY) / this.iMoveTime;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
         this.a_3940();
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         --this.iMoveTime;
         this.x += this.iSpeedX;
         this.y += this.iSpeedY;
         if(this.iMoveTime == 0)
         {
            this.a_3502(this.stTargetGrid);
            this.a_3940();
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop(0);
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

