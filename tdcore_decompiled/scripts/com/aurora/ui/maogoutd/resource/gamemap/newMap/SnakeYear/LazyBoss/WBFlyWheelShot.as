package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class WBFlyWheelShot extends a_4108
   {
      
      private var m_stGrid:a_3491;
      
      private var m_stBattleView:BattleFieldView;
      
      private var m_iLastNoY:int = 0;
      
      private var m_iDirection:int = 1;
      
      private var m_iMoveSpped:int = 12;
      
      private var m_lBurger:Array = [292552704,292552718,292552719];
      
      public function WBFlyWheelShot()
      {
         a_1279 = -34;
         m_iYDisplayCenterPos = -30;
         super();
      }
      
      public function InitData(grid:a_3491, direction:int = 1) : void
      {
         this.m_iDirection = direction;
         a_1275 = -1;
         play();
         this.m_iLastNoY = -1;
         scaleY = direction;
         this.m_stGrid = grid;
         this.m_stBattleView = grid.m_stCurrentBattbleFieldView;
         this.m_iMoveSpped = 12;
         PlayAnimation(0);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var check:int = 0;
         y += this.m_iMoveSpped * this.m_iDirection;
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(iYGridNo != this.m_iLastNoY)
         {
            this.m_iLastNoY = iYGridNo;
            check = this.CheckGrid(this.m_stGrid.m_iXGridNo,iYGridNo);
            if(check == -1)
            {
               return;
            }
            if(check == 1)
            {
               PlayAnimation(1);
               this.m_iMoveSpped = 6;
            }
            else
            {
               this.m_iMoveSpped = 12;
               PlayAnimation(0);
            }
         }
         else
         {
            this.m_iMoveSpped = 12;
            PlayAnimation(0);
         }
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(y < -100 || y > 600)
         {
            this.a_3940();
         }
      }
      
      public function ShowPlayAnimation2(startIndex:int, loopIndex:int) : void
      {
         a_1275 = loopIndex;
         gotoAndStop((a_1276[startIndex] as FrameLabel).frame);
      }
      
      private function CheckGrid(iNoX:int, iNoY:int) : int
      {
         var typeID:int = 0;
         var stFieldGrid:a_3491 = this.m_stBattleView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return 0;
         }
         var check:int = 0;
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            check = 1;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            typeID = stFieldGrid.m_stAttackFighter.a_3512();
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(100);
            check = 1;
            if(this.m_lBurger.indexOf(typeID) != -1)
            {
               this.a_3940();
               return -1;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(100);
            check = 1;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(100);
            check = 1;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(100);
            check = 1;
         }
         if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(true,0,false,100,1);
            check = 1;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(100);
            check = 1;
         }
         return check;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         return true;
      }
   }
}

