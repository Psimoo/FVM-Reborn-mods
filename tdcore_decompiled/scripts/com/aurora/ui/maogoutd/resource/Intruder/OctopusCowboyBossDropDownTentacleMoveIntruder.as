package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class OctopusCowboyBossDropDownTentacleMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public function OctopusCowboyBossDropDownTentacleMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(OctopusCowboyBossDropDownTentacleMoveIntruder) as OctopusCowboyBossDropDownTentacleMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return OctopusCowboyBossDropDownTentacleMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 200;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1462 = false;
         a_1463 = true;
         this.m_iStartTimeNum = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0)
         {
            a_3940();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3940();
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iStartTimeNum = iCurrentTime;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            a_1275 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(iCurrentTime - this.m_iStartTimeNum == 140)
         {
            a_1339 = 0;
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
         if(iCurrentTime - this.m_iStartTimeNum == 152)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(iCurrentTime - this.m_iStartTimeNum > 170)
         {
            a_3940();
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

