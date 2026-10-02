package com.aurora.ui.maogoutd.compositemap
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher.BottomSnowEffect;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher.TopSnowEffect;
   
   public class SnowMapManager
   {
      
      private static var _instance:SnowMapManager;
      
      public var m_arrTopEffect:Array = [];
      
      public var m_arrBottomEffect:Array = [];
      
      public var m_stCurrentBattleFieldView:BattleFieldView;
      
      public var m_FrozenTime:int;
      
      public var m_FrozenCDTime:int;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var startcood:int;
      
      private var SnowIndex:int = -1;
      
      private var SnaowArray:Array = new Array([2,4],[2,2],[6,2],[6,4]);
      
      private var a_1598:a_3491;
      
      private var tempDefenseArr:Array = new Array(286458240,286458254,286458255,286396464,286396478,286396479);
      
      public function SnowMapManager()
      {
         super();
      }
      
      public static function getInstance() : SnowMapManager
      {
         if(SnowMapManager._instance == null)
         {
            SnowMapManager._instance = new SnowMapManager();
         }
         return SnowMapManager._instance;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTopEffect:TopSnowEffect = null;
         var stBottomEffect:BottomSnowEffect = null;
         for each(stTopEffect in this.m_arrTopEffect)
         {
            stTopEffect.a_4003(iTimeNum);
         }
         for each(stBottomEffect in this.m_arrBottomEffect)
         {
            stBottomEffect.a_4003(iTimeNum);
         }
         if(iTimeNum % (this.m_FrozenCDTime * 20) == 0)
         {
            this.randomFieldGrid();
            this.startcood = iTimeNum;
            this.addBottomEffect();
            this.addTopEffect();
         }
         if(this.startcood != 0 && iTimeNum - this.startcood == 20 * 3)
         {
            this.removeEffectMovie();
            this.FrozenFieldGridDefense(this.a_1598);
         }
      }
      
      public function SetBattleFieldView(stBattleFieldObject:Object) : void
      {
         var info:* = undefined;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            this.m_stCurrentBattleFieldView.ms_iFrozenBrokeTime = this.m_FrozenTime;
            info = CrossServerHandler.Get().m_sitdownInfo;
            this.m_stRandomSeed.setSeed(info.m_iTableID * 100,1000);
            this.removeEffectMovie();
         }
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         ++this.SnowIndex;
         if(this.SnowIndex >= this.SnaowArray.length)
         {
            this.SnowIndex = 0;
         }
         m_iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
         m_iYGridNo = this.m_stRandomSeed.nextInt(3) + 2;
         this.a_1598 = this.m_stCurrentBattleFieldView.stFieldGridsVector[m_iYGridNo][m_iXGridNo];
      }
      
      private function addBottomEffect() : void
      {
         var xStart:int = 0;
         var yStart:int = 0;
         var stEffect:BottomSnowEffect = null;
         xStart = Math.max(this.a_1598.m_iXGridNo - 2,0);
         yStart = Math.max(this.a_1598.m_iYGridNo - 2,0);
         stEffect = BottomSnowEffect.a_3926();
         stEffect.a_1797(false);
         stEffect.x = a_3491.a_1080 * xStart;
         stEffect.y = a_3491.a_1081 * yStart + 6;
         this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,this.a_1598.m_stCurrentBattbleFieldView.stFieldGridsVector[yStart][xStart]);
         this.m_arrBottomEffect.push(stEffect);
      }
      
      private function addTopEffect() : void
      {
         var xStart:int = 0;
         var yStart:int = 0;
         var stEffect:TopSnowEffect = null;
         xStart = Math.max(this.a_1598.m_iXGridNo - 2,0);
         yStart = Math.max(this.a_1598.m_iYGridNo - 2,0);
         stEffect = TopSnowEffect.a_3926();
         stEffect.a_1797(false);
         stEffect.x = a_3491.a_1080 * xStart - 135;
         stEffect.y = a_3491.a_1081 * yStart - 135;
         this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.a_1598.m_stCurrentBattbleFieldView.stFieldGridsVector[yStart][xStart]);
         this.m_arrTopEffect.push(stEffect);
      }
      
      public function removeEffectMovie() : void
      {
         var stTopEffect:TopSnowEffect = null;
         var stBottomEffect:BottomSnowEffect = null;
         for each(stTopEffect in this.m_arrTopEffect)
         {
            stTopEffect.a_3940();
         }
         for each(stBottomEffect in this.m_arrBottomEffect)
         {
            stBottomEffect.a_3940();
         }
         while(this.m_arrTopEffect.length > 0)
         {
            this.m_arrTopEffect.pop();
         }
         while(this.m_arrBottomEffect.length > 0)
         {
            this.m_arrBottomEffect.pop();
         }
      }
      
      protected function FrozenFieldGridDefense(a_1334:a_3491) : Boolean
      {
         var xIndex:int = 0;
         if(a_1334 == null)
         {
            return false;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.FrozenCard(stFieldGridVector[yIndex][xIndex]);
            }
         }
         return true;
      }
      
      private function FrozenCard(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBaseToolDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseToolDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stProtector)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stProtector.a_3512()) == -1)
            {
               stFieldGrid.m_stProtector.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stAttackFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBoomDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stFlowerDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stFlowerDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_isShowFrozen = true;
            }
         }
      }
      
      public function a_4177() : Boolean
      {
         this.SnowIndex = -1;
         if(this.m_stCurrentBattleFieldView != null)
         {
            this.m_stCurrentBattleFieldView.ms_iFrozenBrokeTime = 60;
         }
         this.removeEffectMovie();
         return true;
      }
   }
}

