package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.BianBianPoisonGasEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GhostBossBianBianMouseMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      public var m_iMummyMouseMoveIntruderGlobalID:uint;
      
      protected var m_stPosFieldGrid:a_3491;
      
      private var m_arrBianBianPoisonGasEffect:Array = [];
      
      public function GhostBossBianBianMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GhostBossBianBianMouseMoveIntruder) as GhostBossBianBianMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GhostBossBianBianMouseMoveIntruderMovie;
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
         this.m_arrBianBianPoisonGasEffect = [];
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         var stBianBianPoisonGasEffect:BianBianPoisonGasEffect = null;
         var stFieldGrid:a_3491 = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         if(Boolean(this.m_stPosFieldGrid) && 2 == this.m_stPosFieldGrid.m_iFieldGridType)
         {
            this.m_stPosFieldGrid.m_iFieldGridType = 0;
         }
         for each(stBianBianPoisonGasEffect in this.m_arrBianBianPoisonGasEffect)
         {
            stBianBianPoisonGasEffect.RealeaseNow();
         }
         this.m_arrBianBianPoisonGasEffect = [];
         if(this.m_stPosFieldGrid)
         {
            yStart = this.m_stPosFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(this.m_stPosFieldGrid.m_iYGridNo - 1);
            xStart = this.m_stPosFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(this.m_stPosFieldGrid.m_iXGridNo - 2);
            yEnd = this.m_stPosFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.m_stPosFieldGrid.m_iYGridNo + 1);
            xEnd = this.m_stPosFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.m_stPosFieldGrid.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGrid = this.m_stPosFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                  if(null != stFieldGrid.m_stProtector)
                  {
                     stFieldGrid.m_stProtector.a_3968();
                  }
                  if(null != stFieldGrid.m_stAttackFighter)
                  {
                     stFieldGrid.m_stAttackFighter.a_3968();
                  }
                  if(null != stFieldGrid.m_stBoomDefense)
                  {
                     stFieldGrid.m_stBoomDefense.a_3968();
                  }
                  if(null != stFieldGrid.m_stFlowerDefense)
                  {
                     stFieldGrid.m_stFlowerDefense.a_3968();
                  }
                  if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
                  {
                     stFieldGrid.m_stBaseAuxiliaryFighter.a_3968();
                  }
                  if(null != stFieldGrid.m_stTrayDefense)
                  {
                     stFieldGrid.m_stTrayDefense.a_3968();
                  }
               }
            }
         }
         super.a_3940();
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
         var stFieldGrid:a_3491 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stBianBianPoisonGasEffect:BianBianPoisonGasEffect = null;
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            gotoAndStop(1);
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetYPos = y;
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(iCurrentTime - this.m_iStartTimeNum == 5)
         {
            for(yIndex = m_stCurrentFieldGrid.m_iYGridNo - 1; yIndex <= m_stCurrentFieldGrid.m_iYGridNo + 1; yIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,yIndex);
               if(stFieldGrid)
               {
                  stBianBianPoisonGasEffect = BianBianPoisonGasEffect.a_3926();
                  stBianBianPoisonGasEffect.a_1797(false);
                  stBianBianPoisonGasEffect.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - width) - 25;
                  stBianBianPoisonGasEffect.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - height) - 25;
                  parent.addChild(stBianBianPoisonGasEffect);
                  this.m_arrBianBianPoisonGasEffect.push(stBianBianPoisonGasEffect);
               }
            }
            for(xIndex = m_stCurrentFieldGrid.m_iXGridNo - 1; xIndex <= m_stCurrentFieldGrid.m_iXGridNo + 1; xIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,m_stCurrentFieldGrid.m_iYGridNo);
               if(stFieldGrid)
               {
                  stBianBianPoisonGasEffect = BianBianPoisonGasEffect.a_3926();
                  stBianBianPoisonGasEffect.a_1797(false);
                  stBianBianPoisonGasEffect.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - width) - 25;
                  stBianBianPoisonGasEffect.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - height) - 25;
                  parent.addChild(stBianBianPoisonGasEffect);
                  this.m_arrBianBianPoisonGasEffect.push(stBianBianPoisonGasEffect);
               }
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 60)
         {
            for(yIndex = m_stCurrentFieldGrid.m_iYGridNo - 1; yIndex <= m_stCurrentFieldGrid.m_iYGridNo + 1; yIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,yIndex);
               if(stFieldGrid)
               {
                  this.a_3502(stFieldGrid);
               }
            }
            for(xIndex = m_stCurrentFieldGrid.m_iXGridNo - 1; xIndex <= m_stCurrentFieldGrid.m_iXGridNo + 1; xIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,m_stCurrentFieldGrid.m_iYGridNo);
               if(stFieldGrid)
               {
                  this.a_3502(stFieldGrid);
               }
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 4000)
         {
            for(yIndex = m_stCurrentFieldGrid.m_iYGridNo - 1; yIndex <= m_stCurrentFieldGrid.m_iYGridNo + 1; yIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,yIndex);
               if(Boolean(stFieldGrid) && stFieldGrid != m_stCurrentFieldGrid)
               {
                  if(stFieldGrid.m_iYGridNo > m_stCurrentFieldGrid.m_iYGridNo)
                  {
                     stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,yIndex + 1);
                  }
                  else
                  {
                     stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,yIndex - 1);
                  }
                  if(stFieldGrid)
                  {
                     if(stFieldGrid.a_3492())
                     {
                        stBianBianPoisonGasEffect = BianBianPoisonGasEffect.a_3926();
                        stBianBianPoisonGasEffect.a_1797(false);
                        stBianBianPoisonGasEffect.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - width) - 25;
                        stBianBianPoisonGasEffect.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - height) - 25;
                        parent.addChild(stBianBianPoisonGasEffect);
                     }
                     this.a_3502(stFieldGrid);
                  }
               }
            }
            for(xIndex = m_stCurrentFieldGrid.m_iXGridNo - 1; xIndex <= m_stCurrentFieldGrid.m_iXGridNo + 1; xIndex++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,m_stCurrentFieldGrid.m_iYGridNo);
               if(Boolean(stFieldGrid) && stFieldGrid != m_stCurrentFieldGrid)
               {
                  if(stFieldGrid.m_iXGridNo > m_stCurrentFieldGrid.m_iXGridNo)
                  {
                     stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex + 1,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  else
                  {
                     stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  if(stFieldGrid)
                  {
                     if(stFieldGrid.a_3492())
                     {
                        stBianBianPoisonGasEffect = BianBianPoisonGasEffect.a_3926();
                        stBianBianPoisonGasEffect.a_1797(false);
                        stBianBianPoisonGasEffect.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - width) - 25;
                        stBianBianPoisonGasEffect.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - height) - 25;
                        parent.addChild(stBianBianPoisonGasEffect);
                     }
                     this.a_3502(stFieldGrid);
                  }
               }
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 80)
         {
            this.a_3969(iLifeValue);
            a_4212();
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

