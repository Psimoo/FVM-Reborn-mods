package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class PlumberPipelineOutletMoveIntruder extends a_4206
   {
      
      public static var createIndex:int = 0;
      
      public static var createTick:int = 0;
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      public var m_iMummyMouseMoveIntruderGlobalID:uint;
      
      public var m_stPipelineEntranceMoveIntruder:PlumberPipelineEntranceMoveIntruder;
      
      public var m_iOldGridType:int = 0;
      
      public var createMouse:Boolean = false;
      
      public var buildTick:int = 0;
      
      public var holes:Array;
      
      public var duration:int = 410;
      
      public function PlumberPipelineOutletMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PlumberPipelineOutletMoveIntruder,PlumberPipelineOutletMoveIntruderMovie) as PlumberPipelineOutletMoveIntruder;
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
         this.m_iMummyMouseMoveIntruderGlobalID = 0;
         this.m_stPipelineEntranceMoveIntruder = null;
         a_1465 = 1;
         this.m_iStartTimeNum = 0;
         this.createMouse = false;
         this.buildTick = 0;
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
            this.m_stPipelineEntranceMoveIntruder.RealDie();
         }
         return true;
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
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var iNoX:int = 0;
         var iNoY:int = 0;
         var count:int = 0;
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            this.m_numTargetYPos = y;
            a_1275 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.SetAnimationOnce2Loop2(0,1);
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
         ++this.buildTick;
         if(this.createMouse == true && Math.abs(iCurrentTime - createTick) > 10 && this.buildTick % 140 == 0)
         {
            createTick = iCurrentTime;
            count = 0;
            while(this.holes[createIndex].iLifeValue <= 0)
            {
               ++createIndex;
               if(createIndex >= this.holes.length)
               {
                  createIndex = 0;
               }
               if(++count > 5)
               {
                  break;
               }
            }
            this.holes[createIndex].CreateMouse();
            ++createIndex;
            if(createIndex >= this.holes.length)
            {
               createIndex = 0;
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == this.duration)
         {
            this.a_4213();
         }
         return true;
      }
      
      public function CreateMouse() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389637);
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(stBaseMoveIntruder == null)
         {
            return;
         }
         stBaseMoveIntruder.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 90,-1);
         stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389637;
         stBaseMoveIntruder.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080;
         stBaseMoveIntruder.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
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

