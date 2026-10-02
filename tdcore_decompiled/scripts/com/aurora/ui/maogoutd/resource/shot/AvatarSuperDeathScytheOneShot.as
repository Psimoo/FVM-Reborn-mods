package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class AvatarSuperDeathScytheOneShot extends a_4348
   {
      
      private static var ms_stAvatarSuperDeathScytheOneShotVector:Array = new Array();
      
      public var m_iXMoveTime:int = 0;
      
      public var m_numYInitChangeSpeed:Number = 0;
      
      private var m_iStopTime:int = 0;
      
      private var m_stLastFieldGrid:a_3491;
      
      private var m_stLastSprideFieldGrid:a_3491;
      
      public function AvatarSuperDeathScytheOneShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:AvatarSuperDeathScytheOneShot = ms_stAvatarSuperDeathScytheOneShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new AvatarSuperDeathScytheOneShot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperDeathScytheOneShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         gotoAndStop(1);
         param4 = a_3491.a_1080 * (0 + 0);
         param5 = a_3491.a_1081 * 3 + 0.5 * (a_3491.a_1081 - height);
         param7 = param6.a_3438(0,3);
         if(param6.iIntruderMoveDirection > 0)
         {
            param4 = BattleFieldView.a_1013 - param4;
         }
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         a_1447 = 0;
         this.m_iStopTime = 0;
         this.m_iXMoveTime = 0;
         this.m_numYInitChangeSpeed = 0;
         this.m_stLastFieldGrid = null;
         this.m_stLastSprideFieldGrid = null;
         if(a_1283)
         {
            this.m_numYInitChangeSpeed = 0.8 * 4;
         }
         else if(param6.isOwnBattleField && param6.m_stOpponentBattleFieldInstance.visible == true)
         {
            this.m_numYInitChangeSpeed = 0.8 * 4;
         }
         else
         {
            this.m_numYInitChangeSpeed = 0.8 * 7;
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(ms_stAvatarSuperDeathScytheOneShotVector.indexOf(this) == -1)
         {
            ms_stAvatarSuperDeathScytheOneShotVector.push(this);
         }
         return true;
      }
      
      public function ForceRelease() : Boolean
      {
         return this.a_3940();
      }
      
      override public function a_4216(param1:int) : void
      {
         if(m_isHited)
         {
            if(this.m_iStopTime > 0)
            {
               --this.m_iStopTime;
               return;
            }
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
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
         if(a_1447 == 0)
         {
            a_1447 = param1;
         }
         if(this.m_iXMoveTime == 0 && y > a_1586)
         {
            this.m_iXMoveTime = param1 - a_1447;
         }
         if(this.m_iXMoveTime > 0)
         {
            m_numYSpeed = 10 + this.m_numYInitChangeSpeed + 0.6 * (this.m_iXMoveTime + a_1447 - param1);
         }
         else
         {
            m_numYSpeed = -10 - this.m_numYInitChangeSpeed - 0.6 * (a_1447 - param1);
         }
         y += m_numYSpeed;
         if(y <= a_1586)
         {
            x += a_1283 ? -9 : 9;
         }
         else
         {
            x -= a_1283 ? -9 : 9;
         }
         this.HitMouseMoveIntruderTest();
         if(this.m_iXMoveTime > 0 && param1 - a_1447 == 2 * this.m_iXMoveTime)
         {
            this.a_3940();
         }
      }
      
      private function HitMouseMoveIntruderTest() : void
      {
         var _loc_4:a_4206 = null;
         var _loc_1:int = int(x / a_3491.a_1080);
         var _loc_2:int = int(y / a_3491.a_1081);
         var _loc_3:a_3491 = a_1583.a_3438(_loc_1,_loc_2);
         if(Boolean(_loc_3) && this.m_stLastFieldGrid != _loc_3)
         {
            this.m_stLastFieldGrid = _loc_3;
            for each(_loc_4 in _loc_3.a_1511)
            {
               if(_loc_4)
               {
                  _loc_4.a_3969(a_1579);
                  _loc_4.a_4208(b_182.a_432,8);
               }
            }
         }
         _loc_3 = a_1583.a_3438(_loc_1 + 1,_loc_2);
         if(Boolean(_loc_3) && this.m_stLastSprideFieldGrid != _loc_3)
         {
            this.m_stLastSprideFieldGrid = _loc_3;
            for each(_loc_4 in _loc_3.a_1511)
            {
               if(Boolean(_loc_4) && _loc_4.iSpaceState == 0)
               {
                  _loc_4.a_3969(a_1579);
                  _loc_4.a_4208(b_182.a_432,10);
               }
            }
         }
      }
   }
}

