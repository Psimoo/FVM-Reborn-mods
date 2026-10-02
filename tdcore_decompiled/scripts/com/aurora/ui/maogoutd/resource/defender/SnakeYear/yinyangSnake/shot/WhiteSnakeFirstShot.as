package com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WhiteSnakeFirstShot extends a_4348
   {
      
      private static var ms_arrSagittariusShotVector:Array = new Array();
      
      private var m_stLastFieldGrid:a_3491;
      
      public function WhiteSnakeFirstShot()
      {
         super();
         a_1279 = -10;
         m_iYDisplayCenterPos = -6;
         a_1587 = 0;
         a_1275 = 0;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stWhiteSnakeFirstShot:WhiteSnakeFirstShot = ms_arrSagittariusShotVector.pop();
         if(null == stWhiteSnakeFirstShot)
         {
            stWhiteSnakeFirstShot = new WhiteSnakeFirstShot();
         }
         BattleFieldView.a_1017.play();
         return stWhiteSnakeFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WhiteSnakeFirstShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotationY = a_1283 ? 180 : 0;
         a_1577 = true;
         m_isCanCrossFireAuxiliary = true;
         m_isCanBounceByAuxiliary = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         m_HitMouseArray = new Array();
         if(-1 == ms_arrSagittariusShotVector.indexOf(this))
         {
            ms_arrSagittariusShotVector.push(this);
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
         a_4351();
         x += m_numXSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && hitTestObject(stMoveIntruder))
         {
            if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               m_HitMouseArray.push(stMoveIntruder);
               this.a_4352(stMoveIntruder);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return true;
            }
            if(!m_isPenetrate)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               this.a_4352(stMoveIntruder);
               m_isHited = true;
               this.a_3940();
               return true;
            }
         }
         return false;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         return true;
      }
   }
}

