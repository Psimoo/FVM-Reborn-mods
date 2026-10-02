package com.aurora.ui.maogoutd.resource.defender.CattleYear.CanCattle
{
   import a_4718.b_180;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   
   public dynamic class CanCattleSecondDefence extends a_3960
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 3;
      
      private static var ms_arrPaprikaBoom:Array = new Array();
      
      private var iCellEnergyValue:int = 120;
      
      private var m_allEnergyValue:int = 0;
      
      private var m_bIsStartBoom:Boolean;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function CanCattleSecondDefence()
      {
         super();
         a_1330 = 2;
         a_1333 = true;
         m_iBoomType = 1;
         a_1337 = 2;
         this.m_bIsStartBoom = false;
         a_1095 = CanCattleDefence.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3960
      {
         var stPaprikaBoomDefense:a_3960 = null;
         stPaprikaBoomDefense = ms_arrPaprikaBoom.pop();
         if(null == stPaprikaBoomDefense)
         {
            stPaprikaBoomDefense = new CanCattleSecondDefence();
         }
         stPaprikaBoomDefense.visible = true;
         return stPaprikaBoomDefense;
      }
      
      override protected function a_3964() : int
      {
         return CanCattleDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         a_1789.getInstance().removeEventListener("AddEnergyValue",this.OnAddEnergyValue);
         if(-1 == ms_arrPaprikaBoom.indexOf(this))
         {
            ms_arrPaprikaBoom.push(this);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return CanCattleSecondDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_bIsStartBoom = false;
         this.m_allEnergyValue = 0;
         a_1789.getInstance().addEventListener("AddEnergyValue",this.OnAddEnergyValue);
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                  this.m_bIsStartBoom = true;
               }
            }
            else
            {
               this.a_4210();
               this.ProdudeEnergy();
               super.a_3969(iRduceLifeValue);
            }
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         if(this.m_bIsStartBoom && a_1273 == a_1274 - 6)
         {
            this.a_4210();
         }
         else if(this.m_bIsStartBoom && a_1273 == a_1274 - 4)
         {
            this.ProdudeEnergy();
         }
         else if(this.m_bIsStartBoom && a_1273 == a_1274)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
      
      private function OnAddEnergyValue(stDataEvent:a_1778) : void
      {
         this.m_allEnergyValue += stDataEvent.dataObject;
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iAllEnergyValue:int = this.m_allEnergyValue * CanCattleDefence.a_3965(a_1094);
         iAllEnergyValue = iAllEnergyValue > 4000 ? 4000 : iAllEnergyValue;
         var iEnergyNum:int = Math.floor(iAllEnergyValue / this.iCellEnergyValue);
         var iRestEnergy:int = iAllEnergyValue - iEnergyNum * this.iCellEnergyValue;
         for(var iIndex:int = 0; iIndex < iEnergyNum; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,this.iCellEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
         if(iRestEnergy > 0)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iRestEnergy,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      private function a_4210() : void
      {
         if(a_1334 != null)
         {
            this.a_4360(a_1334);
            a_1334.m_stCurrentBattbleFieldView.a_3466();
         }
      }
      
      private function a_4360(stFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      protected function a_3955() : Number
      {
         return width * 0.1;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
   }
}

