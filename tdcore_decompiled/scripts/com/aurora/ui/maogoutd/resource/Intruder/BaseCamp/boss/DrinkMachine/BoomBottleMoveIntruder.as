package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.DrinkMachine
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class BoomBottleMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 200000;
      
      private const HURT_HP:int = 100000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      public function BoomBottleMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BoomBottleMoveIntruder) as BoomBottleMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BoomBottleMoveIntruderMovie;
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
         BoomIsReduceLife = false;
         a_1464 = true;
         a_1462 = false;
         a_1463 = true;
         this.m_iAppearedTime = -10;
         a_1279 = -10;
         a_1467 = -280 - 15;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_stMouseObstacle)
            {
               m_stCurrentFieldGrid.m_stMouseObstacle = null;
            }
            this.ClearShield(m_stCurrentFieldGrid);
            if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            }
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            a_1460 = true;
            a_1275 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 3)
            {
               this.addShield(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 7)
            {
               this.m_iAppearedTime = 0;
            }
            else if(a_1273 == 25)
            {
               if(Boolean(parent) && parent.contains(this))
               {
                  parent.removeChild(this);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
            }
            else if(a_1273 == 30)
            {
               for(i = 0; i < 7; i++)
               {
                  if(m_stCurrentFieldGrid != null)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,i);
                     if(stTargetFieldGrid)
                     {
                        stTargetFieldGrid.ClearFieldGridDefenseNoraml();
                     }
                  }
               }
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
         if(this.m_iAppearedTime >= 20 * 2)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(this.m_iAppearedTime >= 0)
         {
            ++this.m_iAppearedTime;
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         this.a_3502(stFieldGrid);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
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
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function ShowBoomDieEffect() : void
      {
      }
   }
}

