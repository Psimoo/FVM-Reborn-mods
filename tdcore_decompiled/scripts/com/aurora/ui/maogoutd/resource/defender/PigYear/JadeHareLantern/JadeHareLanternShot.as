package com.aurora.ui.maogoutd.resource.defender.PigYear.JadeHareLantern
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class JadeHareLanternShot extends a_4348
   {
      
      public var m_HurtTimes:int;
      
      public var m_BurnTimes:int = 160;
      
      private var m_startBurn:int;
      
      private var hitMouseArray:Array = new Array();
      
      public function JadeHareLanternShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1275 = 0;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(JadeHareLanternShot) as JadeHareLanternShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return JadeHareLanternShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.hitMouseArray = new Array();
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.hitMouseArray = new Array();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
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
         if(a_1447 == 0)
         {
            a_1447 = iCurrentTime;
         }
         if(iCurrentTime - a_1447 >= this.m_BurnTimes)
         {
            this.a_3940();
         }
         else if(iCurrentTime % 2 == 0)
         {
            this.a_4360();
         }
      }
      
      private function a_4360() : void
      {
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var arrMoveIntruder:Array = a_1584.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               iReduceLife = a_1579;
               stMoveIntruder.a_4209(iReduceLife);
               this.hitMouseArray.push(stMoveIntruder);
            }
         }
      }
   }
}

