package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class WBDesireChildMutAnglerMoveIntruder extends WBVariationCardMoveIntruder
   {
      
      private var _waitingTick:int = 0;
      
      public function WBDesireChildMutAnglerMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBVariationCardMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireChildMutAnglerMoveIntruder,WBDesireChildMutAnglerMovie) as WBDesireChildMutAnglerMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimation(0,0);
         this._waitingTick = -1;
         return true;
      }
      
      public function DoAttack(grid:a_3491) : void
      {
         if(grid == null)
         {
            return;
         }
         var effect:WBDesireChildMutAnglerShotEffect = BattleEffectUtil.CreateGameEffect(WBDesireChildMutAnglerShotEffect,WBDesireChildMutAnglerShotMovie,grid) as WBDesireChildMutAnglerShotEffect;
         effect.InitData(grid);
         effect.x -= 29;
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
            else if(a_1273 == 26)
            {
               this.DoAttack(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1));
               this.DoAttack(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1));
               this.DoAttack(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 28)
            {
               this._waitingTick = 0;
               SetAnimation(1,1);
            }
         }
         else
         {
            ++this._waitingTick;
            if(this._waitingTick == 20)
            {
               this._waitingTick = -1;
               SetAnimation(2,2);
            }
         }
         return true;
      }
   }
}

