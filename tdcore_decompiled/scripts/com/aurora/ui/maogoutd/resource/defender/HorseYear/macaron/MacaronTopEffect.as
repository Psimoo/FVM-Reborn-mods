package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class MacaronTopEffect extends BaseGameEffect
   {
      
      private var m_iStartTime:int = -1;
      
      private var m_iID:int = 0;
      
      private var m_bHasBegin:Boolean = false;
      
      private var m_lDamage:Array = [];
      
      private var m_stTopEffect:MacaronBottomEffect;
      
      public function MacaronTopEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, trans:int, iHurtPower:int) : void
      {
         if(this.m_bHasBegin == false)
         {
            SetAnimationOnce2Loop(0,1);
            this.m_iID = trans * 1000 + grid.m_iYGridNo * 100 + grid.m_iXGridNo;
            this.m_iStartTime = -1;
            this.m_bHasBegin = true;
            this.m_stTopEffect = EffectManager.getInstance().CheckOutOne(MacaronBottomEffect,MacaronDefence.GetShotMovieClip2(trans)) as MacaronBottomEffect;
            grid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stTopEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
            this.m_stTopEffect.x = a_3491.a_1080 * (grid.m_iXGridNo + 0.5);
            this.m_stTopEffect.y = a_3491.a_1081 * (grid.m_iYGridNo + 0.5);
            this.m_stTopEffect.SetAnimationOnce2Loop(0,1);
            this.m_lDamage.length = 0;
         }
         var damageQueue:MacaronDamageQueue = new MacaronDamageQueue();
         damageQueue.InitData(grid,trans,iHurtPower);
         this.m_lDamage.push(damageQueue);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var damageQueue:MacaronDamageQueue = null;
         var count:int = 0;
         var i:* = 0;
         ++this.m_iStartTime;
         if(this.m_iStartTime == 2)
         {
            this.m_iStartTime = 0;
            count = int(this.m_lDamage.length);
            for(i = int(count - 1); i >= 0; i--)
            {
               damageQueue = this.m_lDamage[i];
               damageQueue.CreateDamage();
               if(damageQueue.HasFinish())
               {
                  this.m_lDamage.splice(i,1);
               }
            }
            if(this.m_lDamage.length <= 0)
            {
               this.Reset();
               SetAnimation(2,true);
               if(this.m_stTopEffect != null)
               {
                  this.m_stTopEffect.SetAnimation(2,true);
                  this.m_stTopEffect = null;
               }
            }
         }
         super.a_4109(a_4730);
      }
      
      private function Reset() : void
      {
         if(this.m_iID != 0)
         {
            delete MacaronDefence.m_dictEffect[this.m_iID];
         }
         this.m_iID = 0;
         this.m_lDamage.length = 0;
         this.m_bHasBegin = false;
      }
      
      override public function a_3940() : Boolean
      {
         this.Reset();
         return super.a_3940();
      }
   }
}

