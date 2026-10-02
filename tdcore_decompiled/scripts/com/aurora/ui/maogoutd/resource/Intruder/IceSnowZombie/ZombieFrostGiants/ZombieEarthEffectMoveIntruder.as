package com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombieFrostGiants
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class ZombieEarthEffectMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1500;
      
      private const HURT_HP:int = 750;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      private var lastFieldGrid:a_3491;
      
      private var m_isAddHole:Boolean;
      
      public function ZombieEarthEffectMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieEarthEffectMoveIntruder) as ZombieEarthEffectMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieEarthEffectMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (1 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1462 = true;
         a_1275 = 0;
         this.m_iAppearedTime = 0;
         a_1279 = -64;
         a_1467 = -20;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iFieldGridType == 1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1283 && x <= 0 || a_1283 && x >= BattleFieldView.a_1013)
         {
            x += a_1350 * a_1470;
            if(!a_1283 && x <= -40 || a_1283 && x >= BattleFieldView.a_1013 + 40)
            {
               this.a_3940();
               return true;
            }
            return true;
         }
         if(a_1474 <= 0 && iCurrentTime >= a_1472 + a_1471 && ((m_stCurrentFieldGrid.m_stProtector == null || m_stCurrentFieldGrid.m_stProtector.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stAttackFighter == null || m_stCurrentFieldGrid.m_stAttackFighter.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stFlowerDefense == null || m_stCurrentFieldGrid.m_stFlowerDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter == null || m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stTrayDefense == null || m_stCurrentFieldGrid.m_stTrayDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense == null || m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stOceanGoddessToolDefense == null || m_stCurrentFieldGrid.m_stOceanGoddessToolDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stBoomDefense == null || m_stCurrentFieldGrid.m_stBoomDefense.m_isShowFrozen || !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten) || a_1464))
         {
            a_1472 = iCurrentTime;
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               ChangeFieldGrid(stNextFieldGrid);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         this.a_3502(m_stCurrentFieldGrid);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(this.lastFieldGrid == stFieldGrid)
         {
            return false;
         }
         this.lastFieldGrid = stFieldGrid;
         this.m_isAddHole = stFieldGrid.m_isShowFrozen;
         stFieldGrid.ClearFieldGridDefenseWithOption();
         if(this.m_isAddHole)
         {
            this.addEarthHole(stFieldGrid);
         }
         return true;
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stIceEarthHole:ZombieIceEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         stIceEarthHole = ZombieIceEarthHole.a_3926();
         stIceEarthHole.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
         stIceEarthHole.a_1797(a_1283);
         stIceEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
         stIceEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stIceEarthHole.width);
         stIceEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stIceEarthHole.height) - 15;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stIceEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stIceEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stIceEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stIceEarthHole;
         if(a_1283)
         {
            stIceEarthHole.x = BattleFieldView.a_1013 - stIceEarthHole.x;
         }
      }
      
      protected function ClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
   }
}

