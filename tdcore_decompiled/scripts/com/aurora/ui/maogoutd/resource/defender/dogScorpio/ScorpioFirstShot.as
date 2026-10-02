package com.aurora.ui.maogoutd.resource.defender.dogScorpio
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ScorpioFirstShot extends a_4348
   {
      
      private var m_stLastFieldGrid:a_3491;
      
      public var m_iTransType:int;
      
      public function ScorpioFirstShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 2;
         a_1576 = false;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 1;
         a_1575 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(ScorpioFirstShot) as ScorpioFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ScorpioFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         a_1275 = 1;
         a_1587 = 1;
         gotoAndStop(1);
         this.m_stLastFieldGrid = null;
         m_isPenetrate = true;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stMoveIntruder:a_4206 = null;
         var numHotMultiplier:Number = NaN;
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
            for each(stMoveIntruder in a_1584.a_1511)
            {
               if(Boolean(stMoveIntruder) && Boolean(0 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
               {
                  a_4352(stMoveIntruder);
               }
            }
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         x += m_numXSpeed;
         var iXGridNo:int = a_1584.m_iXGridNo;
         var iYGridNo:int = a_1584.m_iYGridNo;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var stFieldGridClean:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(0 == this.m_iTransType)
         {
            if(null == stFieldGridClean || stFieldGridClean.m_iXGridNo - (BattleFieldView.a_1011 - 1) >= 0)
            {
               a_3940();
            }
         }
         if(Boolean(stFieldGridClean) && stFieldGridClean != this.m_stLastFieldGrid)
         {
            this.m_stLastFieldGrid = stFieldGridClean;
            if(this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter)
            {
               numHotMultiplier = this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
               if(numHotMultiplier > 1)
               {
                  if(numHotMultiplier > a_1325)
                  {
                     if(this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392592 || this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392606 || this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286392607 || this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == 286393376)
                     {
                        trace("猪猪加强器不过火盆");
                     }
                     else
                     {
                        a_1325 = numHotMultiplier;
                        if(a_1275 != 3)
                        {
                           a_1275 = 3;
                           gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                        }
                     }
                  }
               }
            }
            for each(stMoveIntruder in this.m_stLastFieldGrid.a_1511)
            {
               if(Boolean(stMoveIntruder) && Boolean(0 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
               {
                  a_4352(stMoveIntruder);
               }
            }
         }
      }
   }
}

