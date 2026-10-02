package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class WBDesireChildMutPineBreadMoveIntruder extends WBVariationCardMoveIntruder
   {
      
      private var a_1334:a_3491;
      
      private var m_bBoomDieType:Boolean = false;
      
      public function WBDesireChildMutPineBreadMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBVariationCardMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireChildMutPineBreadMoveIntruder,WBDesireChildMutPineBreadMovie) as WBDesireChildMutPineBreadMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.a_1334 = null;
         this.m_bBoomDieType = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 30000)
         {
            SetAnimation(1,1);
         }
         else if(a_1339 > 20000)
         {
            SetAnimation(2,2);
         }
         else if(a_1339 > 10000)
         {
            SetAnimation(3,3);
         }
         else
         {
            this.a_1334 = m_stCurrentFieldGrid;
            if(this.m_bBoomDieType == false || this.a_1334 == null)
            {
               a_1339 = 0;
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
            }
            else
            {
               SetDeadAnim(4);
            }
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         var i:int = 0;
         var j:int = 0;
         super.a_4140(iCurrentTime);
         if(iCurrentTime % 2 == 0 && a_1273 == 52)
         {
            if(this.a_1334 != null)
            {
               iNoX = this.a_1334.m_iXGridNo;
               iNoY = this.a_1334.m_iYGridNo;
               for(i = 0; i <= 1; i++)
               {
                  for(j = 0; j <= 1; j++)
                  {
                     BattleDestroyUtil.ClearOneGridIgnoreFangYu(this.a_1334.m_stCurrentBattbleFieldView.a_3438(iNoX + i,iNoY + j));
                  }
               }
            }
         }
      }
      
      override public function a_4212() : Boolean
      {
         a_1339 = 0;
         this.m_bBoomDieType = true;
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         this.m_bBoomDieType = true;
         this.ResetMovieStatus();
         return true;
      }
   }
}

