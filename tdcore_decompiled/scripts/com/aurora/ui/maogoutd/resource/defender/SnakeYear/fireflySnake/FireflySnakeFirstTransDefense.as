package com.aurora.ui.maogoutd.resource.defender.SnakeYear.fireflySnake
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
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class FireflySnakeFirstTransDefense extends a_3971
   {
      
      private var i_StayTick:int = 0;
      
      private var m_arrHurtMouseGlobalID:Array = new Array();
      
      private var m_hurtPower:int;
      
      private var m_OutArray:Array = new Array([-35,-58],[11,-60],[-18,-90]);
      
      public function FireflySnakeFirstTransDefense()
      {
         super();
         a_1095 = FireflyDefine.DEFENSE_PRICE;
         a_1344 = 3;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FireflySnakeFirstTransDefense) as FireflySnakeFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireflySnakeFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         while(this.m_arrHurtMouseGlobalID.length > 0)
         {
            this.m_arrHurtMouseGlobalID.pop();
         }
         this.m_hurtPower = FireflyDefine.a_3966(m_iSkillDegree);
         a_1339 = FireflyDefine.LIFE_VALUE;
         this.i_StayTick = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FireflyDefine.a_3965(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         this.RealeaseSkill(stFieldGrid);
         ++this.i_StayTick;
         if(this.i_StayTick == 300)
         {
            this.i_StayTick = 0;
            this.SetAnimationOnce2Loop(1,0);
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == 16)
            {
               this.ProdudeEnergy(0);
            }
            if(a_1273 == 18)
            {
               this.ProdudeEnergy(1);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      private function RealeaseSkill(stFieldGrid:a_3491) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!stMoveIntruder.isCannotSeeByFighter && !stMoveIntruder.m_isHurtByFireFly && stMoveIntruder.m_stCurrentFieldGrid != null && this.m_arrHurtMouseGlobalID.indexOf(stMoveIntruder.globalMoveFighterID) == -1)
                  {
                     stMoveIntruder.a_3969(this.m_hurtPower);
                     stMoveIntruder.m_isHurtByFireFly = true;
                     this.m_arrHurtMouseGlobalID.push(stMoveIntruder.globalMoveFighterID);
                  }
               }
            }
         }
      }
      
      private function ProdudeEnergy(pIndex:int) : void
      {
         var offect:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 0; iIndex < 1; iIndex++)
         {
            offect = iIndex == 1 ? 1 : -1;
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iProduceEnergy = FireflyDefine.GetCardStarDegreeEffect2Value(a_1094);
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x + this.m_OutArray[pIndex][0] + offect * 10,y + this.m_OutArray[pIndex][1]);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      override public function a_3940() : Boolean
      {
         var stTempFieldGrid:a_3491 = a_1334;
         while(this.m_arrHurtMouseGlobalID.length > 0)
         {
            this.m_arrHurtMouseGlobalID.pop();
         }
         super.a_3940();
         if(stTempFieldGrid)
         {
            stTempFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         }
         return true;
      }
   }
}

