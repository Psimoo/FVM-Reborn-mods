package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.DragonBossFullBodyLightning0Effect;
   import com.aurora.ui.maogoutd.resource.effect.DragonBossFullBodyLightning1Effect;
   import com.aurora.ui.maogoutd.resource.effect.DragonBossFullBodyLightning2Effect;
   import com.aurora.ui.maogoutd.resource.effect.DragonBossFullBodyLightning3Effect;
   import com.aurora.ui.maogoutd.resource.effect.DragonBossFullBodyLightning4Effect;
   import com.aurora.ui.maogoutd.resource.effect.DragonBossFullBodyLightning5Effect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class DragonMachineBossFullBodyTailIntruder extends a_4206
   {
      
      public static var ms_arrDragonBossFullBodyLightingTail:Array = [];
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public var m_iLightingTailSequence:int;
      
      public function DragonMachineBossFullBodyTailIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DragonMachineBossFullBodyTailIntruder) as DragonMachineBossFullBodyTailIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonMachineBossFullBodyTailIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1200;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1463 = true;
         this.m_iLightingTailSequence = -1;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         if(Boolean(this.m_stPosFieldGrid) && 2 == this.m_stPosFieldGrid.m_iFieldGridType)
         {
            this.m_stPosFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         if(-1 != ms_arrDragonBossFullBodyLightingTail.indexOf(this))
         {
            ms_arrDragonBossFullBodyLightingTail.splice(ms_arrDragonBossFullBodyLightingTail.indexOf(this),1);
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stDragonBossFullBodyLightning0Effect:DragonBossFullBodyLightning0Effect = null;
         var stDragonBossFullBodyLightning1Effect:DragonBossFullBodyLightning1Effect = null;
         var stDragonBossFullBodyLightning2Effect:DragonBossFullBodyLightning2Effect = null;
         var stDragonBossFullBodyLightning3Effect:DragonBossFullBodyLightning3Effect = null;
         var stDragonBossFullBodyLightning4Effect:DragonBossFullBodyLightning4Effect = null;
         var stDragonBossFullBodyLightning5Effect:DragonBossFullBodyLightning5Effect = null;
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            gotoAndStop(1);
            a_1275 = 1;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetYPos = y;
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - this.m_iStartTimeNum == 200)
         {
            if(0 == this.m_iLightingTailSequence)
            {
               if(null != ms_arrDragonBossFullBodyLightingTail[1])
               {
                  stDragonBossFullBodyLightning0Effect = DragonBossFullBodyLightning0Effect.a_3926();
                  stDragonBossFullBodyLightning0Effect.a_1797(false);
                  stDragonBossFullBodyLightning0Effect.x = 0.5 * a_3491.a_1080;
                  stDragonBossFullBodyLightning0Effect.y = 0;
                  parent.addChild(stDragonBossFullBodyLightning0Effect);
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,0));
               }
               if(null != ms_arrDragonBossFullBodyLightingTail[2])
               {
                  stDragonBossFullBodyLightning2Effect = DragonBossFullBodyLightning2Effect.a_3926();
                  stDragonBossFullBodyLightning2Effect.a_1797(false);
                  stDragonBossFullBodyLightning2Effect.x = 0.5 * a_3491.a_1080;
                  stDragonBossFullBodyLightning2Effect.y = 0.5 * a_3491.a_1081;
                  parent.addChild(stDragonBossFullBodyLightning2Effect);
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,1));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,2));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,3));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,4));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,5));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,6));
               }
               if(null != ms_arrDragonBossFullBodyLightingTail[3])
               {
                  stDragonBossFullBodyLightning3Effect = DragonBossFullBodyLightning3Effect.a_3926();
                  stDragonBossFullBodyLightning3Effect.a_1797(false);
                  stDragonBossFullBodyLightning3Effect.x = 0.5 * a_3491.a_1080;
                  stDragonBossFullBodyLightning3Effect.y = 0.5 * a_3491.a_1081;
                  parent.addChild(stDragonBossFullBodyLightning3Effect);
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,1));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,1));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,2));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,4));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,5));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,5));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6));
               }
            }
            else if(1 == this.m_iLightingTailSequence)
            {
               if(null != ms_arrDragonBossFullBodyLightingTail[2])
               {
                  stDragonBossFullBodyLightning1Effect = DragonBossFullBodyLightning1Effect.a_3926();
                  stDragonBossFullBodyLightning1Effect.a_1797(false);
                  stDragonBossFullBodyLightning1Effect.x = 0.5 * a_3491.a_1080;
                  stDragonBossFullBodyLightning1Effect.y = 0.5 * a_3491.a_1081;
                  parent.addChild(stDragonBossFullBodyLightning1Effect);
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,1));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,1));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,2));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,4));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,5));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,5));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,6));
               }
               if(null != ms_arrDragonBossFullBodyLightingTail[3])
               {
                  stDragonBossFullBodyLightning2Effect = DragonBossFullBodyLightning2Effect.a_3926();
                  stDragonBossFullBodyLightning2Effect.a_1797(false);
                  stDragonBossFullBodyLightning2Effect.x = BattleFieldView.a_1013 - 0.5 * a_3491.a_1080;
                  stDragonBossFullBodyLightning2Effect.y = 0.5 * a_3491.a_1081;
                  parent.addChild(stDragonBossFullBodyLightning2Effect);
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,1));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,2));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,3));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,4));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,5));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,6));
               }
            }
            else if(2 == this.m_iLightingTailSequence)
            {
               if(null != ms_arrDragonBossFullBodyLightingTail[3])
               {
                  stDragonBossFullBodyLightning0Effect = DragonBossFullBodyLightning0Effect.a_3926();
                  stDragonBossFullBodyLightning0Effect.a_1797(false);
                  stDragonBossFullBodyLightning0Effect.x = 0.5 * a_3491.a_1080;
                  stDragonBossFullBodyLightning0Effect.y = BattleFieldView.a_1014 - 0.5 * a_3491.a_1081 - 0.5 * a_3491.a_1081;
                  parent.addChild(stDragonBossFullBodyLightning0Effect);
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,0));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,0));
               }
            }
            else if(3 != this.m_iLightingTailSequence)
            {
               if(4 == this.m_iLightingTailSequence)
               {
                  if(null != ms_arrDragonBossFullBodyLightingTail[5])
                  {
                     stDragonBossFullBodyLightning4Effect = DragonBossFullBodyLightning4Effect.a_3926();
                     stDragonBossFullBodyLightning4Effect.a_1797(false);
                     stDragonBossFullBodyLightning4Effect.x = 0.5 * a_3491.a_1080;
                     stDragonBossFullBodyLightning4Effect.y = 0.5 * a_3491.a_1081;
                     parent.addChild(stDragonBossFullBodyLightning4Effect);
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,2));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,1));
                  }
                  if(null != ms_arrDragonBossFullBodyLightingTail[6])
                  {
                     stDragonBossFullBodyLightning0Effect = DragonBossFullBodyLightning0Effect.a_3926();
                     stDragonBossFullBodyLightning0Effect.a_1797(false);
                     stDragonBossFullBodyLightning0Effect.x = 0.5 * a_3491.a_1080;
                     stDragonBossFullBodyLightning0Effect.y = 3.5 * a_3491.a_1081;
                     parent.addChild(stDragonBossFullBodyLightning0Effect);
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,3));
                  }
                  if(null != ms_arrDragonBossFullBodyLightingTail[7])
                  {
                     stDragonBossFullBodyLightning5Effect = DragonBossFullBodyLightning5Effect.a_3926();
                     stDragonBossFullBodyLightning5Effect.a_1797(false);
                     stDragonBossFullBodyLightning5Effect.x = 0.5 * a_3491.a_1080;
                     stDragonBossFullBodyLightning5Effect.y = 3.5 * a_3491.a_1081;
                     parent.addChild(stDragonBossFullBodyLightning5Effect);
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,4));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,5));
                  }
               }
               else if(5 == this.m_iLightingTailSequence)
               {
                  if(null != ms_arrDragonBossFullBodyLightingTail[6])
                  {
                     stDragonBossFullBodyLightning5Effect = DragonBossFullBodyLightning5Effect.a_3926();
                     stDragonBossFullBodyLightning5Effect.a_1797(false);
                     stDragonBossFullBodyLightning5Effect.x = 3.5 * a_3491.a_1080;
                     stDragonBossFullBodyLightning5Effect.y = 0.5 * a_3491.a_1081;
                     parent.addChild(stDragonBossFullBodyLightning5Effect);
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,0));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,1));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,2));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,3));
                  }
                  if(null != ms_arrDragonBossFullBodyLightingTail[7])
                  {
                     stDragonBossFullBodyLightning2Effect = DragonBossFullBodyLightning2Effect.a_3926();
                     stDragonBossFullBodyLightning2Effect.a_1797(false);
                     stDragonBossFullBodyLightning2Effect.x = 3.5 * a_3491.a_1080;
                     stDragonBossFullBodyLightning2Effect.y = 0.5 * a_3491.a_1081;
                     parent.addChild(stDragonBossFullBodyLightning2Effect);
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,0));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,1));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,2));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,4));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,5));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,6));
                  }
               }
               else if(6 == this.m_iLightingTailSequence)
               {
                  if(null != ms_arrDragonBossFullBodyLightingTail[7])
                  {
                     stDragonBossFullBodyLightning4Effect = DragonBossFullBodyLightning4Effect.a_3926();
                     stDragonBossFullBodyLightning4Effect.a_1797(false);
                     stDragonBossFullBodyLightning4Effect.x = 3.5 * a_3491.a_1080;
                     stDragonBossFullBodyLightning4Effect.y = 3.5 * a_3491.a_1081;
                     parent.addChild(stDragonBossFullBodyLightning4Effect);
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,6));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,5));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,4));
                     this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,3));
                  }
               }
               else if(7 == this.m_iLightingTailSequence)
               {
               }
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum > 240)
         {
            this.a_3969(iLifeValue);
            a_4212();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
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

