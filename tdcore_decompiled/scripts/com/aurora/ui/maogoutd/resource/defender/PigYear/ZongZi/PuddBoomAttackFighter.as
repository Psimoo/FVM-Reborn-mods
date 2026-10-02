package com.aurora.ui.maogoutd.resource.defender.PigYear.ZongZi
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class PuddBoomAttackFighter extends a_3960
   {
      
      private var m_bIsStartBoom:Boolean;
      
      private var m_arrPos:Array = [[-1,0],[0,0],[1,0],[0,-1],[0,1]];
      
      public function PuddBoomAttackFighter()
      {
         super();
         a_1095 = PuddBoomDefine.DEFENSE_PRICE;
         a_1330 = 2;
         a_1333 = true;
         m_iBoomType = 1;
         a_1337 = 13;
         this.m_bIsStartBoom = false;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(PuddBoomAttackFighter) as PuddBoomAttackFighter;
      }
      
      override protected function a_3964() : int
      {
         return PuddBoomDefine.a_3964(a_1094);
      }
      
      override protected function getBindMovie() : Class
      {
         return PuddBoomAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_bIsStartBoom = false;
         a_1339 = 1000;
         return true;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var iLen:int = 0;
         var i:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         if(!this.m_bIsStartBoom && null != a_1334 && a_1334.m_isOccupy && a_1334.a_1511.length > 0)
         {
            this.m_bIsStartBoom = true;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(this.m_bIsStartBoom && a_1273 == a_1274 - 4)
         {
            BattleFieldView.a_1048.play();
            iLen = int(this.m_arrPos.length);
            for(i = 0; i < iLen; i++)
            {
               iXGridNo = a_1334.m_iXGridNo + this.m_arrPos[i][0];
               iYGridNo = a_1334.m_iYGridNo + this.m_arrPos[i][1];
               stCurFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               if(null != stCurFieldGrid)
               {
                  arrMoveIntruder = stCurFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(300);
                     if(stMoveIntruder.iLifeValue <= 0)
                     {
                        stMoveIntruder.ShowBoomDieEffect();
                     }
                     else
                     {
                        stMoveIntruder.a_4208(b_182.a_433,50);
                     }
                  }
               }
            }
         }
         else if(this.m_bIsStartBoom && a_1273 == a_1274)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
   }
}

