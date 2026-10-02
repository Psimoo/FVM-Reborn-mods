package com.aurora.ui.maogoutd.resource.defender.DragonYear.XiangLongRing
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class XiangLongRingSecondBomEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_TargetFieldGrid:a_3491;
      
      private var m_iStartTime:int;
      
      private var m_iSleepTime:int;
      
      public function XiangLongRingSecondBomEffect()
      {
         super();
         a_1279 = -0.5 * 282;
         m_iYDisplayCenterPos = -0.5 * 323;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : XiangLongRingSecondBomEffect
      {
         return PoolManager.getInstance().CheckOutOne(XiangLongRingSecondBomEffect) as XiangLongRingSecondBomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return XiangLongRingSecondBomEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
      }
      
      public function a_3940() : Boolean
      {
         var stVector:Array = null;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         if(this.m_TargetFieldGrid)
         {
            stVector = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 3)
         {
            this.a_4210();
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(this.m_TargetFieldGrid.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(this.m_TargetFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(this.m_TargetFieldGrid.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(this.m_TargetFieldGrid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
   }
}

