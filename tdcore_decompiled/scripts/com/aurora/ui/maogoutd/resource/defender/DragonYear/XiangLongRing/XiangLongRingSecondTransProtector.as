package com.aurora.ui.maogoutd.resource.defender.DragonYear.XiangLongRing
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class XiangLongRingSecondTransProtector extends a_3975
   {
      
      private var a_1398:XiangLongRingSecondTransProtectorBackside;
      
      private var m_isPlaced:Boolean = false;
      
      private var tatalLifeValue:int;
      
      private var appearedTimes:int = 0;
      
      private var stEffect:XiangLongRingSecondBomEffect;
      
      public function XiangLongRingSecondTransProtector()
      {
         super();
         a_1095 = XiangLongRingDefine.DEFENSE_PRICE;
         a_1338 = 4;
         a_1337 = -1;
      }
      
      public static function a_3926() : a_3975
      {
         return PoolManager.getInstance().CheckOutOne(XiangLongRingSecondTransProtector) as XiangLongRingSecondTransProtector;
      }
      
      override protected function getBindMovie() : Class
      {
         return XiangLongRingSecondTransProtectorMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isPlaced = false;
         this.a_1398 = XiangLongRingSecondTransProtectorBackside.a_3926();
         this.a_1398.a_1797(a_1283);
         this.a_1398.x = 0;
         this.a_1398.y = 0;
         this.a_1398.visible = true;
         super.a_1797(stFieldGrid);
         this.appearedTimes = -1;
         a_1339 = this.tatalLifeValue = XiangLongRingDefine.GetLifeValueByStarDegree(a_1094);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.a_1398,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      override public function set m_isShowFrozen(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShowFrozen = value;
      }
      
      override public function set m_isShihua(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShihua = value;
      }
      
      override protected function a_3964() : int
      {
         return XiangLongRingDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var range:int = 0;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(Boolean(iRduceLifeValue > 0) && Boolean(a_1334) && (m_iDieType == 1 || m_iDieType == 2))
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            range = 1;
            xStart = Math.max(stFieldGrid.m_iXGridNo - range,0);
            xEnd = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
            yStart = Math.max(stFieldGrid.m_iYGridNo - range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(iRduceLifeValue);
                  }
               }
            }
         }
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               this.addXiangLongRingSecondBomEffect();
               this.ProdudeBorenEnergy();
            }
            else if(m_iDieType == 2)
            {
               this.addXiangLongRingSecondBomEffect();
            }
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 / this.tatalLifeValue > 0.3)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
               this.a_1398.gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 / this.tatalLifeValue <= 0.3 && a_1339 / this.tatalLifeValue > 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.a_1398.gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stBattbleFieldView:BattleFieldView = null;
         if(this.appearedTimes == -1)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(this.a_1398)
            {
               this.a_1398.nextFrame();
            }
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               this.a_1398.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               this.a_1398.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
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
         if(!this.m_isPlaced)
         {
            this.a_1398.a_1797(a_1283);
            this.a_1398.x = x;
            this.a_1398.y = y;
            stBattbleFieldView = a_1334.m_stCurrentBattbleFieldView;
            stBattbleFieldView.AddToBattleView(this.a_1398,BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE,a_1334);
            this.m_isPlaced = true;
         }
      }
      
      private function addXiangLongRingSecondBomEffect() : void
      {
         var stStartFieldGrid:a_3491 = null;
         if(stFieldGrid != null)
         {
            stStartFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            if(stStartFieldGrid != null)
            {
               this.stEffect = XiangLongRingSecondBomEffect.a_3926();
               this.stEffect.m_TargetFieldGrid = stStartFieldGrid;
               this.stEffect.a_1797(false);
               this.stEffect.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
               this.stEffect.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 32;
               stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
               stStartFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this.stEffect);
               if(stStartFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  stStartFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.stEffect,stStartFieldGrid.m_iXGridNo,stStartFieldGrid.m_iYGridNo);
               }
            }
         }
      }
      
      private function ProdudeBorenEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 1; iIndex < 2; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iProduceEnergy = XiangLongRingDefine.DEFENSE_PRICE;
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x,y);
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
         super.a_3940();
         if(this.a_1398)
         {
            this.a_1398.a_3940();
         }
         return true;
      }
   }
}

