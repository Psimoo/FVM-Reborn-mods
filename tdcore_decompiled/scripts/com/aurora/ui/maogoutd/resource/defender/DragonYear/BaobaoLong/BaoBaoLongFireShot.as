package com.aurora.ui.maogoutd.resource.defender.DragonYear.BaobaoLong
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BaoBaoLongFireShot extends a_4348
   {
      
      public function BaoBaoLongFireShot()
      {
         super();
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(BaoBaoLongFireShot) as BaoBaoLongFireShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaoBaoLongFireShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = numSpeed < 0 ? -180 : 0;
         a_1587 = 0;
         a_1275 = 0;
         a_1588 = true;
         a_1279 = 0;
         m_iYDisplayCenterPos = -2;
         return true;
      }
      
      override protected function JudgePassFireTower(stFieldGrid:a_3491, numHotMultiplier:Number) : a_4348
      {
         a_1325 = numHotMultiplier;
         return null;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var stEffect:BaoBaoLongFireEffect = null;
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               if(a_1283)
               {
                  iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
               }
               else
               {
                  iXGridNo = int(x / a_3491.a_1080);
               }
               stFieldGrid = a_1583.a_3438(iXGridNo,m_iYGridNo);
               for(i = -1; i <= 1; i++)
               {
                  stTargetFieldGrid = a_1583.a_3438(iXGridNo,m_iYGridNo + i);
                  if(stTargetFieldGrid != null)
                  {
                     stEffect = BaoBaoLongFireEffect.a_3926();
                     stEffect.InitData(stTargetFieldGrid,GetFinalDamage());
                     stEffect.a_1797(false);
                     stEffect.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 - 25;
                     stEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 - 55;
                     a_1583.AddToBattleView(stEffect,BattleLayerDefine.SHOT_TYPE,stTargetFieldGrid);
                     a_1583.m_arrEffectArray.push(stEffect);
                  }
               }
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         a_4351();
         x += m_numXSpeed;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(GetFinalDamage());
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage());
         }
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
            }
         }
         if(a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         if(baseMoveIntruder.iLifeValue <= 0 && Boolean(baseMoveIntruder.m_stCurrentFieldGrid))
         {
            baseMoveIntruder.a_4210();
         }
         return true;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

