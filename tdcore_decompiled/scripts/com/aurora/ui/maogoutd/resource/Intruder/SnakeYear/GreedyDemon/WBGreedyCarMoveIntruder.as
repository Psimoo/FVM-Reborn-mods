package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBGreedyCarMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 600;
      
      private static const ONE_GRID_SPEED:Number = 0.5;
      
      private var attackList:Array = new Array();
      
      private var inFront:Boolean = false;
      
      private var iState:int = 0;
      
      public function WBGreedyCarMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBGreedyCarMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyCarMoveIntruder) as WBGreedyCarMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyCarMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         a_1279 = -width * 0.2;
         m_iYDisplayCenterPos = -33;
         a_1272 = 0;
         this.SetAnimation(0);
         this.attackList.length = 0;
         return true;
      }
      
      public function SetMove2Front() : void
      {
         this.inFront = true;
         this.iState = 0;
         a_1283 = true;
         this.UpdateSpeed();
      }
      
      public function SetMove2Back() : void
      {
         this.inFront = false;
         this.iState = 0;
         a_1283 = false;
         this.UpdateSpeed();
      }
      
      private function UpdateSpeed() : void
      {
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = 0;
         iXGridNo = int((x + 15) / a_3491.a_1080);
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         if(iXGridNo >= BattleFieldView.a_1011)
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
         }
         return iXGridNo;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         var iXGridNo:int = stFieldGrid.m_iXGridNo;
         if(a_1283)
         {
            iXGridNo = 100 + iXGridNo;
         }
         if(this.attackList.indexOf(iXGridNo) != -1)
         {
            return true;
         }
         this.attackList.push(iXGridNo);
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(1000);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(1000);
         }
         else if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(1000);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(1000);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(1000);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,1000,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(1000);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         x += a_1350 * a_1470;
         var iXGridNo:int = this.GetiNoX();
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         this.a_3502(m_stCurrentFieldGrid);
         if(this.inFront)
         {
            if(this.iState == 0 && x >= 510)
            {
               a_1283 = false;
               this.iState = 1;
               this.UpdateSpeed();
            }
            else if(this.iState == 1 && x <= 145)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
            }
         }
         else if(this.iState == 0 && x <= 30)
         {
            a_1283 = true;
            this.iState = 1;
            this.UpdateSpeed();
         }
         else if(this.iState == 1 && x >= 395)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      public function SetAnimation(animIdx:int) : void
      {
         a_1275 = animIdx;
         gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
   }
}

