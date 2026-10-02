package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.Vallon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class VallonMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1800;
      
      private const HURT_HP:int = 900;
      
      private const DEAD_HP:int = 0;
      
      private const TURTLEBACK_HP:int = 1000;
      
      private var m_isWithVallon:Boolean;
      
      private var a_1547:Boolean;
      
      private var a_1548:Boolean;
      
      private var m_iJumpPath:Array = new Array();
      
      private var FrameIndex:int;
      
      public function VallonMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VallonMouseMoveIntruder) as VallonMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VallonMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6.5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1466 = this.TURTLEBACK_HP;
         a_1279 = -width * 0.5 + 18;
         a_1272 = 0;
         BoomIsReduceLife = true;
         this.m_isWithVallon = true;
         this.a_1547 = false;
         this.a_1548 = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.a_1547)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.a_1548)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               this.FrameIndex = this.m_isWithVallon ? 2 : 10;
               if(a_1275 != this.FrameIndex)
               {
                  a_1275 = this.FrameIndex;
                  gotoAndStop((a_1276[this.FrameIndex] as FrameLabel).frame);
               }
            }
            else
            {
               this.FrameIndex = this.m_isWithVallon ? 0 : 8;
               if(a_1275 != this.FrameIndex)
               {
                  a_1275 = this.FrameIndex;
                  gotoAndStop((a_1276[this.FrameIndex] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.a_1547)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.a_1548)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               this.FrameIndex = this.m_isWithVallon ? 3 : 11;
               if(a_1275 != this.FrameIndex)
               {
                  a_1275 = this.FrameIndex;
                  gotoAndStop((a_1276[this.FrameIndex] as FrameLabel).frame);
               }
            }
            else
            {
               this.FrameIndex = this.m_isWithVallon ? 1 : 9;
               if(a_1275 != this.FrameIndex)
               {
                  a_1275 = this.FrameIndex;
                  gotoAndStop((a_1276[this.FrameIndex] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 13 && a_1275 != 12)
         {
            this.FrameIndex = this.m_isWithVallon ? 13 : 12;
            a_1275 = this.FrameIndex;
            gotoAndStop((a_1276[this.FrameIndex] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         var xx:Array = a_1277;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.a_1547 && !this.a_1548)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.a_1547 && !this.a_1548)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         if(this.a_1547 || this.a_1548)
         {
            return false;
         }
         var iRduceLifeValue:int = 900;
         if(a_1466 > 0)
         {
            a_1466 -= iRduceLifeValue;
            if(a_1466 < 0)
            {
               a_1339 += a_1466;
            }
         }
         else
         {
            a_1339 -= iRduceLifeValue;
         }
         if(a_1339 <= this.DEAD_HP)
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
            a_3940();
         }
         else
         {
            this.jumpHandle();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= this.DEAD_HP)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         if(this.a_1547 || this.a_1548)
         {
            return false;
         }
         var iRduceLifeValue:int = 900;
         if(a_1466 > 0)
         {
            a_1466 -= iRduceLifeValue;
            if(a_1466 < 0)
            {
               a_1339 += a_1466;
            }
         }
         else
         {
            a_1339 -= iRduceLifeValue;
         }
         if(a_1339 <= this.DEAD_HP)
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
            a_3940();
         }
         else
         {
            this.jumpHandle();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iPst:Array = null;
         if(this.a_1547)
         {
            if(this.m_iJumpPath.length > 0)
            {
               iPst = this.m_iJumpPath.shift();
               x = iPst[0];
               y = iPst[1];
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if((a_1273 == a_1274 || a_1273 == (a_1276[11] as FrameLabel).frame - 1) && a_1339 <= 0)
            {
               a_3940();
               return false;
            }
            if(a_1273 == (a_1276[5] as FrameLabel).frame - 1 || a_1273 == (a_1276[7] as FrameLabel).frame - 1)
            {
               this.a_1547 = false;
               this.a_1548 = true;
               this.ResetMovieStatus();
            }
            else if(a_1273 == 75 || a_1273 == 120)
            {
               this.addVallonBomShot();
            }
            else if(a_1273 == (a_1276[6] as FrameLabel).frame - 1 || a_1273 == (a_1276[8] as FrameLabel).frame - 1)
            {
               this.a_1548 = false;
               this.m_isWithVallon = false;
               this.ResetMovieStatus();
            }
         }
         if(!this.a_1548 && !this.a_1547)
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.a_1547 && !this.a_1548)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      private function jumpHandle() : void
      {
         if(this.m_isWithVallon)
         {
            if(!this.a_1547)
            {
               if(m_stCurrentFieldGrid.m_iXGridNo - 3 >= 0)
               {
                  this.a_1547 = true;
                  this.ResetMovieStatus();
                  this.buildPath((m_stCurrentFieldGrid.m_iXGridNo - 3 + 0.6) * a_3491.a_1080);
               }
            }
         }
      }
      
      override public function get isFearCatHead() : Boolean
      {
         if(this.a_1547 == true)
         {
            return false;
         }
         return a_1481;
      }
      
      private function buildPath(iX:Number) : void
      {
         var frames:int = (a_1276[5] as FrameLabel).frame - (a_1276[4] as FrameLabel).frame - 1;
         var iY:Number = y - a_3491.a_1081 * 0.5;
         var speedX:Number = (iX - x) / (frames * 2);
         var speedY:Number = (iY - y) / frames;
         this.m_iJumpPath = new Array();
         var i:int = 0;
         var len:int = frames * 2;
         while(i <= len)
         {
            this.m_iJumpPath.push([x + speedX * i,iY + (frames - i) * speedY]);
            i++;
         }
      }
      
      private function addVallonBomShot() : void
      {
         var m_iYGridNo:int = 0;
         var m_iXGridNo:int = 0;
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         stStartFieldGrid = m_stCurrentFieldGrid;
         if(stStartFieldGrid)
         {
            stLastWaitShot = VallonBomShot.a_4344();
            stLastWaitShot.a_1797(0,15,1000000,x - 20,y + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
   }
}

