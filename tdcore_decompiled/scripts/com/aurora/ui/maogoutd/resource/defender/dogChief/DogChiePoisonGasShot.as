package com.aurora.ui.maogoutd.resource.defender.dogChief
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DogChiePoisonGasShot extends a_4348
   {
      
      private static var ms_stDogChiePoisonGasShotVector:Array = new Array();
      
      private static const CONTINUE_TICK:int = 6 * 4;
      
      private var m_iContinueTick:int = 0;
      
      private var m_bIsCanAttack:Boolean;
      
      public function DogChiePoisonGasShot()
      {
         super();
         a_1279 = -50;
         a_1573 = 1;
         a_1588 = true;
         a_1576 = true;
         a_1304 = b_183.enm_Poison;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stDogChiePoisonGasShot:DogChiePoisonGasShot = ms_stDogChiePoisonGasShotVector.pop();
         if(null == stDogChiePoisonGasShot)
         {
            stDogChiePoisonGasShot = new DogChiePoisonGasShot();
         }
         return stDogChiePoisonGasShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stDogChiePoisonGasShotVector.indexOf(this))
         {
            ms_stDogChiePoisonGasShotVector.push(this);
         }
         this.m_iContinueTick = 0;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogChiePoisonGasShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos - 10,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         gotoAndStop(1);
         this.m_iContinueTick = CONTINUE_TICK;
         this.m_bIsCanAttack = false;
         for each(stBaseMoveIntruder in a_1584.a_1511.slice())
         {
            a_4352(stBaseMoveIntruder);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime & 1)
         {
            return;
         }
         nextFrame();
         if(this.m_bIsCanAttack)
         {
            if(this.m_iContinueTick > 0)
            {
               --this.m_iContinueTick;
               this.AttackMoveIntruder();
               if(a_1278 != null)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
         else if(a_1278 != null)
         {
            this.m_bIsCanAttack = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
      
      private function AttackMoveIntruder() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(this.m_iContinueTick == 0)
         {
            for each(stBaseMoveIntruder in a_1584.a_1511.slice())
            {
               a_4352(stBaseMoveIntruder);
            }
         }
         if(this.m_iContinueTick == 12)
         {
            for each(stBaseMoveIntruder in a_1584.a_1511.slice())
            {
               a_4352(stBaseMoveIntruder);
            }
         }
      }
   }
}

