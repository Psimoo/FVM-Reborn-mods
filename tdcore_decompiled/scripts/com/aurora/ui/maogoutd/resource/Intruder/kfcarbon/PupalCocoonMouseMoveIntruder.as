package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class PupalCocoonMouseMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public function PupalCocoonMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PupalCocoonMouseMoveIntruder) as PupalCocoonMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return PupalCocoonMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1000000;
         a_1279 = -width * 1;
         a_1272 = 0;
         a_1462 = true;
         a_1463 = true;
         this.m_iStartTimeNum = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         if(Boolean(this.m_stPosFieldGrid) && 2 == this.m_stPosFieldGrid.m_iFieldGridType)
         {
            this.m_stPosFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iStartTimeNum = iCurrentTime;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
         }
         if(iCurrentTime - this.m_iStartTimeNum > 400)
         {
            if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
            {
               m_stCurrentFieldGrid.m_iFieldGridType = 0;
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(a_1273 == a_1274)
         {
            stop();
         }
      }
   }
}

