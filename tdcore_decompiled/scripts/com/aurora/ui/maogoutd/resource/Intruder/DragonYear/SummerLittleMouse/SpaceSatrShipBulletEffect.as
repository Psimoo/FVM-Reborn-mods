package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SpaceSatrShipBulletEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stTarget:a_3491;
      
      private var m_has40009:Boolean;
      
      public function SpaceSatrShipBulletEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : SpaceSatrShipBulletEffect
      {
         return PoolManager.getInstance().CheckOutOne(SpaceSatrShipBulletEffect) as SpaceSatrShipBulletEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceSatrShipBulletEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean, target:a_3491, has40009:Boolean) : Boolean
      {
         this.m_stTarget = target;
         this.m_has40009 = has40009;
         target.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE);
         this.x = target.m_iXGridNo * a_3491.a_1080 + 18;
         this.y = target.m_iYGridNo * a_3491.a_1081 - 140;
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex(0);
         this.play();
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         if(this.parent)
         {
            this.parent.removeChild(this);
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
         this.a_3940();
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         a_1275 = frame;
         gotoAndStop((a_1276[frame] as FrameLabel).frame);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         if(a_1273 == 4)
         {
            this.a_3502(this.m_stTarget);
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         var iHurtDamage:int = 0;
         var iHurtPower:int = 0;
         if(stFieldGrid == null || this.m_has40009)
         {
            return false;
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               iHurtDamage = stFieldGrid.m_stAttackFighter.iLifeValue - 10;
               iHurtPower = iHurtDamage > 100 ? 100 : iHurtDamage;
               stFieldGrid.m_stAttackFighter.a_3969(iHurtPower);
            }
            else
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(100);
            }
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(100);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(100);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(100);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,100,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(100);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(100);
         }
         return true;
      }
   }
}

