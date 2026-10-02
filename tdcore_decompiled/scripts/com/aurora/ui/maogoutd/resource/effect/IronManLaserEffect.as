package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class IronManLaserEffect extends a_3909
   {
      
      private var a_1109:Timer;
      
      private var a_1544:int;
      
      private var a_1545:int;
      
      private var a_1598:a_3491;
      
      public function IronManLaserEffect()
      {
         super();
         this.a_1109 = new Timer(50);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4109);
      }
      
      public static function a_3926() : IronManLaserEffect
      {
         return PoolManager.getInstance().CheckOutOne(IronManLaserEffect) as IronManLaserEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return IronManLaserEffectMovie;
      }
      
      public function SetAttackTarget(stFieldGrid:a_3491, bIsLeft:Boolean, bIsDown:Boolean) : void
      {
         var fDistanceX:Number = NaN;
         var fDistanceY:Number = NaN;
         var fAngle:Number = NaN;
         this.a_1598 = stFieldGrid;
         this.a_1544 = stFieldGrid.m_iXGridNo;
         this.a_1545 = stFieldGrid.m_iYGridNo;
         if(bIsDown)
         {
            fDistanceX = 0;
            fDistanceY = (this.a_1545 + 0.5) * a_3491.a_1081 - y;
            fAngle = Math.atan2(fDistanceY,fDistanceX);
            this.rotation = 90;
            this.x += 16;
         }
         else
         {
            fDistanceX = (this.a_1544 + 0.5) * a_3491.a_1080 - x;
            fDistanceY = 0;
            if(!bIsLeft)
            {
               this.rotation = 0;
            }
            else
            {
               this.rotation = 180;
            }
            this.y -= 16;
         }
         var fLineDistance:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         this.scaleX = fLineDistance / this.height;
      }
      
      override public function get height() : Number
      {
         return 300;
      }
      
      public function a_1797(isReversed:Boolean) : Boolean
      {
         a_1283 = isReversed;
         visible = true;
         gotoAndStop(1);
         this.stop();
         return true;
      }
      
      public function play() : void
      {
         this.a_1109.start();
      }
      
      public function stop() : void
      {
         this.a_1109.stop();
      }
      
      private function RealeaseBomb() : void
      {
         var stIronManLaserBombEffect:IronManLaserBombEffect = null;
         var fStartY:Number = NaN;
         stIronManLaserBombEffect = IronManLaserBombEffect.a_3926();
         stIronManLaserBombEffect.a_1797(a_1283);
         var fStartX:Number = (this.a_1544 + 0.5) * a_3491.a_1080 - 0.5 * stIronManLaserBombEffect.width;
         fStartY = (this.a_1545 + 0.5) * a_3491.a_1081 - 0.5 * stIronManLaserBombEffect.height;
         stIronManLaserBombEffect.x = fStartX;
         stIronManLaserBombEffect.y = fStartY;
         this.a_1598 = this.a_1598.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545);
         this.a_1598.m_stCurrentBattbleFieldView.AddToBattleView(stIronManLaserBombEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.a_1598);
         stIronManLaserBombEffect.play();
      }
      
      public function a_3940() : Boolean
      {
         this.stop();
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 - 3)
         {
            this.RealeaseBomb();
         }
         else if(a_1273 == a_1274 - 2)
         {
            this.a_1598 = this.a_1598.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545);
            this.ClearFieldGridDefenseCard(this.a_1598);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      private function ClearFieldGridDefenseCard(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
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
         if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(true,0,true,0,1);
         }
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

