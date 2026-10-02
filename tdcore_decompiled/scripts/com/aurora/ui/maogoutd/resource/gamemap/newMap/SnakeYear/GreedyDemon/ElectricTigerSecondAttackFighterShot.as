package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class ElectricTigerSecondAttackFighterShot extends a_4348
   {
      
      private static var ms_stElectricTigerSecondAttackFighterShotVector:Array = new Array();
      
      public var m_isParentAttackDie:Boolean = false;
      
      private var startPosition:Point;
      
      private var TargetMouse:a_4206;
      
      private var appearedTimes:int = 0;
      
      private var _mouseX:Number;
      
      private var _mouseY:Number;
      
      private var dis:Number;
      
      public function ElectricTigerSecondAttackFighterShot()
      {
         super();
         a_1279 = 6 - 42 + 10 + 10;
         m_iYDisplayCenterPos = -63 + 15 + 28;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : ElectricTigerSecondAttackFighterShot
      {
         var stElectricTigerSecondAttackFighterShot:ElectricTigerSecondAttackFighterShot = ms_stElectricTigerSecondAttackFighterShotVector.pop();
         if(null == stElectricTigerSecondAttackFighterShot)
         {
            stElectricTigerSecondAttackFighterShot = new ElectricTigerSecondAttackFighterShot();
         }
         BattleFieldView.a_1017.play();
         return stElectricTigerSecondAttackFighterShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricTigerSecondAttackFighterShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(a_1283)
         {
            iXpos = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 - 28;
            iYpos = stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 15;
         }
         else
         {
            iXpos = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 28;
            iYpos = stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 15;
         }
         this.startPosition = new Point(iXpos,iYpos);
         this.CaculateScale();
         a_1271 = true;
         if(this.TargetMouse != null)
         {
            this.TargetMouse.m_isShowShandian = true;
         }
         super.a_1797(iGlobalID,0,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         this.m_isParentAttackDie = false;
         this.appearedTimes = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(this.m_isParentAttackDie)
         {
            this.a_3940();
            return;
         }
         if(Boolean(this.stTargetMouse) && Boolean(this.stTargetMouse.parent) && this.stTargetMouse.iLifeValue > 0)
         {
            if(iCurrentTime - this.appearedTimes == 20)
            {
               if(!(this.stTargetMouse != null && this.stTargetMouse.m_stCurrentFieldGrid != null && this.stTargetMouse.iLifeValue > 0))
               {
                  this.a_3940();
                  return;
               }
               if(this.stTargetMouse.IsBossIntruder)
               {
                  this.stTargetMouse.ReduceLife2(0,[111]);
               }
               else
               {
                  this.stTargetMouse.a_3969(this.stTargetMouse.iLifeValue);
                  if(this.stTargetMouse.iLifeValue <= 0)
                  {
                     this.stTargetMouse.ShowBoomDieEffect();
                     this.stTargetMouse.a_3432();
                  }
               }
            }
            if(iCurrentTime - this.appearedTimes >= 20)
            {
               this.a_3940();
               return;
            }
            this.CaculateScale();
            return;
         }
         this.a_3940();
      }
      
      public function CaculateScale() : void
      {
         var MouseY:Number = NaN;
         var MouseX:Number = NaN;
         var dy:Number = NaN;
         var dx:Number = NaN;
         var ratation:Number = NaN;
         if(this.stTargetMouse != null && this.startPosition != null)
         {
            MouseY = 0;
            MouseX = 0;
            if(this.stTargetMouse.IsBossIntruder)
            {
               MouseY = this.stTargetMouse.y + this.stTargetMouse.height / 4 * 3;
               MouseX = this.stTargetMouse.x + 20;
            }
            else
            {
               MouseY = this.stTargetMouse.y + this.stTargetMouse.stDisplayBitmap.y + this.stTargetMouse.height / 2;
               MouseX = this.stTargetMouse.x + this.stTargetMouse.stDisplayBitmap.x + this.stTargetMouse.width / 2;
            }
            dy = MouseY - this.startPosition.y;
            dx = MouseX - this.startPosition.x;
            ratation = Math.atan2(dy,dx);
            this.rotation = ratation * 180 / Math.PI;
            this.dis = Point.distance(this.startPosition,new Point(MouseX,MouseY));
            stOriginalMovieClip.bgMask.width = this.dis;
            stOriginalMovieClip.mc_end.x = this.dis - 12;
         }
         else
         {
            this.a_3940();
         }
      }
      
      override protected function a_3940() : Boolean
      {
         var stVector:Array = null;
         while(m_HitMouseArray.length > 0)
         {
            m_HitMouseArray.pop();
         }
         if(a_1583)
         {
            stVector = a_1583.m_stBaseShotVector[m_iYGridNo];
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         if(parent)
         {
            parent.removeChild(this);
         }
         visible = false;
         gotoAndStop(1);
         if(-1 == ms_stElectricTigerSecondAttackFighterShotVector.indexOf(this))
         {
            ms_stElectricTigerSecondAttackFighterShotVector.push(this);
         }
         if(this.TargetMouse != null)
         {
            this.TargetMouse.m_isShowShandian = false;
         }
         this.m_isParentAttackDie = false;
         return true;
      }
      
      public function get stTargetMouse() : a_4206
      {
         return this.TargetMouse;
      }
      
      public function set stTargetMouse(value:a_4206) : void
      {
         this.TargetMouse = value;
      }
   }
}

