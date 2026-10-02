package com.aurora.ui.maogoutd.resource.shot.rotateWaterGun
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AvatarSuperRotateWaterGunWeaponShot extends a_4348
   {
      
      private static var a_1591:Array = new Array();
      
      private var m_hurtTimes:int = 2;
      
      public function AvatarSuperRotateWaterGunWeaponShot()
      {
         super();
         a_1279 = -60;
         a_1573 = 2;
         a_1574 = 100;
         a_1587 = 0;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperRotateWaterGunWeaponShot:AvatarSuperRotateWaterGunWeaponShot = a_1591.pop();
         if(null == stAvatarSuperRotateWaterGunWeaponShot)
         {
            stAvatarSuperRotateWaterGunWeaponShot = new AvatarSuperRotateWaterGunWeaponShot();
         }
         BattleFieldView.a_1018.play();
         return stAvatarSuperRotateWaterGunWeaponShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperRotateWaterGunWeaponShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         return super.a_1797(iGlobalID,0,iHurtPower,iXpos - 45,iYpos - 72,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               this.reduceMouse();
               if(this.m_hurtTimes > 1)
               {
                  --this.m_hurtTimes;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
               else
               {
                  this.a_3940();
               }
            }
         }
      }
      
      private function reduceMouse() : void
      {
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var a_1334:a_3491 = a_1584;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var yStart:int = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
         var xStart:int = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
         var yEnd:int = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
         var xEnd:int = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
         for(yIndex = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               trace("ReduceLife, Y:" + yIndex + ", X:" + xIndex);
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter))
                  {
                     stMoveIntruder.a_4209(a_1579);
                     stMoveIntruder.a_4208(b_182.a_432,1);
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == a_1591.indexOf(this))
         {
            a_1591.push(this);
         }
         this.m_hurtTimes = 2;
         return true;
      }
   }
}

