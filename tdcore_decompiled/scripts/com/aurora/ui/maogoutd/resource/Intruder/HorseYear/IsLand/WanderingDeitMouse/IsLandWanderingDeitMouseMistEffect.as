package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.WanderingDeitMouse
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class IsLandWanderingDeitMouseMistEffect extends BaseGameEffect
   {
      
      public var stFieldGrid:a_3491;
      
      public var _tick:int = 0;
      
      public const DAMAGE_HP:int = 10;
      
      public var m_stBOSS:IsLandWanderingDeitBoss;
      
      public function IsLandWanderingDeitMouseMistEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, boss:IsLandWanderingDeitBoss) : void
      {
         this.stFieldGrid = grid;
         this.m_stBOSS = boss;
         this._tick = 0;
         SetAnimation(0);
      }
      
      private function a_3969() : void
      {
         if(this.stFieldGrid == null)
         {
            return;
         }
         if(null != this.stFieldGrid.m_stBaseToolDefense)
         {
            this.stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            this.stFieldGrid.m_stBaseToolDefense.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stBaseToolDefense == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stProtector)
         {
            this.stFieldGrid.m_stProtector.m_iDieType = 1;
            this.stFieldGrid.m_stProtector.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stProtector == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stAttackFighter && !(this.stFieldGrid.m_stAttackFighter is a_3924))
         {
            this.stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            this.stFieldGrid.m_stAttackFighter.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stAttackFighter == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stBoomDefense)
         {
            this.stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            this.stFieldGrid.m_stBoomDefense.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stBoomDefense == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stFlowerDefense)
         {
            this.stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            this.stFieldGrid.m_stFlowerDefense.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stFlowerDefense == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            this.stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            this.stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stBaseAuxiliaryFighter == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stTrayDefense)
         {
            this.stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            this.stFieldGrid.m_stTrayDefense.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stTrayDefense == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stOceanGoddessToolDefense)
         {
            this.stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            this.stFieldGrid.m_stOceanGoddessToolDefense.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stOceanGoddessToolDefense == null)
            {
               this.RecoverBossHp();
            }
         }
         if(null != this.stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            this.stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            this.stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(this.DAMAGE_HP);
            if(this.stFieldGrid.m_stHoneyTrapBaseDefense == null)
            {
               this.RecoverBossHp();
            }
         }
      }
      
      private function RecoverBossHp() : void
      {
         this.m_stBOSS.RecoverByMist();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         if(this._tick % 10 == 0)
         {
            this.a_3969();
         }
      }
   }
}

