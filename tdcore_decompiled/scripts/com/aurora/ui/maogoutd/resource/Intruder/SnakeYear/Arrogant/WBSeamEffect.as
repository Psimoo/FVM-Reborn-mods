package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class WBSeamEffect extends a_4108
   {
      
      private var m_stGrid:a_3491;
      
      private var _runTick:int = 0;
      
      private var _leaveTick:int = -1;
      
      private var m_stBoss:WBArrogantBoss3MoveInteuder;
      
      private var oldType:int = 0;
      
      public function WBSeamEffect()
      {
         super();
      }
      
      public static function a_3926() : WBSeamEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBSeamEffect) as WBSeamEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBSeamEffectMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         a_1279 = -8;
         m_iYDisplayCenterPos = -27;
         this.visible = true;
         gotoAndStop(1);
         play();
         this.oldType = 0;
         return true;
      }
      
      public function InitData(fieldGrid:a_3491, boss:WBArrogantBoss3MoveInteuder) : void
      {
         this.m_stGrid = fieldGrid;
         this.SetAnimation(0);
         this._runTick = 0;
         this._leaveTick = -1;
         this.m_stBoss = boss;
      }
      
      public function ClearFieldGridDefenseNoraml2(grid:a_3491) : Boolean
      {
         if(null != grid.m_stProtector)
         {
            grid.m_stProtector.m_iDieType = 2;
            grid.m_stProtector.a_3969(grid.m_stProtector.iLifeValue);
         }
         if(null != grid.m_stAttackFighter && !(grid.m_stAttackFighter is a_3924))
         {
            grid.m_stAttackFighter.m_iDieType = 2;
            grid.m_stAttackFighter.a_3969(grid.m_stAttackFighter.iLifeValue);
         }
         if(null != grid.m_stBoomDefense)
         {
            grid.m_stBoomDefense.m_iDieType = 2;
            grid.m_stBoomDefense.a_3969(grid.m_stBoomDefense.iLifeValue);
         }
         if(null != grid.m_stFlowerDefense)
         {
            grid.m_stFlowerDefense.m_iDieType = 2;
            grid.m_stFlowerDefense.a_3969(grid.m_stFlowerDefense.iLifeValue);
         }
         grid.DamageNewSlot(true,0,true,0,2);
         if(null != grid.m_stBaseAuxiliaryFighter)
         {
            grid.m_stBaseAuxiliaryFighter.m_iDieType = 2;
            grid.m_stBaseAuxiliaryFighter.a_3969(grid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != grid.m_stTrayDefense)
         {
            grid.m_stTrayDefense.m_iDieType = 2;
            grid.m_stTrayDefense.a_3969(grid.m_stTrayDefense.iLifeValue);
         }
         if(null != grid.m_stBaseToolDefense)
         {
            grid.m_stBaseToolDefense.m_iDieType = 2;
            grid.m_stBaseToolDefense.a_3969(grid.m_stBaseToolDefense.iLifeValue);
         }
         return true;
      }
      
      public function OnStopperPlace() : void
      {
         if(this.m_stGrid.m_isExistMouseHole == true)
         {
            this.SetAnimationOnce2Loop(3,3);
         }
      }
      
      private function UpdateCheck() : void
      {
         ++this._runTick;
         if(this._runTick == 30)
         {
            this.Change2Hole();
         }
         if(this._leaveTick != -1)
         {
            --this._leaveTick;
            if(this._leaveTick == 0)
            {
               this._leaveTick = 100;
               this.CreateBat();
            }
         }
      }
      
      private function CreateBat() : void
      {
         var iOffsetX:int = this.m_stBoss.GetRandomSeed().nextInt(3) - 1;
         var iOffsetY:int = this.m_stBoss.GetRandomSeed().nextInt(3) - 1;
         while(iOffsetX == 0 && iOffsetY == 0)
         {
            iOffsetX = this.m_stBoss.GetRandomSeed().nextInt(3) - 1;
            iOffsetY = this.m_stBoss.GetRandomSeed().nextInt(3) - 1;
         }
         this.CreateBat2(this.m_stGrid.m_iXGridNo + iOffsetX,this.m_stGrid.m_iYGridNo + iOffsetY);
      }
      
      private function CreateBat2(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var bat:WBArrogantBatMoveInteuder = null;
         grid1 = this.m_stGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         bat = WBArrogantBatMoveInteuder.a_3926() as WBArrogantBatMoveInteuder;
         bat.a_1797(0,-1);
         bat.iGlobalMoveFighterID = this.m_stBoss.GetGuardGlobalID2();
         bat.m_stMoveIntruderTypeID = 8388608;
         bat.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         this.m_stGrid.m_stCurrentBattbleFieldView.a_3459(bat,grid1);
         this.m_stGrid.m_stCurrentBattbleFieldView.AddToBattleView(bat,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         bat.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
         bat.SetSeanCreate();
      }
      
      private function Change2Hole() : void
      {
         this.addShield(this.m_stGrid);
         this.SetAnimationOnce2Loop(1,2);
         this.ClearFieldGridDefenseNoraml2(this.m_stGrid);
         this._leaveTick = 10;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_isExistMouseHole = true;
            this.oldType = stFieldGrid.m_iFieldGridType;
            stFieldGrid.m_iFieldGridType = 8;
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_isExistMouseHole = false;
            stFieldGrid.m_iFieldGridType = this.oldType;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(this.m_stGrid);
         this.m_stGrid = null;
         if(this.m_stBoss != null)
         {
            this.m_stBoss.RemoveHole(this);
            this.m_stBoss = null;
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         this.UpdateCheck();
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SetAnimation(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
   }
}

