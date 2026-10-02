package com.aurora.ui.maogoutd.resource.defender.RabbitYear.LeagueGod
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class LeagueGodFirstShot extends a_4348
   {
      
      private static var ms_stLeagueGodFirstShotVector:Array = new Array();
      
      private var moveSpeed:int;
      
      public function LeagueGodFirstShot()
      {
         super();
         a_1279 = -38;
         m_iYDisplayCenterPos = -34;
         a_1573 = 1;
         scaleX = scaleY = 0.5;
         a_1588 = true;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stLeagueGodFirstShot:LeagueGodFirstShot = ms_stLeagueGodFirstShotVector.pop();
         if(null == stLeagueGodFirstShot)
         {
            stLeagueGodFirstShot = new LeagueGodFirstShot();
         }
         return stLeagueGodFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LeagueGodFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.moveSpeed = Math.abs(numSpeed);
         rotationY = 0;
         a_1577 = true;
         m_isCanCrossFireAuxiliary = false;
         m_isCanBounceByAuxiliary = true;
         m_isChangeYGridNo = true;
         m_isPenetrate = true;
         switch(m_isSpecial)
         {
            case 1:
               m_numYSpeed = 0;
               m_numXSpeed = 1 * Math.abs(this.moveSpeed);
               rotation = 0;
               m_isChangeYGridNo = false;
               break;
            case 2:
               m_numXSpeed = Math.cos(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = -Math.sin(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = -22.5;
               break;
            case 3:
               m_numXSpeed = Math.cos(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = Math.sin(22.5 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = 22.5;
               break;
            case 4:
               m_numXSpeed = Math.cos(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = -Math.sin(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = -45;
               break;
            case 5:
               m_numXSpeed = Math.cos(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               m_numYSpeed = Math.sin(45 * Math.PI / 180) * Math.abs(this.moveSpeed);
               rotation = 45;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               m_isHited = false;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            nextFrame();
            a_4351();
            x += m_numXSpeed;
            y += m_numYSpeed;
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
         y += m_numYSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 + 20 || y < -20 || y > BattleFieldView.a_1014)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
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
               a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
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
               a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return true;
            }
         }
         return false;
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
      }
      
      override protected function ReboundHandler() : void
      {
         switch(m_isSpecial)
         {
            case 1:
               rotation = 0 + 180;
               break;
            case 2:
               rotation = -22.5 + 180;
               break;
            case 3:
               rotation = 22.5 + 180;
               break;
            case 4:
               rotation = -45 + 180;
               break;
            case 5:
               rotation = 45 + 180;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stLeagueGodFirstShotVector.indexOf(this))
         {
            ms_stLeagueGodFirstShotVector.push(this);
         }
         return true;
      }
   }
}

