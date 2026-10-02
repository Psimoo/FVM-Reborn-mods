package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AlcoholShot extends a_4348
   {
      
      private static const CONTINUE_TIME:int = 20 * 3;
      
      private var appearedTimes:int = 0;
      
      public function AlcoholShot()
      {
         super();
         a_1279 = -width * 0.8;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AlcoholShot,AlcoholShotMovie) as AlcoholShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.appearedTimes = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(a_1273 == 6)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(iCurrentTime - this.appearedTimes >= CONTINUE_TIME && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         else if(a_1273 == a_1274 - 1)
         {
            this.a_3940();
            return;
         }
         this.a_4351();
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         if(!a_1584)
         {
            return;
         }
         var arrMoveIntruder:Array = a_1584.IntruderArray;
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               m_HitMouseArray.push(stMoveIntruder);
               a_4352(stMoveIntruder);
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.appearedTimes = 0;
         return true;
      }
   }
}

