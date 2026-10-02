package com.aurora.ui.maogoutd.resource.defender.TigerYear.PokerShield
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   
   public class PokerShieldProtector extends a_3975
   {
      
      private var a_1398:PokerShieldProtectorBackside;
      
      private var m_isPlaced:Boolean = false;
      
      private var PRODUCE_ENERGY_NUM:int = 1;
      
      private var a_1345:uint = 1;
      
      private var a_1343:int = 0;
      
      private var a_1342:int = 0;
      
      private var tatalLifeValue:int;
      
      public function PokerShieldProtector()
      {
         super();
         a_1095 = PokerShieldDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3975
      {
         return PoolManager.getInstance().CheckOutOne(PokerShieldProtector) as PokerShieldProtector;
      }
      
      override protected function getBindMovie() : Class
      {
         return PokerShieldProtectorMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isPlaced = false;
         this.a_1398 = PokerShieldProtectorBackside.a_3926();
         this.a_1398.a_1797(a_1283);
         this.a_1398.x = 0;
         this.a_1398.y = 0;
         this.a_1398.visible = true;
         a_1338 = 4;
         super.a_1797(stFieldGrid);
         a_1339 = PokerShieldDefine.GetLifeValueByStarDegree(a_1094);
         this.tatalLifeValue = PokerShieldDefine.GetLifeValueByStarDegree(a_1094);
         this.a_1343 = PokerShieldDefine.GetProduceEnergyTime(a_1094);
         this.a_1345 = PokerShieldDefine.a_3966(m_iSkillDegree);
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
         return PokerShieldDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 / this.tatalLifeValue > 0.5 && a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else if(a_1339 / this.tatalLifeValue <= 0.5 && a_1339 / this.tatalLifeValue > 0.3 && a_1275 != 1)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(a_1339 / this.tatalLifeValue <= 0.3 && a_1339 / this.tatalLifeValue > 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         else if(a_1339 <= 0)
         {
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stBattbleFieldView:BattleFieldView = null;
         if(iCurrentTime % 3 == 0)
         {
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
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.a_1398)
         {
            this.a_1398.nextFrame();
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(0 == this.a_1342)
         {
            this.a_1342 = iCurrentTime;
         }
         if(iCurrentTime >= this.a_1342 + this.a_1343)
         {
            this.a_1342 = iCurrentTime;
            this.ProdudeEnergy();
         }
         if(!this.m_isPlaced)
         {
            this.a_1398.a_1797(a_1283);
            this.a_1398.x = x + 10;
            this.a_1398.y = y - 1;
            stBattbleFieldView = a_1334.m_stCurrentBattbleFieldView;
            stBattbleFieldView.AddToBattleView(this.a_1398,BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE,a_1334);
            this.m_isPlaced = true;
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1342 = 0;
         if(this.a_1398)
         {
            this.a_1398.a_3940();
         }
         return true;
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 0; iIndex < this.PRODUCE_ENERGY_NUM; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? int(this.a_1345) : 5;
               iEnergyValue *= EnergyRate;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
   }
}

