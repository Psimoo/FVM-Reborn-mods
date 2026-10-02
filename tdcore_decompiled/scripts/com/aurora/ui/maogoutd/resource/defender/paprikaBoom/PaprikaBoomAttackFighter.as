package com.aurora.ui.maogoutd.resource.defender.paprikaBoom
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   
   public class PaprikaBoomAttackFighter extends a_3960
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 2;
      
      private var m_bIsStartBoom:Boolean;
      
      private var m_arrPos:Array = [[-1,0],[0,0],[1,0],[0,-1],[0,1]];
      
      public function PaprikaBoomAttackFighter()
      {
         super();
         a_1095 = PaprikaBoomDefine.DEFENSE_PRICE;
         a_1330 = 2;
         a_1333 = true;
         m_iBoomType = 1;
         this.m_bIsStartBoom = false;
         a_1339 = 5;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(PaprikaBoomAttackFighter) as PaprikaBoomAttackFighter;
      }
      
      override protected function a_3964() : int
      {
         return PaprikaBoomDefine.a_3964(m_iSkillDegree);
      }
      
      override protected function getBindMovie() : Class
      {
         return PaprikaBoomAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_bIsStartBoom = false;
         a_1339 = 1000;
         return true;
      }
      
      override protected function a_3965() : int
      {
         return PaprikaBoomDefine.a_3965(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var bIsProdudeEnergy:Boolean = false;
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
            bIsProdudeEnergy = false;
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
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4210();
                        if(stMoveIntruder.iLifeValue <= 0)
                        {
                           bIsProdudeEnergy = true;
                        }
                     }
                  }
               }
            }
            if(bIsProdudeEnergy)
            {
               this.ProdudeEnergy();
            }
            else
            {
               trace("没有能量");
            }
         }
         else if(this.m_bIsStartBoom && a_1273 == a_1274)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 0; iIndex < PRODUCE_ENERGY_NUM; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? this.a_3965() : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
   }
}

