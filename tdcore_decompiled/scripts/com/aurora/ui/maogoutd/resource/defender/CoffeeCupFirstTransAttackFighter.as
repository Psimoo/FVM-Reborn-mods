package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.CoffeePaoPaoStrengthenShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CoffeeCupFirstTransAttackFighter extends a_3953
   {
      
      public function CoffeeCupFirstTransAttackFighter()
      {
         super();
         a_1095 = 0;
         a_1304 = b_183.b_188;
         a_1310 = 6;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeCupFirstTransAttackFighter) as CoffeeCupFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeCupFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            stLastWaitShot = CoffeePaoPaoStrengthenShot.a_4344();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 1;
               a_1324.push(stLastWaitShot);
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         return super.a_3954(iCurrentTime);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.4 * height;
      }
   }
}

