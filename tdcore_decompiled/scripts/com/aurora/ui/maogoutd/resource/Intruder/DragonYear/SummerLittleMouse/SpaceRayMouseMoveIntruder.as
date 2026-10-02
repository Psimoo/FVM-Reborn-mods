package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class SpaceRayMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1200;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      protected var a_1311:int = 90;
      
      protected var a_1312:int = 15;
      
      private var lastUseTick:int = 0;
      
      private var m_bPlayedShot:Boolean = false;
      
      public var m_iNoX:int;
      
      public function SpaceRayMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceRayMouseMoveIntruder) as SpaceRayMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceRayMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.lastUseTick = 0;
         this.m_bPlayedShot = false;
         CanCharm = false;
         a_1377 = 0;
         a_1476 = 20;
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         super.a_4210();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 8)
         {
            a_1275 = 8;
            gotoAndStop((a_1276[8] as FrameLabel).frame);
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
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var xEnd:int = 0;
         var xStart:int = 0;
         var indexX:* = 0;
         var stFieldGrid:a_3491 = null;
         var stLastWaitShot:SpaceRayMouseShot = null;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if((this.lastUseTick == 0 || this.lastUseTick + 20 * 4 < iCurrentTime) && m_stCurrentFieldGrid.m_iXGridNo >= 0 && m_stCurrentFieldGrid.m_iXGridNo <= 8)
         {
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            xEnd = m_stCurrentFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 2);
            xStart = m_stCurrentFieldGrid.m_iXGridNo;
            for(indexX = xStart; indexX >= xEnd; indexX--)
            {
               stFieldGrid = stFieldGridVector[m_stCurrentFieldGrid.m_iYGridNo][indexX];
               if(stFieldGrid)
               {
                  if(Boolean(stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) || stFieldGrid.m_stFlowerDefense || stFieldGrid.m_stBaseAuxiliaryFighter || stFieldGrid.m_stProtector) || Boolean(stFieldGrid.m_stTrayDefense) || Boolean(stFieldGrid.m_stBoomDefense))
                  {
                     this.m_iNoX = indexX;
                     this.SetAnimationOnce2Loop(4,0,1);
                     this.lastUseTick = iCurrentTime;
                     this.m_bPlayedShot = false;
                     a_1477 = iCurrentTime + 5;
                     break;
                  }
               }
            }
         }
         if((a_1273 == 50 || a_1273 == 63) && this.m_bPlayedShot == false)
         {
            this.m_bPlayedShot = true;
            stLastWaitShot = SpaceRayMouseShot.a_4344();
            stLastWaitShot.iShotSequenceNum = 2;
            stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + 20,y + 5,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
            stLastWaitShot.InitField(this.m_iNoX);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 16)
         {
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stProtector)
            {
               this.EatDefense2(m_stCurrentFieldGrid.m_stProtector);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stAttackFighter)
            {
               this.EatDefense2(m_stCurrentFieldGrid.m_stAttackFighter);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stBoomDefense)
            {
               if(!m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten || m_stCurrentFieldGrid.m_stBoomDefense.isSleeping)
               {
                  this.EatDefense2(m_stCurrentFieldGrid.m_stBoomDefense);
               }
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stFlowerDefense)
            {
               this.EatDefense2(m_stCurrentFieldGrid.m_stFlowerDefense);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
            {
               this.EatDefense2(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter);
            }
            if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stTrayDefense)
            {
               this.EatDefense2(m_stCurrentFieldGrid.m_stTrayDefense);
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      public function EatDefense2(stBaseDefense:a_3962) : Boolean
      {
         BattleFieldView.ms_kenShi29.play();
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(400);
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

