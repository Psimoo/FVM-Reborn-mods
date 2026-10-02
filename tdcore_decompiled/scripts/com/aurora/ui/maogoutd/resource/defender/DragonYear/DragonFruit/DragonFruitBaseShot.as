package com.aurora.ui.maogoutd.resource.defender.DragonYear.DragonFruit
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DragonFruitBaseShot extends a_4348
   {
      
      private static var ms_stDragonFruitBaseShotVector:Array = new Array();
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      private var appearedTimes:int = 0;
      
      public function DragonFruitBaseShot()
      {
         super();
         a_1279 = -33;
         m_iYDisplayCenterPos = -9;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stDragonFruitBaseShot:DragonFruitBaseShot = ms_stDragonFruitBaseShotVector.pop();
         if(null == stDragonFruitBaseShot)
         {
            stDragonFruitBaseShot = new DragonFruitBaseShot();
         }
         BattleFieldView.a_1017.play();
         return stDragonFruitBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonFruitBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.appearedTimes = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.m_isParentAttackDie)
         {
            this.a_3940();
            return;
         }
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(iCurrentTime - this.appearedTimes >= 0.75 * 20)
         {
            this.a_3940();
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stDragonFruitBaseShotVector.indexOf(this))
         {
            ms_stDragonFruitBaseShotVector.push(this);
         }
         this.a_1596 = -1;
         this.m_isParentAttackDie = false;
         return true;
      }
   }
}

