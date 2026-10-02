package com.aurora.ui.maogoutd.resource.shot.YouYouGun
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class AvatarYouYouGunShot extends a_4348
   {
      
      private static var a_1589:Array = new Array();
      
      private var m_stYouYouRope:YouYouRope = new YouYouRope();
      
      private var startPosition:Point;
      
      private var targetPosition:Point;
      
      private var m_ratation:Number;
      
      private var moveSpeed:int;
      
      private var m_MouseArr:Array = new Array(8388609,8388610,8388611,8388616,8388865,8388866,8388867,8388657,8388658,8388659,8388897,8388898,8388899,8388752,8388753,8388755,8389109,8389110,8389209,8389210,8389309,8389310,8389409,8389410,8392705,8392706,8392707,8392753,8392754,8392755,8392993,8392994,8392995,8389316,8388759,8389115,8389216,8389217,8389111);
      
      public var m_GoHeadArray:Array = new Array();
      
      public var m_GoBackArray:Array = new Array();
      
      public function AvatarYouYouGunShot()
      {
         super();
         a_1279 = -30;
         m_iYDisplayCenterPos = -23 - 10;
         a_1573 = 1;
         a_1575 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         scaleX = scaleY = 0.9;
         this.m_stYouYouRope.width = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var _loc_1:* = a_1589.pop();
         if(_loc_1 == null)
         {
            _loc_1 = new AvatarYouYouGunShot();
         }
         return _loc_1;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarYouYouGunShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var dy:Number = NaN;
         var dx:Number = NaN;
         numSpeed = 15;
         iYpos += 8;
         iXpos += 14;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isPenetrate = true;
         m_isShotHighSkySpace = true;
         while(this.m_GoHeadArray.length > 0)
         {
            this.m_GoHeadArray.pop();
         }
         while(this.m_GoBackArray.length > 0)
         {
            this.m_GoBackArray.pop();
         }
         this.m_stYouYouRope.x = iXpos;
         this.m_stYouYouRope.y = iYpos;
         this.m_stYouYouRope.width = 0;
         a_1583.AddToBattleView(this.m_stYouYouRope,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stStartFieldGrid);
         this.startPosition = new Point(iXpos,iYpos);
         if(m_isSpecial == 0)
         {
            this.targetPosition = new Point(BattleFieldView.a_1013 - 20,iYpos + 0);
            dy = this.targetPosition.y - this.startPosition.y;
            dx = this.targetPosition.x - this.startPosition.x;
            this.m_ratation = Math.atan2(dy,dx);
            m_numXSpeed = 1 * Math.abs(numSpeed);
            m_numYSpeed = 1 * Math.tan(this.m_ratation) * Math.abs(numSpeed);
            this.rotation = this.m_stYouYouRope.rotation = this.m_ratation * 180 / Math.PI;
         }
         else if(m_isSpecial == 1)
         {
            this.targetPosition = new Point(BattleFieldView.a_1013 - 20,iYpos - 64);
            dy = this.targetPosition.y - this.startPosition.y;
            dx = this.targetPosition.x - this.startPosition.x;
            this.m_ratation = Math.atan2(dy,dx);
            m_numXSpeed = 1 * Math.abs(numSpeed);
            m_numYSpeed = 1 * Math.tan(this.m_ratation) * Math.abs(numSpeed);
            this.rotation = this.m_stYouYouRope.rotation = this.m_ratation * 180 / Math.PI;
         }
         else if(m_isSpecial == 2)
         {
            this.targetPosition = new Point(BattleFieldView.a_1013 - 20,iYpos + 64);
            dy = this.targetPosition.y - this.startPosition.y;
            dx = this.targetPosition.x - this.startPosition.x;
            this.m_ratation = Math.atan2(dy,dx);
            m_numXSpeed = 1 * Math.abs(numSpeed);
            m_numYSpeed = 1 * Math.tan(this.m_ratation) * Math.abs(numSpeed);
            this.rotation = this.m_stYouYouRope.rotation = this.m_ratation * 180 / Math.PI;
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_stYouYouRope.width = 0;
         if(Boolean(this.m_stYouYouRope.parent) && this.m_stYouYouRope.parent.contains(this.m_stYouYouRope))
         {
            this.m_stYouYouRope.parent.removeChild(this.m_stYouYouRope);
         }
         super.a_3940();
         if(a_1589.indexOf(this) == -1)
         {
            a_1589.push(this);
         }
         while(this.m_GoHeadArray.length > 0)
         {
            this.m_GoHeadArray.pop();
         }
         while(this.m_GoBackArray.length > 0)
         {
            this.m_GoBackArray.pop();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
         var dis:Number = Point.distance(this.startPosition,new Point(x,y));
         this.m_stYouYouRope.width = dis * Math.abs(Math.cos(this.m_ratation));
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var stIntruderRemoteThrowEffect:a_4425 = null;
         var i:int = 0;
         if(x > BattleFieldView.a_1013 + 14 && m_numXSpeed > 0)
         {
            m_numXSpeed = -m_numXSpeed;
            m_numYSpeed = -m_numYSpeed;
         }
         if(x <= this.startPosition.x && m_numXSpeed < 0)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && stMoveIntruder.iSpaceState != 1 && hitTestObject(stMoveIntruder))
               {
                  if(m_numXSpeed < 0 && this.m_GoBackArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.m_GoBackArray.push(stMoveIntruder);
                     if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                     {
                        stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                        stMoveIntruder.a_3432();
                     }
                     else if(Boolean(stMoveIntruder as IBossMoveIntruder) && (!stMoveIntruder.hasOwnProperty("IsBoss") || (stMoveIntruder as BaseBossMoveIntruder).IsBoss))
                     {
                        stMoveIntruder.a_3969(900);
                     }
                     else
                     {
                        stMoveIntruder.a_3969(900);
                        if(stMoveIntruder.iLifeValue <= 0)
                        {
                           stMoveIntruder.a_3432();
                        }
                     }
                  }
                  else if(m_numXSpeed > 0 && this.m_GoHeadArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.m_GoHeadArray.push(stMoveIntruder);
                     if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                     {
                        stIntruderRemoteThrowEffect = a_4425.a_3926();
                        stIntruderRemoteThrowEffect.a_1797(stMoveIntruder.stDisplayBitmap.bitmapData.clone(),a_1283);
                        stIntruderRemoteThrowEffect.x = stMoveIntruder.x;
                        stIntruderRemoteThrowEffect.y = stMoveIntruder.y;
                        parent.addChild(stIntruderRemoteThrowEffect);
                        stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                        stMoveIntruder.a_3432();
                     }
                     else if(Boolean(stMoveIntruder as IBossMoveIntruder) && (!stMoveIntruder.hasOwnProperty("IsBoss") || (stMoveIntruder as BaseBossMoveIntruder).IsBoss))
                     {
                        stMoveIntruder.a_3969(900);
                     }
                     else
                     {
                        stMoveIntruder.a_3969(900);
                        if(stMoveIntruder.iLifeValue <= 0)
                        {
                           stMoveIntruder.a_3432();
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

