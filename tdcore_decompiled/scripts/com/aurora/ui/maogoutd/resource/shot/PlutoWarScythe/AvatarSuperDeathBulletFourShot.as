package com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AvatarSuperDeathBulletFourShot extends a_4348
   {
      
      private static var ms_stAvatarSuperDeathBulletFourShotVector:Array = new Array();
      
      public var m_iXMoveTime:int = 0;
      
      public var m_numYInitChangeSpeed:Number = 0;
      
      private var m_iStopTime:int = 0;
      
      private var m_stLastFieldGrid:a_3491;
      
      private var m_stLastSprideFieldGrid:a_3491;
      
      private var passTimes:int;
      
      public var m_FourthGemLevel:int;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,1],[0,-1]];
      
      protected var a_1351:Array = [];
      
      public function AvatarSuperDeathBulletFourShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         this.scaleX = this.scaleY = 72 / 95;
         this.passTimes = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:AvatarSuperDeathBulletFourShot = ms_stAvatarSuperDeathBulletFourShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new AvatarSuperDeathBulletFourShot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperDeathBulletFourShotMovie;
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
         this.passTimes = 0;
         this.m_numYInitChangeSpeed = 0;
         this.m_stLastFieldGrid = null;
         this.m_stLastSprideFieldGrid = null;
         this.a_1351 = [];
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
         if(ms_stAvatarSuperDeathBulletFourShotVector.indexOf(this) == -1)
         {
            ms_stAvatarSuperDeathBulletFourShotVector.push(this);
         }
         this.a_1351 = [];
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
         if(y >= a_1586 && y + m_numYSpeed < a_1586)
         {
            this.m_iXMoveTime = param1 - a_1447;
            ++this.passTimes;
         }
         else if(y <= a_1586 && y + m_numYSpeed > a_1586)
         {
            this.m_iXMoveTime = param1 - a_1447;
            ++this.passTimes;
         }
         if(this.passTimes == 0)
         {
            m_numYSpeed = (-12 - this.m_numYInitChangeSpeed) / 1 - 1.2 * (this.m_iXMoveTime + a_1447 - param1);
            y += m_numYSpeed;
            x += a_1283 ? -6 : 6;
         }
         else if(this.passTimes == 1)
         {
            m_numYSpeed = (17 + this.m_numYInitChangeSpeed) / 1 + 1.2 * (this.m_iXMoveTime + a_1447 - param1);
            y += m_numYSpeed;
            x += a_1283 ? -8 : 8;
         }
         else if(this.passTimes == 2)
         {
            m_numYSpeed = (-17 - this.m_numYInitChangeSpeed) / 1 - 1.2 * (this.m_iXMoveTime + a_1447 - param1);
            y += m_numYSpeed;
            x -= a_1283 ? -8 : 8;
         }
         else if(this.passTimes == 3)
         {
            m_numYSpeed = (12 + this.m_numYInitChangeSpeed) / 1 + 1.2 * (this.m_iXMoveTime + a_1447 - param1);
            y += m_numYSpeed;
            x -= a_1283 ? -6 : 6;
         }
         this.HitMouseMoveIntruderTest();
         if(this.passTimes == 4)
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
         if(_loc_3 != null && this.m_FourthGemLevel >= 0)
         {
            this.a_4360(_loc_3);
         }
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
      
      private function a_4360(stFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0 && -1 == this.a_1351.indexOf(stMoveIntruder))
                  {
                     iReduceLife = a_1579 * this.GetSkillEffectValue();
                     stMoveIntruder.a_4209(iReduceLife);
                     if(stMoveIntruder.iArmorLifeValue <= 0 || a_1576)
                     {
                        stMoveIntruder.a_4208(b_182.a_433,40);
                     }
                     if(stMoveIntruder.visible)
                     {
                        this.a_1351.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
      }
      
      private function GetSkillEffectValue() : int
      {
         var iEffectValue:int = 15;
         switch(this.m_FourthGemLevel)
         {
            case 0:
               iEffectValue = 15;
               break;
            case 1:
               iEffectValue = 17;
               break;
            case 2:
               iEffectValue = 19;
               break;
            case 3:
               iEffectValue = 21;
               break;
            case 4:
               iEffectValue = 23;
               break;
            case 5:
               iEffectValue = 25;
               break;
            case 6:
               iEffectValue = 27;
               break;
            case 7:
               iEffectValue = 29;
               break;
            case 8:
               iEffectValue = 31;
               break;
            case 9:
               iEffectValue = 33;
               break;
            case 10:
               iEffectValue = 35;
               break;
            case 11:
               iEffectValue = 37;
               break;
            case 12:
               iEffectValue = 39;
               break;
            case 13:
               iEffectValue = 41;
               break;
            case 14:
               iEffectValue = 44;
               break;
            case 15:
               iEffectValue = 50;
               break;
            default:
               throw Error("GetSkillEffectValue::星级越界！！！");
         }
         return iEffectValue / 100;
      }
   }
}

