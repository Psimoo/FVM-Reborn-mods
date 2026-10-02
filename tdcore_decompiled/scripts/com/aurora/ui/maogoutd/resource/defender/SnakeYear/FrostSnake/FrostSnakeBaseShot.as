package com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake.effect.FrostSnakeBaseTopEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake.effect.FrostSnakeHitEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class FrostSnakeBaseShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const CONTINUE_TIME:int = 36 + 6;
      
      public var a_1598:a_3491;
      
      private var a_1607:a_4206;
      
      private var m_iStartAttckTime:int;
      
      private var m_FrostSnakeTopEffect:a_4108;
      
      private var stTempPosition:Point;
      
      private var m_DropState:int;
      
      private var targetMoveIntrude:a_4206;
      
      private var m_iCount:int;
      
      public function FrostSnakeBaseShot()
      {
         super();
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1279 = -20;
         m_iYDisplayCenterPos = -32;
      }
      
      public static function a_4344() : FrostSnakeBaseShot
      {
         var stShot:FrostSnakeBaseShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new FrostSnakeBaseShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return FrostSnakeBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.stTempPosition = new Point((stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stStartFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 28);
         super.a_1797(iGlobalID,numSpeed,iHurtPower,this.stTempPosition.x,this.stTempPosition.y,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = this.m_iCount = 0;
         a_1275 = 0;
         gotoAndStop(1);
         this.m_DropState = 1;
         scaleY = 1;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         this.targetMoveIntrude = this.a_3431();
         if(Boolean(this.targetMoveIntrude) && this.targetMoveIntrude.iLifeValue > 0)
         {
            this.a_1598 = a_1583.a_3438(this.targetMoveIntrude.m_stCurrentFieldGrid.m_iXGridNo,m_iYGridNo);
         }
         else
         {
            this.a_1598 = a_1583.a_3438(7,m_iYGridNo);
         }
         return true;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         if(this.stTempPosition == null)
         {
            return 0;
         }
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.stTempPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.stTempPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(iCurrentTime - this.m_iStartAttckTime == CONTINUE_TIME)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               if(this.m_FrostSnakeTopEffect)
               {
                  this.m_FrostSnakeTopEffect.ShowPlayAnimation(2,2);
               }
            }
            else if(iCurrentTime - this.m_iStartAttckTime >= CONTINUE_TIME)
            {
               if(a_1273 == a_1274)
               {
                  trace("伤害次数::" + this.m_iCount);
                  this.a_3940();
               }
            }
            else
            {
               if((iCurrentTime - this.m_iStartAttckTime & 3) == 0)
               {
                  this.BurningInjury();
               }
               if(a_1278 != null)
               {
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == 9)
            {
               this.AddSnakeTopEffect();
            }
            else if(a_1273 == 12)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               m_isHited = true;
               this.m_iStartAttckTime = iCurrentTime;
            }
            else if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(this.a_1598)
         {
            if(this.m_DropState == 1)
            {
               if(y > -110)
               {
                  y -= 20;
               }
               else
               {
                  this.m_DropState = 2;
                  visible = false;
                  a_1447 = iCurrentTime;
               }
            }
            if(this.m_DropState == 2)
            {
               if(iCurrentTime - a_1447 >= 2)
               {
                  this.m_DropState = 3;
                  visible = true;
                  scaleY = -1;
               }
            }
            if(this.m_DropState == 3)
            {
               if(!a_1283)
               {
                  x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
               }
               else
               {
                  x = BattleFieldView.a_1013 - (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
               }
               y += 30;
               this.a_4373(iCurrentTime);
            }
         }
         else
         {
            this.a_3940();
         }
      }
      
      private function a_4373(iCurrentTime:int) : void
      {
         if(y > this.a_1598.m_iYGridNo * (a_3491.a_1081 + 0.5))
         {
            this.ChangeToAttackState(iCurrentTime);
         }
      }
      
      private function ChangeToAttackState(iCurrentTime:int) : void
      {
         this.m_DropState = 4;
         a_1583.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE2_TYPE,this.a_1598);
         this.m_iCount = 0;
         a_1275 = 1;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         this.x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.y = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
      }
      
      public function a_3431() : a_4206
      {
         var moveIntruder:a_4206 = null;
         var nearestIntruder:a_4206 = null;
         var stRowIntruderArray:Array = new Array();
         for each(moveIntruder in a_1583.m_arrBaseMoveIntruderVector)
         {
            if(moveIntruder.iLifeValue > 0 && (moveIntruder.iSpaceState == 0 || moveIntruder.iSpaceState == 3) && moveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo)
            {
               stRowIntruderArray.push(moveIntruder);
            }
         }
         if(stRowIntruderArray.length > 0)
         {
            stRowIntruderArray.sort(this.OnSortToken);
            nearestIntruder = stRowIntruderArray[0];
         }
         return nearestIntruder;
      }
      
      private function AddSnakeTopEffect() : void
      {
         if(this.a_1598)
         {
            this.m_FrostSnakeTopEffect = FrostSnakeBaseTopEffect.a_3926();
            this.m_FrostSnakeTopEffect.a_1797(false);
            this.m_FrostSnakeTopEffect.x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_FrostSnakeTopEffect.y = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.a_1598.m_stCurrentBattbleFieldView.AddToBattleView(this.m_FrostSnakeTopEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.a_1598);
            if(this.a_1598.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               this.a_1598.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_FrostSnakeTopEffect,this.a_1598.m_iXGridNo,this.a_1598.m_iYGridNo);
            }
            this.m_FrostSnakeTopEffect.play();
         }
      }
      
      public function BurningInjury() : void
      {
         var xIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var aMouseY:Number = NaN;
         var aMouseX:Number = NaN;
         var hitEffect:FrostSnakeHitEffect = null;
         ++this.m_iCount;
         var xStart:int = Math.max(this.a_1598.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(this.a_1598.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(this.a_1598.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(this.a_1598.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var finalHurt:Number = GetFinalDamage();
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = this.a_1598.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 3 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     if(a_1573 > 0)
                     {
                        stMoveIntruder.a_4208(b_182.a_432,a_1573);
                     }
                     stMoveIntruder.ReduceAllLife(finalHurt);
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        aMouseY = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y + stMoveIntruder.height / 2;
                        aMouseX = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x + stMoveIntruder.width / 2;
                        hitEffect = FrostSnakeHitEffect.a_3926();
                        hitEffect.a_1797(false);
                        this.a_1598.m_stCurrentBattbleFieldView.AddToBattleView(hitEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.a_1598);
                        hitEffect.x = aMouseX;
                        hitEffect.y = aMouseY;
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.m_FrostSnakeTopEffect)
         {
            this.m_FrostSnakeTopEffect.a_3940();
         }
         this.a_1607 = null;
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

