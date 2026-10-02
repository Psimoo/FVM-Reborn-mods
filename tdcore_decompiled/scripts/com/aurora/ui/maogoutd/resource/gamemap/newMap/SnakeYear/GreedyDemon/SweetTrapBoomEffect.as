package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class SweetTrapBoomEffect extends a_4108
   {
      
      private var _runTick:int = 1;
      
      private var _battleView:BattleFieldView;
      
      private var _iNoX:int = -1;
      
      private var _iNoY:int = -1;
      
      public function SweetTrapBoomEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : SweetTrapBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(SweetTrapBoomEffect) as SweetTrapBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SweetTrapBoomEffectMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         play();
         this._runTick = 1;
         return true;
      }
      
      public function InitData(battleView:BattleFieldView, iNoX:int, iNoY:int) : void
      {
         this._battleView = battleView;
         this._iNoX = iNoX;
         this._iNoY = iNoY;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this._runTick;
         if(this._runTick == 2)
         {
            this.ClearFieldGridDefense2(this._iNoX - 1,this._iNoY - 1);
            this.ClearFieldGridDefense2(this._iNoX,this._iNoY - 1);
            this.ClearFieldGridDefense2(this._iNoX + 1,this._iNoY - 1);
            this.ClearFieldGridDefense2(this._iNoX - 1,this._iNoY);
            this.ClearFieldGridDefense2(this._iNoX,this._iNoY);
            this.ClearFieldGridDefense2(this._iNoX + 1,this._iNoY);
            this.ClearFieldGridDefense2(this._iNoX - 1,this._iNoY + 1);
            this.ClearFieldGridDefense2(this._iNoX,this._iNoY + 1);
            this.ClearFieldGridDefense2(this._iNoX + 1,this._iNoY + 1);
         }
         super.a_4109(a_4730);
      }
      
      private function ClearFieldGridDefense2(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = this._battleView.a_3438(iNoX,iNoY);
         if(grid != null)
         {
            this.a_3502(grid);
         }
      }
      
      protected function a_3502(stFieldGrid:*) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         var hasKill:Boolean = false;
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               return false;
            }
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            hasKill = true;
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            hasKill = true;
         }
         return hasKill;
      }
   }
}

