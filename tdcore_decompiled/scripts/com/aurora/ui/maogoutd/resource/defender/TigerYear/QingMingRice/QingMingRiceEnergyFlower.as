package com.aurora.ui.maogoutd.resource.defender.TigerYear.QingMingRice
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   
   public class QingMingRiceEnergyFlower extends a_3971
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 2;
      
      private var m_bIsStartBoom:Boolean;
      
      private var m_arrPos:Array = [[-1,0],[0,0],[1,0],[0,-1],[0,1]];
      
      public function QingMingRiceEnergyFlower()
      {
         super();
         a_1095 = QingMingRiceEnergyFlowerDefence.DEFENSE_PRICE;
         a_1275 = 0;
         a_1344 = 3;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(QingMingRiceEnergyFlower) as QingMingRiceEnergyFlower;
      }
      
      override protected function getBindMovie() : Class
      {
         return QingMingRiceEnergyFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_bIsStartBoom = false;
         stFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return QingMingRiceEnergyFlowerDefence.a_3966(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var bIsProdudeEnergy:Boolean = false;
         var iLen:int = 0;
         var i:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         a_1342 = iCurrentTime + 10;
         super.a_3957(iCurrentTime);
         trace("m_szCurrentLable++" + a_1278);
         trace("m_iCurrentFrame::" + a_1273);
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
         else if(this.m_bIsStartBoom && a_1273 == a_1274 - 1)
         {
            super.a_3969(iLifeValue);
         }
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
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? QingMingRiceEnergyFlowerDefence.a_3965(a_1094) : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stTempFieldGrid:a_3491 = a_1334;
         super.a_3940();
         if(stTempFieldGrid)
         {
            stTempFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         }
         return true;
      }
   }
}

