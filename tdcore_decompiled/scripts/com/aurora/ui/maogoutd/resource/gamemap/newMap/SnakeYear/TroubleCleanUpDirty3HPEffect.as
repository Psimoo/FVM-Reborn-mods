package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TroubleCleanUpDirty3HPEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_iHp:int = 0;
      
      private var m_stMap:TroubleCleanUpBaseGameMap;
      
      private var m_stGrid:a_3491;
      
      public function TroubleCleanUpDirty3HPEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TroubleCleanUpDirty3HPEffect
      {
         return PoolManager.getInstance().CheckOutOne(TroubleCleanUpDirty3HPEffect) as TroubleCleanUpDirty3HPEffect;
      }
      
      public function a_1797(isReseaved:Boolean, hp:int, map:TroubleCleanUpBaseGameMap, fieldGrid:a_3491) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1279 = 0;
         m_iYDisplayCenterPos = 5;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimation(0);
         this.m_stMap = map;
         this.m_stGrid = fieldGrid;
         this.m_iHp = hp;
         fieldGrid.m_iFieldGridType = 8;
         fieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,fieldGrid);
         this.x = fieldGrid.m_iXGridNo * a_3491.a_1080;
         this.y = fieldGrid.m_iYGridNo * a_3491.a_1081;
         if(hp == 3)
         {
            this.SetAnimation(0);
         }
         else if(hp == 2)
         {
            this.SetAnimation(2);
         }
         else
         {
            this.SetAnimation(4);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return TroubleCleanUpDirty3HPEffectMovie;
      }
      
      public function a_3969() : void
      {
         --this.m_iHp;
         if(this.m_iHp < 0)
         {
            this.m_iHp == 0;
         }
         this.ChangeState();
      }
      
      public function ChangeState() : void
      {
         if(this.m_iHp == 0)
         {
            if(this.m_stGrid != null)
            {
               this.m_stGrid.m_iFieldGridType = 0;
            }
            this.SetAnimation(5);
         }
         else if(this.m_iHp == 1)
         {
            this.SetAnimationOnce2Loop(3,4);
         }
         else if(this.m_iHp == 2)
         {
            this.SetAnimationOnce2Loop(1,2);
         }
         else
         {
            this.SetAnimation(0);
         }
      }
      
      public function a_3940() : Boolean
      {
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
      
      private function a_4003(a_4730:Event) : void
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
   }
}

