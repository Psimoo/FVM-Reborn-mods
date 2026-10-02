package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VampireBossTailMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      private var m_iGoTargetFieldTime:int;
      
      public var m_iMummyMouseMoveIntruderGlobalID:uint;
      
      public var m_isShotDaoGuang:Boolean = false;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public function VampireBossTailMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VampireBossTailMoveIntruder) as VampireBossTailMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VampireBossTailMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 900;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1463 = true;
         this.m_iMummyMouseMoveIntruderGlobalID = 0;
         this.m_iGoTargetFieldTime = 0;
         a_1275 = 1;
         gotoAndStop(1);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 300)
         {
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stDaoGuangMoveIntruder:a_4206 = null;
         var stMummyMouseMoveIntruder:a_4206 = null;
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetYPos = y;
            if(this.m_isShotDaoGuang)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 1;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 10 && this.m_isShotDaoGuang)
         {
            stDaoGuangMoveIntruder = VampireBossDaoGuangMoveIntruder.a_3926();
            if(stDaoGuangMoveIntruder)
            {
               stDaoGuangMoveIntruder.a_1797(0,-1);
               stDaoGuangMoveIntruder.iGlobalMoveFighterID = this.m_iMummyMouseMoveIntruderGlobalID;
               stDaoGuangMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stDaoGuangMoveIntruder,m_stCurrentFieldGrid);
               stDaoGuangMoveIntruder.x = BattleFieldView.a_1013 - 20;
               stDaoGuangMoveIntruder.y = BattleFieldView.a_1014 - stDaoGuangMoveIntruder.height - 40;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDaoGuangMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 38 && !this.m_isShotDaoGuang)
         {
            if(m_stCurrentFieldGrid.m_stProtector)
            {
               m_stCurrentFieldGrid.m_stProtector.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stProtector.a_3969(m_stCurrentFieldGrid.m_stProtector.iLifeValue);
            }
            else if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && !(m_stCurrentFieldGrid.m_stAttackFighter is a_3924))
            {
               m_stCurrentFieldGrid.m_stAttackFighter.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stAttackFighter.a_3969(m_stCurrentFieldGrid.m_stAttackFighter.iLifeValue);
            }
            else if(m_stCurrentFieldGrid.HasNewSlot())
            {
               m_stCurrentFieldGrid.DamageNewSlot(false,0,true,0,1);
            }
            else if(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
            {
               m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.a_3969(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            }
            else if(m_stCurrentFieldGrid.m_stFlowerDefense)
            {
               m_stCurrentFieldGrid.m_stFlowerDefense.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stFlowerDefense.a_3969(m_stCurrentFieldGrid.m_stFlowerDefense.iLifeValue);
            }
            else
            {
               if(!m_stCurrentFieldGrid.m_stBoomDefense)
               {
                  return true;
               }
               m_stCurrentFieldGrid.m_stBoomDefense.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stBoomDefense.a_3969(m_stCurrentFieldGrid.m_stBoomDefense.iLifeValue);
            }
            stMummyMouseMoveIntruder = MummyMouseMoveIntruder.a_3926();
            if(stMummyMouseMoveIntruder)
            {
               stMummyMouseMoveIntruder.a_1797(0,-1);
               stMummyMouseMoveIntruder.iGlobalMoveFighterID = this.m_iMummyMouseMoveIntruderGlobalID;
               stMummyMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMummyMouseMoveIntruder,m_stCurrentFieldGrid);
               stMummyMouseMoveIntruder.x = x - 70;
               stMummyMouseMoveIntruder.y = y - 22;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stMummyMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function GoTargetFieldGrid() : void
      {
         this.m_iGoTargetFieldTime = 38;
      }
   }
}

