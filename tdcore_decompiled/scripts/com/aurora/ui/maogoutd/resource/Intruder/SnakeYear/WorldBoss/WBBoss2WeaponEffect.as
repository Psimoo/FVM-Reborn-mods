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
   
   public class WBBoss2WeaponEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var targetGrid:a_3491;
      
      public var hasClear:Boolean = false;
      
      public function WBBoss2WeaponEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = -64 * 2;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBBoss2WeaponEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBBoss2WeaponEffect) as WBBoss2WeaponEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBBoss2WeaponEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimationOnce2Loop2(0,1);
         this.hasClear = false;
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(stFieldGrid.m_stBaseToolDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
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
         if(this.hasClear == false && a_1273 == 3)
         {
            this.hasClear = true;
            if(this.targetGrid != null)
            {
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo - 1,this.targetGrid.m_iYGridNo));
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo + 1,this.targetGrid.m_iYGridNo));
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo,this.targetGrid.m_iYGridNo - 1));
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo,this.targetGrid.m_iYGridNo + 1));
               this.a_3502(this.targetGrid);
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo - 1,this.targetGrid.m_iYGridNo - 1));
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo + 1,this.targetGrid.m_iYGridNo + 1));
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo - 1,this.targetGrid.m_iYGridNo + 1));
               this.a_3502(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(this.targetGrid.m_iXGridNo + 1,this.targetGrid.m_iYGridNo - 1));
            }
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
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

