package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.DrinkMachine
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ColdDrinkEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var stTargetFieldGrid:a_3491;
      
      public function ColdDrinkEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
         a_1279 = -10;
         m_iYDisplayCenterPos = -303;
      }
      
      public static function a_3926() : ColdDrinkEffect
      {
         return PoolManager.getInstance().CheckOutOne(ColdDrinkEffect) as ColdDrinkEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ColdDrinkEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         if(this.stTargetFieldGrid != null && Boolean(this.stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            this.stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,this.stTargetFieldGrid.m_iXGridNo,this.stTargetFieldGrid.m_iYGridNo);
            this.stTargetFieldGrid = null;
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
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         nextFrame();
         if(a_1273 != 5)
         {
            if(a_1273 == a_1274 - 6)
            {
               if(this.stTargetFieldGrid)
               {
                  xStart = Math.max(this.stTargetFieldGrid.m_iXGridNo - 1,0);
                  xEnd = Math.min(this.stTargetFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
                  yStart = Math.max(this.stTargetFieldGrid.m_iYGridNo - 1,0);
                  yEnd = Math.min(this.stTargetFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
                  stFieldGridVector = this.stTargetFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stFieldGrid = this.stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stAttackFighter != null) && !stFieldGrid.m_stAttackFighter.m_isSleep)
                        {
                           this.FrozenCard(stFieldGrid);
                        }
                     }
                  }
               }
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
      }
      
      private function FrozenCard(a_1334:a_3491) : void
      {
         var stBaseFrozenEffect:BaseFrozenEffect = null;
         a_1334.m_stAttackFighter.a_3958(100);
         stBaseFrozenEffect = BaseFrozenEffect.a_3926();
         stBaseFrozenEffect.m_stTargetField = a_1334;
         stBaseFrozenEffect.a_1797(false);
         stBaseFrozenEffect.a_3958 = 5;
         a_1334.m_stAttackFighter.m_isSleep = true;
         stBaseFrozenEffect.x = a_1334.m_iXGridNo * a_3491.a_1080;
         stBaseFrozenEffect.y = a_1334.m_iYGridNo * a_3491.a_1081 + 40;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stBaseFrozenEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,a_1334);
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stBaseFrozenEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
         }
         a_1334.m_stAttackFighter.m_BaseEffect = stBaseFrozenEffect;
         stBaseFrozenEffect.play();
      }
   }
}

