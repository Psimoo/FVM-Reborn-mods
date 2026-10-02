package com.aurora.ui.maogoutd.resource.defender.PigYear.CatProtector
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
   
   public class CatStoveFirstTransProtector extends a_3975
   {
      
      private var a_1398:CatStoveFirstTransProtectorBackside;
      
      private var m_isPlaced:Boolean = false;
      
      private var PRODUCE_ENERGY_NUM:int = 1;
      
      private var a_1343:int = 0;
      
      private var a_1342:int = 0;
      
      public function CatStoveFirstTransProtector()
      {
         super();
         a_1095 = 125;
      }
      
      public static function a_3926() : a_3975
      {
         return PoolManager.getInstance().CheckOutOne(CatStoveFirstTransProtector) as CatStoveFirstTransProtector;
      }
      
      override protected function getBindMovie() : Class
      {
         return CatStoveFirstTransProtectorMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isPlaced = false;
         this.a_1398 = CatStoveFirstTransProtectorBackside.a_3926();
         this.a_1398.a_1797(a_1283);
         this.a_1398.x = 0;
         this.a_1398.y = 0;
         this.a_1398.visible = true;
         a_1338 = 5;
         super.a_1797(stFieldGrid);
         a_1339 = this.GetCardStarLifeValue();
         this.a_1343 = this.a_3965();
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
         return 150;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 320 && a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else if(a_1339 <= 320 && a_1339 > 180 && a_1275 != 1)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(a_1339 <= 180 && a_1339 > 0 && a_1275 != 2)
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
            this.a_1398.x = x + 11;
            this.a_1398.y = y - 11;
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
      
      override protected function a_3965() : int
      {
         return 500 - 20 * a_1094;
      }
      
      protected function GetCardStarLifeValue() : int
      {
         var isStartDegreeEffect:int = 20;
         switch(a_1094)
         {
            case 0:
               isStartDegreeEffect = 20;
               break;
            case 1:
               isStartDegreeEffect = 20;
               break;
            case 2:
               isStartDegreeEffect = 20;
               break;
            case 3:
               isStartDegreeEffect = 30;
               break;
            case 4:
               isStartDegreeEffect = 30;
               break;
            case 5:
               isStartDegreeEffect = 30;
               break;
            case 6:
               isStartDegreeEffect = 40;
               break;
            case 7:
               isStartDegreeEffect = 40;
               break;
            case 8:
               isStartDegreeEffect = 40;
               break;
            case 9:
               isStartDegreeEffect = 50;
               break;
            case 10:
               isStartDegreeEffect = 50;
               break;
            case 11:
               isStartDegreeEffect = 50;
               break;
            case 12:
               isStartDegreeEffect = 60;
               break;
            case 13:
               isStartDegreeEffect = 65;
               break;
            case 14:
               isStartDegreeEffect = 70;
               break;
            case 15:
               isStartDegreeEffect = 80;
               break;
            case 16:
               isStartDegreeEffect = 90;
         }
         return isStartDegreeEffect * 10;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 28;
         if(m_iSkillDegree == 1)
         {
            iSkillDegreeEffect = 30;
         }
         else if(m_iSkillDegree == 2)
         {
            iSkillDegreeEffect = 32;
         }
         else if(m_iSkillDegree == 3)
         {
            iSkillDegreeEffect = 34;
         }
         else if(m_iSkillDegree == 4)
         {
            iSkillDegreeEffect = 37;
         }
         else if(m_iSkillDegree == 5)
         {
            iSkillDegreeEffect = 40;
         }
         else if(m_iSkillDegree == 6)
         {
            iSkillDegreeEffect = 44;
         }
         else if(m_iSkillDegree == 7)
         {
            iSkillDegreeEffect = 48;
         }
         else if(m_iSkillDegree == 8)
         {
            iSkillDegreeEffect = 52;
         }
         return iSkillDegreeEffect;
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
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? this.a_3966() : 5;
               iEnergyValue *= EnergyRate;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
   }
}

