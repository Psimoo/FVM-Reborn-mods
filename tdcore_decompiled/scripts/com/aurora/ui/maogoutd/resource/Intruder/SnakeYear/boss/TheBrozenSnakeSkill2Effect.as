package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.boss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TheBrozenSnakeSkill2Effect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var a_1334:a_3491;
      
      public function TheBrozenSnakeSkill2Effect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TheBrozenSnakeSkill2Effect
      {
         return PoolManager.getInstance().CheckOutOne(TheBrozenSnakeSkill2Effect) as TheBrozenSnakeSkill2Effect;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheBrozenSnakeSkill2EffectMovie;
      }
      
      public function a_1797(stFieldGrid:a_3491, isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.a_1334 = stFieldGrid;
         this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stFieldGrid);
         this.x = 110;
         this.y = this.a_1334.m_iYGridNo * a_3491.a_1081 - 58;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
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
         this.a_3940();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 5)
         {
            this.a_3502(3,this.a_1334.m_iYGridNo);
            this.a_3502(4,this.a_1334.m_iYGridNo);
            this.a_3502(5,this.a_1334.m_iYGridNo);
            this.a_3502(6,this.a_1334.m_iYGridNo);
            this.a_3502(7,this.a_1334.m_iYGridNo);
         }
         if(a_1273 == a_1274 || a_1278 != null)
         {
            this.stop();
         }
      }
      
      protected function a_3502(iNoX:int, iNoY:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var stMoveIntruder:a_4206 = null;
         stTargetFieldGrid = this.a_1334.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stTargetFieldGrid == null)
         {
            return false;
         }
         if(null != stTargetFieldGrid.m_stProtector)
         {
            stTargetFieldGrid.m_stProtector.m_iDieType = 1;
            stTargetFieldGrid.m_stProtector.a_3969(50);
         }
         else if(null != stTargetFieldGrid.m_stAttackFighter && !(stTargetFieldGrid.m_stAttackFighter is a_3924))
         {
            stTargetFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stTargetFieldGrid.m_stAttackFighter.a_3969(50);
         }
         else if(null != stTargetFieldGrid.m_stBoomDefense)
         {
            stTargetFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stTargetFieldGrid.m_stBoomDefense.a_3969(50);
         }
         else if(null != stTargetFieldGrid.m_stFlowerDefense)
         {
            stTargetFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stTargetFieldGrid.m_stFlowerDefense.a_3969(50);
         }
         else if(null != stTargetFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stTargetFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stTargetFieldGrid.m_stBaseAuxiliaryFighter.a_3969(50);
         }
         else if(stTargetFieldGrid.HasNewSlot())
         {
            stTargetFieldGrid.DamageNewSlot(false,0,false,50,1);
         }
         else if(null != stTargetFieldGrid.m_stTrayDefense)
         {
            stTargetFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stTargetFieldGrid.m_stTrayDefense.a_3969(50);
         }
         if(stTargetFieldGrid.a_1511.length > 0)
         {
            for(i = 0; i < stTargetFieldGrid.a_1511.length; i++)
            {
               stMoveIntruder = stTargetFieldGrid.a_1511[i];
               if(stMoveIntruder.m_stMoveIntruderTypeID == 134224545)
               {
                  stMoveIntruder.a_3969(20000);
               }
               if(stMoveIntruder.m_stMoveIntruderTypeID == 8389034)
               {
                  stMoveIntruder.SpecialSkillCallBack(0);
               }
            }
         }
         return true;
      }
   }
}

