package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBGhostMouseMoveIntruder extends a_4206
   {
      
      protected var m_isFlying:Boolean = true;
      
      protected var a_1496:int;
      
      public function WBGhostMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGhostMouseMoveIntruder) as WBGhostMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGhostMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1464 = true;
         a_1339 = 1300;
         a_1279 = -width * 0.5;
         a_1462 = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1462 == true)
            {
               if(iLifeValue > 600)
               {
                  this.SetAnimation2(1);
               }
               else if(a_1275 == 1)
               {
                  this.SetAnimationOnce2Loop2(2,3);
               }
               else
               {
                  this.SetAnimation2(3);
               }
            }
            else if(iLifeValue > 600)
            {
               this.SetAnimation2(4);
            }
            else if(a_1275 == 4)
            {
               this.SetAnimationOnce2Loop2(5,6);
            }
            else
            {
               this.SetAnimation2(6);
            }
         }
         else if(a_1339 <= 0)
         {
            this.SetAnimation2(7);
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var indexY:int = 0;
         var indexX:int = 0;
         super.a_4216(iCurrentTime);
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo <= 0 || iXGridNo >= BattleFieldView.a_1011)
         {
            SetCannotSeeByFighter(false);
         }
         else
         {
            SetCannotSeeByFighter(true);
         }
         if(m_stCurrentFieldGrid)
         {
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
            xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
            yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
            xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
            for(indexY = yStart; indexY <= yEnd; indexY++)
            {
               for(indexX = xStart; indexX <= xEnd; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 1)
                  {
                     SetCannotSeeByFighter(false);
                  }
               }
            }
            for(indexY = 0; indexY < BattleFieldView.a_1012; indexY++)
            {
               for(indexX = 0; indexX < BattleFieldView.a_1011; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 3)
                  {
                     SetCannotSeeByFighter(false);
                  }
               }
            }
         }
         if(a_1462)
         {
            a_1350 = a_3491.a_1080 / (3 * 20);
         }
         else
         {
            a_1350 = a_3491.a_1080 / (1 * 20);
         }
         if(!a_1283)
         {
            a_1350 *= -1;
         }
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

