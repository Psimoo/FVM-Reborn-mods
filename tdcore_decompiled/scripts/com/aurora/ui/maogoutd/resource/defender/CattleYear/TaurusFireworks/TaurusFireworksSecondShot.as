package com.aurora.ui.maogoutd.resource.defender.CattleYear.TaurusFireworks
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.FrameLabel;
   
   public class TaurusFireworksSecondShot extends a_4348
   {
      
      public function TaurusFireworksSecondShot()
      {
         super();
         a_1279 = -155;
         m_iYDisplayCenterPos = -81;
         a_1573 = 1;
         m_isShotHighSkySpace = true;
         a_1575 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(TaurusFireworksSecondShot) as TaurusFireworksSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusFireworksSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_numXSpeed = numSpeed;
         if(m_isSpecial == 1)
         {
            m_numXSpeed *= -1;
            a_1283 = true;
            a_1279 = -180;
         }
         else
         {
            a_1283 = false;
            a_1279 = -175;
         }
         gotoAndStop(1);
         return true;
      }
      
      override public function a_4216(param1:int) : void
      {
         var _loc_2:a_4206 = null;
         var _loc_7:a_4425 = null;
         _loc_2 = null;
         var _loc_3:int = 0;
         var _loc_6:Array = null;
         _loc_7 = null;
         if(param1 % 2 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         x += m_numXSpeed;
         if(x > BattleFieldView.a_1013 + 16 || x < -16)
         {
            this.a_3940();
            return;
         }
         _loc_3 = int(x / a_3491.a_1080);
         var _loc_4:* = a_1583.a_3438(_loc_3,m_iYGridNo);
         var _loc_5:* = a_1583.a_3438(_loc_3 - 1,m_iYGridNo);
         if(a_1283)
         {
            _loc_5 = a_1583.a_3438(_loc_3 + 1,m_iYGridNo);
         }
         if(_loc_4)
         {
            _loc_6 = _loc_4.a_1511.slice();
            for each(_loc_2 in _loc_6)
            {
               if(_loc_2.visible && hitTestObject(_loc_2) && m_HitMouseArray.indexOf(_loc_2) == -1)
               {
                  if(_loc_2.iSpaceState == 0)
                  {
                     _loc_7 = a_4425.a_3926();
                     _loc_7.a_1797(_loc_2.stDisplayBitmap.bitmapData.clone(),a_1283);
                     _loc_7.x = _loc_2.x;
                     _loc_7.y = _loc_2.y;
                     parent.addChild(_loc_7);
                  }
                  _loc_2.a_4212();
                  if(_loc_2.visible)
                  {
                     m_HitMouseArray.push(_loc_2);
                  }
               }
            }
         }
         if(_loc_5)
         {
            _loc_6 = _loc_5.a_1511.slice();
            for each(_loc_2 in _loc_6)
            {
               if(_loc_2.visible && hitTestObject(_loc_2) && this.m_HitMouseArray.indexOf(_loc_2) == -1)
               {
                  if(_loc_2.iSpaceState == 0)
                  {
                     _loc_7 = a_4425.a_3926();
                     _loc_7.a_1797(_loc_2.stDisplayBitmap.bitmapData.clone(),a_1283);
                     _loc_7.x = _loc_2.x;
                     _loc_7.y = _loc_2.y;
                     parent.addChild(_loc_7);
                  }
                  _loc_2.a_4212();
                  if(_loc_2.visible)
                  {
                     this.m_HitMouseArray.push(_loc_2);
                  }
               }
            }
         }
      }
   }
}

