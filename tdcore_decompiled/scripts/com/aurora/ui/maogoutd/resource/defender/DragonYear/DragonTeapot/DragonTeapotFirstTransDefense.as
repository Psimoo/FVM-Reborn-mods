package com.aurora.ui.maogoutd.resource.defender.DragonYear.DragonTeapot
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DragonTeapotFirstTransDefense extends a_3976
   {
      
      private var m_coolDownCard:Array = new Array();
      
      private var m_stTiemr:Timer;
      
      public function DragonTeapotFirstTransDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1337 = 3;
         a_1095 = DragonTeapotDefence.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : DragonTeapotFirstTransDefense
      {
         return PoolManager.getInstance().CheckOutOne(DragonTeapotFirstTransDefense) as DragonTeapotFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonTeapotFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = DragonTeapotDefence.MAX_LIFE_VALUE;
         if(!this.m_stTiemr.hasEventListener(TimerEvent.TIMER))
         {
            this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         }
         this.play();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DragonTeapotDefence.a_3964(a_1094);
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return super.a_3940();
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               if(a_1334 != null)
               {
                  this.CardCoolDown(1);
               }
               this.a_3940();
               return;
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.CardCoolDown(1);
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      public function CardCoolDown(m_Range:int) : void
      {
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var stAurDataEvent:a_1778 = null;
         while(this.m_coolDownCard.length > 0)
         {
            this.m_coolDownCard.pop();
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFieldGrid != null)
               {
                  if(tempFieldGrid.m_stProtector != null)
                  {
                     this.m_coolDownCard.push(tempFieldGrid.m_stProtector.a_3512());
                  }
                  if(tempFieldGrid.m_stAttackFighter != null)
                  {
                     this.m_coolDownCard.push(tempFieldGrid.m_stAttackFighter.a_3512());
                  }
                  if(tempFieldGrid.m_stTrayDefense != null)
                  {
                     this.m_coolDownCard.push(tempFieldGrid.m_stTrayDefense.a_3512());
                  }
                  if(tempFieldGrid.m_stBoomDefense != null)
                  {
                     this.m_coolDownCard.push(tempFieldGrid.m_stBoomDefense.a_3512());
                  }
                  if(tempFieldGrid.m_stFlowerDefense != null)
                  {
                     this.m_coolDownCard.push(tempFieldGrid.m_stFlowerDefense.a_3512());
                  }
                  if(tempFieldGrid.m_stBaseAuxiliaryFighter != null)
                  {
                     this.m_coolDownCard.push(tempFieldGrid.m_stBaseAuxiliaryFighter.a_3512());
                  }
               }
            }
         }
         if(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField && Boolean(root))
         {
            stAurDataEvent = new a_1778("GameCardCoolDown");
            stAurDataEvent.dataObject = [4294967290,this.m_coolDownCard,0.5];
            root.dispatchEvent(stAurDataEvent);
         }
      }
   }
}

