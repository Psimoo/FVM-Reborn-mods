package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.GiantIron
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class GiantIronSoliderMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 30000;
      
      private static const MAX_INJURED_LIFE:int = 0;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      public var inPool:Boolean = true;
      
      public var isFire:Boolean = true;
      
      private var m_iCalTick:int = 0;
      
      private var m_iState:int = 0;
      
      private var m_iNoX:int;
      
      private var m_iNoY:int;
      
      private var m_iOldFieldGridType:int;
      
      private var m_iFireColdCount:int = 0;
      
      private var m_bDoFireAttack:Boolean = false;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var a_1581:int;
      
      public function GiantIronSoliderMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : GiantIronSoliderMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(GiantIronSoliderMouseMoveIntruder) as GiantIronSoliderMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GiantIronSoliderMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         this.m_fOrginSpeed = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         if(iIntruderMoveDirection == 1)
         {
            a_1279 = -50;
         }
         else
         {
            a_1279 = 10;
         }
         m_iYDisplayCenterPos = 5;
         a_1272 = 0;
         a_1463 = true;
         a_1481 = false;
         a_1464 = true;
         this.SetAnimationOnce2Loop(0,1);
         this.m_iCalTick = 0;
         this.m_iState = 0;
         return true;
      }
      
      public function InitField() : void
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         iNoX = m_stCurrentFieldGrid.m_iXGridNo;
         iNoY = m_stCurrentFieldGrid.m_iYGridNo;
         x = iNoX * a_3491.a_1080;
         y = iNoY * a_3491.a_1081;
         this.m_iNoX = iNoX;
         this.m_iNoY = iNoY;
         this.inPool = false;
         this.m_iCalTick = 0;
         this.m_iState = 0;
         this.DoFire2();
         this.a_3502(m_stCurrentFieldGrid);
         this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
         m_stCurrentFieldGrid.m_iFieldGridType = 8;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function DoFire2() : void
      {
         this.ChangeFireState(true);
         this.ResetMovieStatus();
      }
      
      public function DoFire() : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var iOld:int = m_iDieType;
         m_iDieType = 2;
         this.a_3969(-20000);
         m_iDieType = iOld;
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = x;
         stAddBloodEffect.y = y;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         this.DoFire2();
      }
      
      private function ChangeFireState(bFire:Boolean) : void
      {
         if(this.isFire != bFire)
         {
            this.isFire = bFire;
            this.m_iFireColdCount = 0;
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 == iEffectType || b_182.enm_shotEffectFreezeStop == iEffectType || b_182.a_434 == iEffectType)
         {
            ++this.m_iFireColdCount;
            if(this.m_iFireColdCount == 5)
            {
               this.isFire = false;
            }
            this.ResetMovieStatus();
         }
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            this.a_3940();
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.ChangeFireState(false);
         if(m_stCurrentFieldGrid != null)
         {
            if(this.m_iOldFieldGridType != -1)
            {
               m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            }
         }
         super.a_3940();
         this.inPool = true;
         return true;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_iState == 0)
            {
               if(this.isFire)
               {
                  this.SetAnimation(1);
               }
               else
               {
                  this.SetAnimation(3);
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != 5)
         {
            a_1275 = 5;
            gotoAndStop((a_1276[5] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.isFire && m_iDieType == 0)
         {
            return super.a_3969(iRduceLifeValue * 0.1);
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.isFire && m_iDieType == 0)
         {
            return super.a_4209(iRduceLifeValue * 0.1);
         }
         return super.a_4209(iRduceLifeValue);
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var giantIronSoliderMouseShot:GiantIronSoliderMouseShot = null;
         if(!a_1460)
         {
            a_1460 = true;
         }
         ++this.m_iCalTick;
         if(this.m_iState == 0)
         {
            if(this.isFire)
            {
               if(this.m_iCalTick >= 40)
               {
                  this.m_iState = 1;
                  this.m_iCalTick = 0;
                  this.m_bDoFireAttack = true;
                  this.SetAnimationOnce2Loop(2,1);
               }
            }
            else if(this.m_iCalTick >= 80)
            {
               this.m_iState = 1;
               this.m_iCalTick = 0;
               this.m_bDoFireAttack = false;
               this.SetAnimationOnce2Loop(4,3);
            }
         }
         else if(this.m_iCalTick == 20)
         {
            giantIronSoliderMouseShot = GiantIronSoliderMouseShot.a_4344();
            giantIronSoliderMouseShot.iShotSequenceNum = 2;
            giantIronSoliderMouseShot.a_1797(0,10,this.m_bDoFireAttack ? 100 : 10,a_1283 ? int(x + 60) : int(x - 10),y + 25,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iNoX,this.m_iNoY));
            if(a_1283)
            {
               giantIronSoliderMouseShot.SetReverse();
            }
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(giantIronSoliderMouseShot,BattleLayerDefine.SHOT_TYPE);
         }
         else if(this.m_iCalTick >= 30)
         {
            this.m_iState = 0;
            this.m_iCalTick = 0;
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number = -0.1234) : int
      {
         if(-0.1234 == fMoveSpeed)
         {
            fMoveSpeed = Math.abs(this.m_fOrginSpeed);
         }
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         return iMoveTick;
      }
      
      protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080;
         return iXGridNo - 10000;
      }
      
      protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY) / a_3491.a_1081;
         return iYGridNo - 10000;
      }
      
      protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(stNextFieldGrid.m_iYGridNo));
         return true;
      }
   }
}

