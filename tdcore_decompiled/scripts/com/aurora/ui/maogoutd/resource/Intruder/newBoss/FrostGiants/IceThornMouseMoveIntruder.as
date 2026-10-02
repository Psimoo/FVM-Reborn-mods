package com.aurora.ui.maogoutd.resource.Intruder.newBoss.FrostGiants
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class IceThornMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1500;
      
      private const HURT_HP:int = 750;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      private var lastFieldGrid:a_3491;
      
      public function IceThornMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(IceThornMouseMoveIntruder) as IceThornMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceThornMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         scaleX = 0.6;
         scaleY = 0.6;
         a_1339 = this.FULL_HP;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         a_1279 = -28;
         a_1467 = 15;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iFieldGridType == 1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         if(!a_1460)
         {
            a_1465 = 0;
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.a_3502(m_stCurrentFieldGrid);
         }
         super.a_4216(iCurrentTime);
         if(iCurrentTime - this.m_iAppearedTime == 8)
         {
            this.ResetMovieStatus();
         }
         else if(iCurrentTime - this.m_iAppearedTime > 10 * 20)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            if(iCurrentTime - this.m_iAppearedTime > 10 * 20 + 12)
            {
               xStart = Math.max(m_stCurrentFieldGrid.m_iXGridNo - 1,0);
               xEnd = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
               yStart = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 1,0);
               yEnd = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
               stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     this.FrozenCard(stFieldGridVector[yIndex][xIndex],true);
                  }
               }
               this.a_3940();
            }
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(this.lastFieldGrid == stFieldGrid)
         {
            return false;
         }
         this.lastFieldGrid = stFieldGrid;
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function FrozenCard(stFieldGrid:a_3491, m_isShowCood:Boolean = false) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = m_isShowCood;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_isShowFrozen = m_isShowCood;
         }
      }
   }
}

