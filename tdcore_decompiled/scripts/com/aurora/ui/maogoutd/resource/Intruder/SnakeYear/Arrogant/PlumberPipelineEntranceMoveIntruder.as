package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class PlumberPipelineEntranceMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      public var m_iOldGridType:int = -1;
      
      public var m_stPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder;
      
      public var duration:int = 410;
      
      public function PlumberPipelineEntranceMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PlumberPipelineEntranceMoveIntruder,PlumberPipelineEntranceMoveIntruderMovie) as PlumberPipelineEntranceMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 20000;
         a_1279 = -21;
         m_iYDisplayCenterPos = 16;
         a_1272 = 0;
         a_1463 = true;
         this.m_iStartTimeNum = 0;
         this.SetAnimationOnce2Loop2(0,1);
         this.duration = 410;
         tagCom.AddTag(401);
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
         a_3419();
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         if(a_1339 > 0)
         {
            super.a_3969(iLifeValue);
            this.m_stPipelineOutletMoveIntruder.a_4213();
         }
         return true;
      }
      
      public function RealDie() : void
      {
         if(a_1339 > 0)
         {
            super.a_3969(iLifeValue);
            this.m_stPipelineOutletMoveIntruder.a_4213();
         }
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var iNoX:int = 0;
         var iNoY:int = 0;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var bIsOwnBoss:Boolean = false;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iStartTimeNum = iCurrentTime;
         }
         if(m_stCurrentFieldGrid != null && iCurrentTime % 2 == 0)
         {
            iNoX = m_stCurrentFieldGrid.m_iXGridNo;
            iNoY = m_stCurrentFieldGrid.m_iYGridNo;
            for each(stBaseShot in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stBaseShotVector[iNoY].slice())
            {
               if(stBaseShot.x > a_3491.a_1080 * iNoX && stBaseShot.x < a_3491.a_1080 * (iNoX + 1))
               {
                  if(stBaseShot.tagCom.HasTag(30))
                  {
                     stBaseShot.a_4350();
                  }
                  else if(!stBaseShot.isParabolaPath && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isShotHighSkySpace)
                  {
                     stBaseShot.a_4350();
                  }
               }
            }
         }
         var stPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = this.m_stPipelineOutletMoveIntruder;
         if(Boolean(m_stCurrentFieldGrid && stPipelineOutletMoveIntruder) && Boolean(stPipelineOutletMoveIntruder.m_stCurrentFieldGrid) && stPipelineOutletMoveIntruder.iLifeValue > 0)
         {
            arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            for each(stMoveIntruder in m_stCurrentFieldGrid.a_1511.slice())
            {
               bIsOwnBoss = Boolean(8388637 == stMoveIntruder.m_stMoveIntruderTypeID || 8388689 == stMoveIntruder.m_stMoveIntruderTypeID || (8392757 == stMoveIntruder.m_stMoveIntruderTypeID || 8389889 == stMoveIntruder.m_stMoveIntruderTypeID || 134234305 == stMoveIntruder.m_stMoveIntruderTypeID));
               if(stMoveIntruder.iLifeValue <= 10000 && stMoveIntruder.iSpaceState == 0 && !bIsOwnBoss && stMoveIntruder.x < a_3491.a_1080 * (BattleFieldView.a_1011 - 0.6))
               {
                  m_stCurrentFieldGrid.a_3457(stMoveIntruder);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                  if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                  {
                     arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                  }
                  if(stPipelineOutletMoveIntruder)
                  {
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMoveIntruder,stPipelineOutletMoveIntruder.m_stCurrentFieldGrid,false);
                     stMoveIntruder.x = a_3491.a_1080 * (stPipelineOutletMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo - 0.8);
                  }
               }
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == this.duration)
         {
            this.RealDie();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
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
   }
}

