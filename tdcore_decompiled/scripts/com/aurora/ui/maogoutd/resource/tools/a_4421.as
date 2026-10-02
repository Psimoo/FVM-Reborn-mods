package com.aurora.ui.maogoutd.resource.tools
{
   import a_4718.b_179;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4421 extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function a_4421()
      {
         a_1271 = true;
         super();
         a_1098 = b_179.a_403;
         this.m_stTiemr = new Timer(50);
      }
      
      public static function a_3926() : a_4421
      {
         return PoolManager.getInstance().CheckOutOne(a_4421) as a_4421;
      }
      
      override protected function getBindMovie() : Class
      {
         return HelmetScoopMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1272 = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         BattleFieldView.a_1027.play();
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return super.a_3940();
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
         if(a_1273 == a_1274)
         {
            if(!(!m_isMyPlacedTool || a_1283))
            {
               if(a_1334.m_stBattleBarrierHorseDefense != null)
               {
                  a_1334.m_stBattleBarrierHorseDefense.m_iDieType = a_1334.m_stBattleBarrierHorseDefense.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stBattleBarrierHorseDefense.a_3969(a_1334.m_stBattleBarrierHorseDefense.iLifeValue);
                  a_1334.RemoveToolDefense(a_1334.m_stBattleBarrierHorseDefense);
               }
               else if(a_1334.m_stOceanGoddessToolDefense != null)
               {
                  a_1334.m_stOceanGoddessToolDefense.m_iDieType = a_1334.m_stOceanGoddessToolDefense.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stOceanGoddessToolDefense.a_3969(a_1334.m_stOceanGoddessToolDefense.iLifeValue);
                  a_1334.RemoveToolDefense(a_1334.m_stOceanGoddessToolDefense);
               }
               else if(a_1334.m_SoulPuppetIntruder)
               {
                  a_1334.m_SoulPuppetIntruder.SpecialSkillCallBack(1);
               }
               else if(Boolean(a_1334.m_stVersatileDefense) && !a_1334.m_stVersatileDefense.m_isShowFrozen)
               {
                  a_1334.m_stVersatileDefense.m_iDieType = a_1334.m_stVersatileDefense.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stVersatileDefense.a_3969(a_1334.m_stVersatileDefense.iLifeValue);
                  a_1334.RemoveToolDefense(a_1334.m_stVersatileDefense);
               }
               else if(Boolean(a_1334.m_stAttackFighter) && Boolean(!(a_1334.m_stAttackFighter is a_3924)) && !a_1334.m_stAttackFighter.m_isShowFrozen)
               {
                  a_1334.m_stAttackFighter.m_iDieType = a_1334.m_stAttackFighter.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stAttackFighter.a_3969(a_1334.m_stAttackFighter.iLifeValue);
                  a_1334.a_3497(a_1334.m_stAttackFighter);
               }
               else if(Boolean(a_1334.m_stBaseAuxiliaryFighter) && !a_1334.m_stBaseAuxiliaryFighter.m_isShowFrozen)
               {
                  a_1334.m_stBaseAuxiliaryFighter.m_iDieType = a_1334.m_stBaseAuxiliaryFighter.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stBaseAuxiliaryFighter.a_3969(a_1334.m_stBaseAuxiliaryFighter.iLifeValue);
                  a_1334.a_3501(a_1334.m_stBaseAuxiliaryFighter);
               }
               else if(Boolean(a_1334.m_stFlowerDefense) && !a_1334.m_stFlowerDefense.m_isShowFrozen)
               {
                  a_1334.m_stFlowerDefense.m_iDieType = a_1334.m_stFlowerDefense.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stFlowerDefense.a_3969(a_1334.m_stFlowerDefense.iLifeValue);
                  a_1334.a_3500(a_1334.m_stFlowerDefense);
               }
               else if(Boolean(a_1334.m_stBoomDefense) && Boolean(!a_1334.m_stBoomDefense.m_isShowFrozen) && BattleFieldView.m_CatDieByHelmetScoop.indexOf(a_1334.m_stBoomDefense.a_3512()) == -1)
               {
                  a_1334.m_stBoomDefense.m_iDieType = a_1334.m_stBoomDefense.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stBoomDefense.a_3969(a_1334.m_stBoomDefense.iLifeValue);
                  a_1334.a_3499(a_1334.m_stBoomDefense);
               }
               else if(Boolean(a_1334.m_stProtector) && !a_1334.m_stProtector.m_isShowFrozen)
               {
                  a_1334.m_stProtector.m_iDieType = a_1334.m_stProtector.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stProtector.a_3969(a_1334.m_stProtector.iLifeValue);
                  a_1334.a_3496(a_1334.m_stProtector);
               }
               else if(Boolean(a_1334.m_stHoneyTrapBaseDefense) && !a_1334.m_stHoneyTrapBaseDefense.m_isShowFrozen)
               {
                  a_1334.m_stHoneyTrapBaseDefense.m_iDieType = a_1334.m_stHoneyTrapBaseDefense.m_isHurtByOpponent ? 4 : 2;
                  a_1334.m_stHoneyTrapBaseDefense.a_3969(a_1334.m_stHoneyTrapBaseDefense.iLifeValue);
                  a_1334.a_3497(a_1334.m_stHoneyTrapBaseDefense);
               }
               else if(Boolean(a_1334.m_stTrayDefense) && Boolean(!(a_1334.m_stAttackFighter is a_3924)) && !a_1334.m_stTrayDefense.m_isShowFrozen)
               {
                  if(Boolean(a_1334.m_stCurrentBattbleFieldView.m_UnLockMoveDefense) && a_1334.m_stCurrentBattbleFieldView.m_UnLockMoveDefense.stFieldGrid == a_1334)
                  {
                     trace("格子被锁定无法铲掉卡片");
                  }
                  else if(Boolean(a_1334.m_stCurrentBattbleFieldView.m_OtherUnLockMoveDefense) && a_1334.m_stCurrentBattbleFieldView.m_OtherUnLockMoveDefense.stFieldGrid == a_1334)
                  {
                     trace("队友格子被锁定无法铲掉卡片");
                  }
                  else
                  {
                     a_1334.m_stTrayDefense.m_iDieType = a_1334.m_stTrayDefense.m_isHurtByOpponent ? 4 : 2;
                     a_1334.m_stTrayDefense.a_3969(a_1334.m_stTrayDefense.iLifeValue);
                     a_1334.a_3498(a_1334.m_stTrayDefense);
                  }
               }
            }
            this.a_3940();
            return;
         }
      }
   }
}

