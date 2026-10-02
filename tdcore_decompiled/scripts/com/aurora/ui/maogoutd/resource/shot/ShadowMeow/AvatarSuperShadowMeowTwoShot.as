package com.aurora.ui.maogoutd.resource.shot.ShadowMeow
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AvatarSuperShadowMeowTwoShot extends a_4348
   {
      
      private static var ms_stAvatarSuperShadowMeowTwoShotVector:Array = new Array();
      
      private var hitMouseArray:Array = new Array();
      
      public function AvatarSuperShadowMeowTwoShot()
      {
         super();
         a_1279 = -width * 0.5 - 10;
         m_iYDisplayCenterPos = -10;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:AvatarSuperShadowMeowTwoShot = ms_stAvatarSuperShadowMeowTwoShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new AvatarSuperShadowMeowTwoShot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperShadowMeowTwoShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         gotoAndStop(1);
         param4 = a_3491.a_1080 * (0 + 0);
         param5 = a_3491.a_1081 * 6;
         param7 = param6.a_3438(0,6);
         scaleX = scaleY = 0.8;
         this.hitMouseArray = new Array();
         if(param6.iIntruderMoveDirection > 0)
         {
            param4 = BattleFieldView.a_1013 - param4;
         }
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.hitMouseArray = new Array();
         if(ms_stAvatarSuperShadowMeowTwoShotVector.indexOf(this) == -1)
         {
            ms_stAvatarSuperShadowMeowTwoShotVector.push(this);
         }
         return true;
      }
      
      public function ForceRelease() : Boolean
      {
         return this.a_3940();
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
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
            a_1447 = iCurrentTime;
         }
         this.HitMouseMoveIntruderTest();
         if(x < a_3491.a_1080 * 8 && y == a_3491.a_1081 * 6)
         {
            x += m_numXSpeed;
         }
         else if(x == a_3491.a_1080 * 8)
         {
            if(y == a_3491.a_1081 * 0)
            {
               x += -m_numXSpeed;
            }
            else
            {
               y += -Math.abs(m_numXSpeed);
            }
         }
         else if(x < a_3491.a_1080 * 8 && y == a_3491.a_1081 * 0)
         {
            x += -m_numXSpeed;
            if(x < 0)
            {
               this.a_3940();
            }
         }
      }
      
      private function HitMouseMoveIntruderTest() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
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
               if(!stMoveIntruder.isCannotSeeByFighter && (!m_isShotHighSkySpace && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState && a_1576) || 3 == stMoveIntruder.iSpaceState && m_isShotHighSkySpace) && hitTestObject(stMoveIntruder))
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                  }
               }
            }
         }
      }
   }
}

