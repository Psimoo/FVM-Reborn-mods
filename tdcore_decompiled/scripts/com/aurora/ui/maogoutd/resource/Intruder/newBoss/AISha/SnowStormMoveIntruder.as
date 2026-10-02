package com.aurora.ui.maogoutd.resource.Intruder.newBoss.AISha
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class SnowStormMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1500;
      
      private const HURT_HP:int = 750;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      public function SnowStormMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SnowStormMoveIntruder) as SnowStormMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnowStormMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1462 = true;
         this.m_iAppearedTime = 0;
         a_1279 = -82;
         a_1467 = -238;
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
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
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
         }
         if(a_1274 - a_1273 == 5)
         {
            this.FrozenCard(m_stCurrentFieldGrid,true);
            this.a_3940();
         }
         return true;
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

