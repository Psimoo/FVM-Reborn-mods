package com.aurora.ui.maogoutd.resource.defender.SnakeYear.HolyFireGoddess
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class HolyFireGoddessBaseShot extends a_4348
   {
      
      private static var ms_stHolyFireGoddessShotVector:Array = new Array();
      
      public function HolyFireGoddessBaseShot()
      {
         super();
         a_1279 = -129;
         m_iYDisplayCenterPos = -24;
         a_1588 = true;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stHolyFireGoddessShot:HolyFireGoddessBaseShot = ms_stHolyFireGoddessShotVector.pop();
         if(null == stHolyFireGoddessShot)
         {
            stHolyFireGoddessShot = new HolyFireGoddessBaseShot();
         }
         BattleFieldView.a_1017.play();
         return stHolyFireGoddessShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return HolyFireGoddessBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isShotHighSkySpace = true;
         a_1577 = false;
         if(a_1584 != null && Boolean(a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,a_1584.m_iXGridNo,a_1584.m_iYGridNo);
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(a_1584 != null && Boolean(a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            a_1584 = null;
         }
         if(-1 == ms_stHolyFireGoddessShotVector.indexOf(this))
         {
            ms_stHolyFireGoddessShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         var step:int = 0;
         var iStart:int = 0;
         var iEnd:int = 0;
         ++a_1447;
         if(a_1447 % 2 == 1)
         {
            return;
         }
         var hit:Boolean = false;
         switch(a_1273)
         {
            case 1:
               iStart = 0;
               iEnd = 3;
               hit = true;
               break;
            case 2:
               iStart = 0;
               iEnd = 6;
               hit = true;
               break;
            case 3:
            case 4:
            case 5:
               iStart = 0;
               iEnd = BattleFieldView.a_1011;
               hit = true;
         }
         if(hit)
         {
            for(i = iStart; i < iEnd; i++)
            {
               for(j = -1; j <= 1; j++)
               {
                  step = a_1283 ? int(-i) : i;
                  stTargetFieldGrid = a_1584.m_stCurrentBattbleFieldView.a_3438(a_1584.m_iXGridNo + step,a_1584.m_iYGridNo + j);
                  if(stTargetFieldGrid != null)
                  {
                     this.KillFieldGrid(stTargetFieldGrid);
                  }
               }
            }
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               this.a_3940();
               return;
            }
         }
      }
      
      private function KillFieldGrid(stFieldGrid:a_3491) : void
      {
         var addCenter:Number = NaN;
         var stMoveIntruder:a_4206 = null;
         var canKill:Boolean = false;
         if(stFieldGrid != null)
         {
            addCenter = stFieldGrid.getStraightShotMultiplier();
            a_1325 = addCenter;
            for each(stMoveIntruder in stFieldGrid.a_1511)
            {
               if(m_HitMouseArray.indexOf(stMoveIntruder) == -1)
               {
                  canKill = false;
                  if(BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                  {
                     canKill = true;
                  }
                  else if(BattleFieldView.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                  {
                     canKill = true;
                  }
                  else if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2)
                  {
                     canKill = true;
                  }
                  if(canKill)
                  {
                     a_4352(stMoveIntruder);
                     m_HitMouseArray.push(stMoveIntruder);
                  }
               }
            }
         }
      }
   }
}

