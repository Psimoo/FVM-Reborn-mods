package com.aurora.ui.maogoutd.resource.defender.PigYear.TecgyMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TecgyMeowHighShot extends a_4348
   {
      
      public function TecgyMeowHighShot()
      {
         super();
         a_1587 = 0;
         a_1275 = 0;
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1578 = true;
         a_1577 = false;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(TecgyMeowHighShot,TecgyMeowHighShotMovie) as TecgyMeowHighShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(TecgyMeowHighShot,TecgyMeowHighShot1Movie) as TecgyMeowHighShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(TecgyMeowHighShot,TecgyMeowHighShot2Movie) as TecgyMeowHighShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_iFollowingShotSpaceState = 3;
         m_isShotHighSkySpace = true;
         return true;
      }
      
      override protected function a_4351() : void
      {
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         var stBaseMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stBaseMoveIntruder && hitTestObject(stBaseMoveIntruder))
         {
            a_4352(stBaseMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
   }
}

