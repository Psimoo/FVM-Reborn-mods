package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.GuaGuaMap
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class GuaGuaXiangPuShot extends a_4348
   {
      
      private var m_iAttackType:int = 0;
      
      private var m_TargetFieldGrid:a_3491;
      
      private var m_TargetPosition:Point = new Point();
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      public function GuaGuaXiangPuShot()
      {
         super();
         a_1279 = -20;
         m_iYDisplayCenterPos = -10;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function GetFreeShotDay() : GuaGuaXiangPuShot
      {
         return PoolManager.getInstance().CheckOutOne(GuaGuaXiangPuShot,GuaGuaDayShotMovie) as GuaGuaXiangPuShot;
      }
      
      public static function GetFreeShotNight() : GuaGuaXiangPuShot
      {
         return PoolManager.getInstance().CheckOutOne(GuaGuaXiangPuShot,GuaGuaNightShotMovie) as GuaGuaXiangPuShot;
      }
      
      public static function AttackFieldGrid(grid:a_3491, attackType:int) : void
      {
         var stBaseDefense:a_3962 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(attackType == 0)
         {
            if(null != grid.m_stAttackFighter)
            {
               stBaseDefense = grid.m_stAttackFighter;
            }
            else if(null != grid.m_stBoomDefense)
            {
               stBaseDefense = grid.m_stBoomDefense;
            }
            else if(null != grid.m_stFlowerDefense)
            {
               stBaseDefense = grid.m_stFlowerDefense;
            }
            else if(null != grid.m_stBaseAuxiliaryFighter)
            {
               stBaseDefense = grid.m_stBaseAuxiliaryFighter;
            }
            else if(null != grid.m_stProtector)
            {
               stBaseDefense = grid.m_stProtector;
            }
            else if(null != grid.m_stTrayDefense)
            {
               stBaseDefense = grid.m_stTrayDefense;
            }
            if(stBaseDefense != null && !(stBaseDefense is a_3924))
            {
               stBaseDefense.a_3969(30);
            }
         }
         else
         {
            arrMoveIntruder = grid.a_1511.slice();
            for each(stMoveIntruder in arrMoveIntruder)
            {
               if(stMoveIntruder.IsBossIntruder)
               {
                  stMoveIntruder.a_3969(30000);
               }
               else
               {
                  stMoveIntruder.a_3969(3000);
               }
            }
         }
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_iFollowingShotSpaceState = 3;
         m_isShotHighSkySpace = true;
         return true;
      }
      
      public function InitData(grid:a_3491, attackType:int) : void
      {
         this.m_iAttackType = attackType;
         this.m_TargetFieldGrid = grid;
         this.m_TargetPosition.x = grid.m_iXGridNo * 60 + 30;
         this.m_TargetPosition.y = grid.m_iYGridNo * 64 + 32;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var dx:Number = this.m_TargetPosition.x - x;
         var dy:Number = this.m_TargetPosition.y - y;
         this.m_rotationRadian = Math.atan2(dy,dx);
         a_1581 = int(Math.sqrt(dx * dx + dy * dy) / m_numXSpeed);
         m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
         if(numDistance < 2 * a_3491.a_1080)
         {
            if(a_1581 < 2)
            {
               a_1581 = 2;
            }
            m_numYSpeed = a_3491.a_1081 * 0.6 / a_1581;
         }
         else
         {
            m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
         }
         this.m_realXSpeed = m_numXSpeed * Math.cos(this.m_rotationRadian);
         this.m_baseYDirection = m_numXSpeed * Math.sin(this.m_rotationRadian);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var t:Number = NaN;
         var baseY:Number = NaN;
         var parabolaY:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            nextFrame();
            return;
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         x += this.m_realXSpeed;
         if(a_1576)
         {
            this.m_MoveTime = iCurrentTime - a_1447;
            t = (iCurrentTime - a_1447) / a_1581;
            baseY = this.m_baseYDirection;
            parabolaY = 2 * m_numYSpeed * t - m_numYSpeed;
            y += baseY + parabolaY;
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
         if(x <= 0 || x > BattleFieldView.a_1013 + 10)
         {
            a_3940();
            return;
         }
         if((this.m_iAttackType == 0 && x <= this.m_TargetPosition.x || this.m_iAttackType == 1 && x >= this.m_TargetPosition.x) && Boolean(this.m_TargetFieldGrid))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            this.DamageFieldGrid(this.m_TargetFieldGrid);
         }
      }
      
      private function DamageFieldGrid(grid:a_3491) : void
      {
         var stAurDataEvent:a_1778 = new a_1778("GuaGuaXiangPuShotHited_" + (grid.m_iYGridNo * 100 + grid.m_iXGridNo));
         a_1789.getInstance().dispatchEvent(stAurDataEvent);
         AttackFieldGrid(grid,this.m_iAttackType);
      }
   }
}

