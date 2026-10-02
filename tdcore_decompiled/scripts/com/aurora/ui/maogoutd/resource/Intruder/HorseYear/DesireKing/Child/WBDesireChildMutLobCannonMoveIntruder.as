package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class WBDesireChildMutLobCannonMoveIntruder extends WBVariationCardMoveIntruder
   {
      
      private var _waitingTick:int = 0;
      
      public function WBDesireChildMutLobCannonMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBVariationCardMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireChildMutLobCannonMoveIntruder,WBDesireChildMutLobCannonMovie) as WBDesireChildMutLobCannonMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimation(0,0);
         this._waitingTick = -1;
         return true;
      }
      
      private function CheckAttackIndex() : int
      {
         for(var i:* = int(BattleFieldView.a_1011 - 1); i >= 0; i--)
         {
            if(BattleDestroyUtil.HasDefense(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,m_stCurrentFieldGrid.m_iYGridNo)))
            {
               return i;
            }
         }
         return BattleFieldView.a_1011 - 1;
      }
      
      private function DoAttack() : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.CheckAttackIndex(),m_stCurrentFieldGrid.m_iYGridNo);
         if(grid == null)
         {
            return;
         }
         var effect:WBDesireChildMutLobShotEffect = BattleEffectUtil.CreateGameEffect(WBDesireChildMutLobShotEffect,WBDesireChildMutLobShotMovie,grid) as WBDesireChildMutLobShotEffect;
         effect.InitData(grid);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         if(iCurrentTime % 2 == 1)
         {
            return true;
         }
         if(this._waitingTick == -1)
         {
            if(a_1273 == 6)
            {
               this._waitingTick = -1;
               SetAnimation(2,2);
            }
            else if(a_1273 == 33)
            {
               this.DoAttack();
            }
            else if(a_1273 == 38)
            {
               this._waitingTick = 0;
               SetAnimation(1,1);
            }
         }
         else
         {
            ++this._waitingTick;
            if(this._waitingTick == 80)
            {
               this._waitingTick = -1;
               SetAnimation(2,2);
            }
         }
         return true;
      }
   }
}

