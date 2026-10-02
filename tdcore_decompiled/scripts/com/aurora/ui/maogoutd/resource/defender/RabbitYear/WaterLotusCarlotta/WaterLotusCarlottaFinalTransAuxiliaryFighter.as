package com.aurora.ui.maogoutd.resource.defender.RabbitYear.WaterLotusCarlotta
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import flash.display.FrameLabel;
   
   public class WaterLotusCarlottaFinalTransAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function WaterLotusCarlottaFinalTransAuxiliaryFighter()
      {
         super();
         a_1095 = WaterLotusCarlottaAuxiliaryDefine.DEFENSE_PRICE;
         m_numMoveSpeedMultiplier = -1;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(WaterLotusCarlottaFinalTransAuxiliaryFighter) as WaterLotusCarlottaFinalTransAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterLotusCarlottaFinalTransAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 200;
         m_numAttackAddend = WaterLotusCarlottaAuxiliaryDefine.GetSecondAttackAddend(a_1094);
         PoisonHurtPower = WaterLotusCarlottaAuxiliaryDefine.a_3966(m_iSkillDegree);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return WaterLotusCarlottaAuxiliaryDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      override public function ShowAnimation() : void
      {
         if(a_1273 <= 12)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
      }
   }
}

