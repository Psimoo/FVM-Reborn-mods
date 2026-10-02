package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.TheStorm
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TheStormTornadoMouseMoveIntruder extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stBattleView:BattleFieldView;
      
      private var m_iPathIndex:int = 0;
      
      private var m_lPath:Array = new Array([1,0],[0,0],[0,6],[1,6],[1,-1]);
      
      private var m_iTick:int = 0;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      public function TheStormTornadoMouseMoveIntruder()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TheStormTornadoMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(TheStormTornadoMouseMoveIntruder) as TheStormTornadoMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheStormTornadoMouseMoveIntruderMovie;
      }
      
      public function a_1797(isReseaved:Boolean, battleView:BattleFieldView) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stBattleView = battleView;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex(0);
         this.play();
         this.m_iPathIndex = 0;
         this.m_iTick = 0;
         this.m_fOrginSpeed = 2;
         return true;
      }
      
      public function ClearSelf() : void
      {
         this.a_3940();
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
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
         }
         else if(this.a_1581 == 0)
         {
            if(this.m_iPathIndex >= this.m_lPath.length)
            {
               this.a_3940();
               return;
            }
            this.a_1581 = this.setMoveToPosition(this.m_lPath[this.m_iPathIndex][0] * a_3491.a_1080 + 120,this.m_lPath[this.m_iPathIndex][1] * a_3491.a_1081 - 100,a_3491.a_1080 / 10);
            ++this.m_iPathIndex;
         }
         ++this.m_iTick;
         if(this.m_iTick % 3 != 0)
         {
            return;
         }
         var stFieldGrid:a_3491 = this.m_stBattleView.a_3438(Math.max(0,this.getXGridNoByPosX(x - 90)),Math.max(0,this.getXGridNoByPosX(y + 130)));
         if(stFieldGrid)
         {
            if(Boolean(stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) || stFieldGrid.m_stFlowerDefense || stFieldGrid.m_stBaseAuxiliaryFighter || stFieldGrid.m_stProtector) || Boolean(stFieldGrid.m_stTrayDefense) || Boolean(stFieldGrid.m_stBoomDefense))
            {
               this.a_3502(stFieldGrid);
            }
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
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number = -0.1234) : int
      {
         if(-0.1234 == fMoveSpeed)
         {
            fMoveSpeed = Math.abs(this.m_fOrginSpeed);
         }
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         return iMoveTick;
      }
      
      protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080;
         return iXGridNo - 10000;
      }
      
      protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY) / a_3491.a_1081;
         return iYGridNo - 10000;
      }
   }
}

