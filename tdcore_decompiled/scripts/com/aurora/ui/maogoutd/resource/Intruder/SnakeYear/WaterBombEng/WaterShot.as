package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WaterBombEng
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class WaterShot extends a_4348
   {
      
      private static var ms_stWaterShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      private var m_stTargetDefense:a_3962;
      
      public var m_TargetPosition:Point = new Point();
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      private var m_fStartY:Number;
      
      public function WaterShot()
      {
         super();
         a_1279 = -21;
         m_iYDisplayCenterPos = -20;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stWaterShot:WaterShot = ms_stWaterShotVector.pop();
         if(null == stWaterShot)
         {
            stWaterShot = new WaterShot();
         }
         BattleFieldView.a_1018.play();
         return stWaterShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isShotHighSkySpace = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1598 = null;
         if(-1 == ms_stWaterShotVector.indexOf(this))
         {
            ms_stWaterShotVector.push(this);
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var distance:Number = NaN;
         var iYGridNo:int = a_1584.m_iYGridNo;
         var iXGridNo:int = a_1584.m_iXGridNo;
         var isExistDefenseAhead:Boolean = false;
         for(var i:int = 0; i <= iXGridNo; i++)
         {
            stFieldGrid = a_1583.a_3438(i,iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
            {
               isExistDefenseAhead = true;
               this.a_1598 = stFieldGrid;
               break;
            }
         }
         if(!isExistDefenseAhead)
         {
            this.a_1598 = a_1283 ? a_1583.a_3438(BattleFieldView.a_1011 - 1,iYGridNo) : a_1583.a_3438(0,iYGridNo);
         }
         if(!this.a_1598)
         {
            return false;
         }
         var targetX:Number = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
         var targetY:Number = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
         this.m_TargetPosition.x = targetX;
         this.m_TargetPosition.y = targetY;
         var dx:Number = targetX - x;
         var dy:Number = targetY - y;
         distance = Math.abs(dx);
         this.m_rotationRadian = Math.atan2(dy,dx);
         this.m_fStartY = y;
         a_1581 = int(Math.sqrt(dx * dx + dy * dy) / m_numXSpeed);
         if(a_1581 < 2)
         {
            a_1581 = 2;
         }
         m_numYSpeed = distance < 2 * a_3491.a_1080 ? a_3491.a_1081 * 0.6 / a_1581 : 3 * a_3491.a_1081 / a_1581;
         this.m_realXSpeed = m_numXSpeed * Math.cos(this.m_rotationRadian);
         this.m_baseYDirection = m_numXSpeed * Math.sin(this.m_rotationRadian);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var t:Number = NaN;
         var startY:Number = NaN;
         var endY:Number = NaN;
         var topY:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
            return;
         }
         if(a_1447 == 0)
         {
            a_1447 = iCurrentTime;
         }
         x += this.m_realXSpeed;
         if(a_1576)
         {
            this.m_MoveTime = iCurrentTime - a_1447;
            t = this.m_MoveTime / a_1581;
            if(t > 1)
            {
               t = 1;
            }
            startY = this.m_fStartY;
            endY = this.m_TargetPosition.y;
            topY = Math.min(startY,endY) - a_3491.a_1081 * 1.5;
            y = (1 - t) * (1 - t) * startY + 2 * (1 - t) * t * topY + t * t * endY;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         this.a_4351();
      }
      
      override protected function a_4351() : void
      {
         var target:a_3962 = null;
         if(x <= 0 || x > BattleFieldView.a_1013 + 10)
         {
            this.a_3940();
            return;
         }
         if(y >= this.m_TargetPosition.y)
         {
            x = this.m_TargetPosition.x;
            y = this.m_TargetPosition.y;
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            target = this.GetHitDefense();
            this.a_4374(target);
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         var iHurtPower:int = 0;
         if(stBaseDefense == null)
         {
            return false;
         }
         stBaseDefense.m_iDieType = 1;
         if(stBaseDefense is a_3924)
         {
            iHurtPower = stBaseDefense.iLifeValue - 10 > a_1579 ? a_1579 : int(stBaseDefense.iLifeValue - 10);
            stBaseDefense.a_3969(iHurtPower);
         }
         else
         {
            stBaseDefense.a_3969(a_1579);
         }
         stBaseDefense.m_iDieType = 0;
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
      
      private function GetHitDefense() : a_3962
      {
         var stBaseDefense:a_3962 = null;
         if(Boolean(this.a_1598) && this.a_1598.a_3492())
         {
            if(null != this.a_1598.m_stAttackFighter)
            {
               stBaseDefense = this.a_1598.m_stAttackFighter;
            }
            else if(null != this.a_1598.m_stBoomDefense)
            {
               stBaseDefense = this.a_1598.m_stBoomDefense;
            }
            else if(null != this.a_1598.m_stFlowerDefense)
            {
               stBaseDefense = this.a_1598.m_stFlowerDefense;
            }
            else if(null != this.a_1598.m_stBaseAuxiliaryFighter)
            {
               stBaseDefense = this.a_1598.m_stBaseAuxiliaryFighter;
            }
            else if(null != this.a_1598.m_stProtector)
            {
               stBaseDefense = this.a_1598.m_stProtector;
            }
            else if(null != this.a_1598.m_stTrayDefense)
            {
               stBaseDefense = this.a_1598.m_stTrayDefense;
            }
         }
         return stBaseDefense;
      }
   }
}

