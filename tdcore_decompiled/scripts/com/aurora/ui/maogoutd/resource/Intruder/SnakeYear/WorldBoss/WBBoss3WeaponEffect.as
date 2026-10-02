package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBBoss3WeaponEffect extends a_4206
   {
      
      private static const MAX_LIFE:int = 10000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      private var m_bForceDamage:Boolean = false;
      
      private var iNoX:int;
      
      private var iNoY:int;
      
      public function WBBoss3WeaponEffect()
      {
         super();
      }
      
      public static function a_3926() : WBBoss3WeaponEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBBoss3WeaponEffect) as WBBoss3WeaponEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBBoss3WeaponEffectMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2 + 10;
         m_iYDisplayCenterPos = -212;
         a_1272 = 0;
         this.SetAnimationOnce2Loop2(0,1);
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         this.m_bForceDamage = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation2(2);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(value:int) : Boolean
      {
         if(this.m_bForceDamage)
         {
            super.a_3969(value);
         }
         return true;
      }
      
      public function ForceDamage() : void
      {
         this.m_bForceDamage = true;
         this.a_3969(iLifeValue);
         this.m_bForceDamage = false;
      }
      
      override public function a_4209(value:int) : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var targetGrid:a_3491 = null;
         var blockHole:WBBlockHoleEffect = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.iNoX = m_stCurrentFieldGrid.m_iXGridNo;
            this.iNoY = m_stCurrentFieldGrid.m_iYGridNo;
         }
         if(m_stCurrentFieldGrid != null && iCurrentTime % 2 == 1)
         {
            targetGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.iNoX,this.iNoY);
            if(iCurrentFrame == 3)
            {
               if(targetGrid != null)
               {
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo - 1,targetGrid.m_iYGridNo));
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo + 1,targetGrid.m_iYGridNo));
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo,targetGrid.m_iYGridNo - 1));
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo,targetGrid.m_iYGridNo + 1));
                  this.a_3502(targetGrid);
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo - 1,targetGrid.m_iYGridNo - 1));
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo + 1,targetGrid.m_iYGridNo + 1));
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo - 1,targetGrid.m_iYGridNo + 1));
                  this.a_3502(targetGrid.m_stCurrentBattbleFieldView.a_3438(targetGrid.m_iXGridNo + 1,targetGrid.m_iYGridNo - 1));
               }
               blockHole = WBBlockHoleEffect.a_3926();
               blockHole.targetGrid = targetGrid;
               blockHole.a_1797(false);
               blockHole.x = targetGrid.m_iXGridNo * a_3491.a_1080;
               blockHole.y = targetGrid.m_iYGridNo * a_3491.a_1081;
               targetGrid.m_stCurrentBattbleFieldView.AddToBattleView(blockHole,BattleLayerDefine.EFFECTS_BASE_TYPE,targetGrid);
            }
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(stFieldGrid.m_stBaseToolDefense.iLifeValue);
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
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

