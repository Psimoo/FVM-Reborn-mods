package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class WBBlockHoleEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var targetGrid:a_3491;
      
      private var damageTick:int = 0;
      
      private var iNoX:int;
      
      private var iNoY:int;
      
      public function WBBlockHoleEffect()
      {
         super();
         a_1279 = -10;
         m_iYDisplayCenterPos = -64 * 3;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBBlockHoleEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBBlockHoleEffect) as WBBlockHoleEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBBlockHoleEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         this.play();
         this.damageTick = 0;
         this.iNoX = this.targetGrid.m_iXGridNo;
         this.iNoY = this.targetGrid.m_iYGridNo;
         this.targetGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         this.SetAnimationOnce2Loop2(0,1);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(20);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(20);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(20);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(20);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(20);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,20,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(20);
         }
         return true;
      }
      
      public function a_3940() : Boolean
      {
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
            return;
         }
         if(this.damageTick != -1)
         {
            if(this.damageTick != 0 && this.damageTick != 10 && this.damageTick % 10 == 0)
            {
               this.damageAll();
            }
            ++this.damageTick;
            if(this.damageTick == 110)
            {
               this.damageTick = -1;
               this.SetAnimation2(2);
            }
         }
      }
      
      private function damageAll() : void
      {
         var j:int = 0;
         var grid:a_3491 = null;
         this.iNoX = this.targetGrid.m_iXGridNo;
         this.iNoY = this.targetGrid.m_iYGridNo;
         for(var i:int = this.iNoX - 2; i <= this.iNoX + 2; i++)
         {
            for(j = this.iNoY - 2; j <= this.iNoY + 2; j++)
            {
               grid = this.targetGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
               this.a_3502(grid);
            }
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

