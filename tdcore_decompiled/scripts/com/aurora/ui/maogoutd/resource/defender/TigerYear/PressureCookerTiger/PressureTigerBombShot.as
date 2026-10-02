package com.aurora.ui.maogoutd.resource.defender.TigerYear.PressureCookerTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.FrameLabel;
   
   public class PressureTigerBombShot extends a_4348
   {
      
      private static var a_1589:Array = new Array();
      
      protected var a_1351:Array;
      
      public function PressureTigerBombShot()
      {
         super();
         this.a_1351 = [];
         a_1279 = -200 + 38;
         m_iYDisplayCenterPos = -18 - 5 + 12;
         a_1573 = 1;
         a_1576 = true;
         a_1577 = false;
         a_1575 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         a_1271 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var _loc_1:* = a_1589.pop();
         if(_loc_1 == null)
         {
            _loc_1 = new PressureTigerBombShot();
         }
         return _loc_1;
      }
      
      override protected function getBindMovie() : Class
      {
         return PressureTigerBombShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1351 = [];
         super.a_3940();
         if(a_1589.indexOf(this) == -1)
         {
            a_1589.push(this);
         }
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.scaleX = this.scaleY = 0.8;
         return true;
      }
      
      override public function a_4216(param1:int) : void
      {
         var _loc_2:a_4206 = null;
         var _loc_3:int = 0;
         var _loc_6:Array = null;
         var _loc_7:a_4425 = null;
         if(param1 % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         x += m_numXSpeed;
         if(!a_1283 && x > BattleFieldView.a_1013 || a_1283 && x < 0)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            _loc_3 = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            _loc_3 = int(x / a_3491.a_1080);
         }
         var _loc_4:* = a_1583.a_3438(_loc_3,m_iYGridNo);
         if(_loc_4)
         {
            _loc_6 = _loc_4.a_1511.slice();
            for each(_loc_2 in _loc_6)
            {
               if(_loc_2.visible && hitTestObject(_loc_2) && this.a_1351.indexOf(_loc_2) == -1)
               {
                  if(_loc_2.iSpaceState == 0 || _loc_2.iSpaceState == 3)
                  {
                     _loc_2.a_3969(a_1579);
                     this.a_1351.push(_loc_2);
                  }
               }
            }
         }
      }
   }
}

