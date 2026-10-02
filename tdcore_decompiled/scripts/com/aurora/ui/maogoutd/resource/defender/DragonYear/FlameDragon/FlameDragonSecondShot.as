package com.aurora.ui.maogoutd.resource.defender.DragonYear.FlameDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class FlameDragonSecondShot extends a_4348
   {
      
      public function FlameDragonSecondShot()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = -13;
         a_1588 = true;
         a_1575 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(FlameDragonSecondShot) as FlameDragonSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameDragonSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isPenetrate = true;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
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
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               a_3940();
               return;
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(a_1273 == 5)
         {
            this.KillMoveIntruder(a_1584,6);
         }
      }
      
      private function KillMoveIntruder(stFieldGrid:a_3491, m_Step:int) : void
      {
         var i:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var addCenter:Number = stFieldGrid.getStraightShotMultiplier();
         var addBottom:Number = stFieldGrid.getStraightShotMultiplier(1);
         var addTop:Number = stFieldGrid.getStraightShotMultiplier(-1);
         for(i = 1; i <= 8; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + i,stFieldGrid.m_iYGridNo);
            this.KillFieldGrid(stTargetFieldGrid,addCenter);
         }
         for(i = 3; i <= 8; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + i,stFieldGrid.m_iYGridNo - 1);
            this.KillFieldGrid(stTargetFieldGrid,addTop);
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + i,stFieldGrid.m_iYGridNo + 1);
            this.KillFieldGrid(stTargetFieldGrid,addBottom);
         }
      }
      
      private function KillFieldGrid(stFieldGrid:a_3491, multiplier:Number) : void
      {
         var stMoveIntruder:a_4206 = null;
         var Index:int = 0;
         if(stFieldGrid != null)
         {
            a_1325 = multiplier;
            for each(stMoveIntruder in stFieldGrid.a_1511)
            {
               Index = FlameDragonDefence.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID);
               if(0 == stMoveIntruder.iSpaceState && (!stMoveIntruder.isCannotSeeByFighter || Index != -1) && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
               {
                  m_HitMouseArray.push(stMoveIntruder);
                  a_4352(stMoveIntruder);
               }
            }
         }
      }
   }
}

