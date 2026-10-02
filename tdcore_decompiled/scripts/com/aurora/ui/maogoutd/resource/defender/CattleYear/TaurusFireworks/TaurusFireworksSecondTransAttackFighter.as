package com.aurora.ui.maogoutd.resource.defender.CattleYear.TaurusFireworks
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TaurusFireworksSecondTransAttackFighter extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var stStartField:a_3491;
      
      public function TaurusFireworksSecondTransAttackFighter()
      {
         super();
         a_1338 = 0;
         a_1279 = 0;
         a_1095 = TaurusFireworksDefine.FIRSTTRANS_DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TaurusFireworksSecondTransAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(TaurusFireworksSecondTransAttackFighter) as TaurusFireworksSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusFireworksSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         super.a_1797(stFieldGrid);
         a_1339 = TaurusFireworksDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TaurusFireworksDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
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
         var iY:int = 0;
         var iXLeft:int = 0;
         var iXRight:int = 0;
         var startX:int = 0;
         var startField:a_3491 = null;
         var offset:int = 0;
         var yIndex:int = 0;
         nextFrame();
         if(a_1273 == a_1274 - 5)
         {
            iY = a_1334.m_iYGridNo;
            iXLeft = 0;
            iXRight = BattleFieldView.a_1011 - 1;
            for(offset = -1; offset <= 1; offset++)
            {
               yIndex = iY + offset;
               if(!(yIndex < 0 || yIndex >= BattleFieldView.a_1012))
               {
                  startX = iXLeft;
                  startField = a_1334.m_stCurrentBattbleFieldView.a_3438(startX,yIndex);
                  this.addShotToField(startField,false,yIndex >= a_1334.m_iYGridNo);
                  startX = iXRight;
                  startField = a_1334.m_stCurrentBattbleFieldView.a_3438(startX,yIndex);
                  this.addShotToField(startField,true,yIndex >= a_1334.m_iYGridNo);
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            this.a_3940();
         }
      }
      
      private function addShotToField(field:a_3491, isReversed:Boolean = false, isOverCurYGrid:Boolean = false) : Boolean
      {
         if(!field)
         {
            return false;
         }
         var shot:TaurusFireworksSecondShot = TaurusFireworksSecondShot.a_4344() as TaurusFireworksSecondShot;
         if(!shot)
         {
            return false;
         }
         var offsetX:int = 0;
         offsetX += isReversed ? 60 : 0;
         var tempX:int = field.m_iXGridNo * a_3491.a_1080 + offsetX;
         var tempY:int = field.m_iYGridNo * a_3491.a_1081 + 30;
         shot.m_isSpecial = isReversed ? 1 : 0;
         shot.a_1797(0,15,500,tempX,tempY,a_1334.m_stCurrentBattbleFieldView,field);
         field.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,field);
         return true;
      }
   }
}

