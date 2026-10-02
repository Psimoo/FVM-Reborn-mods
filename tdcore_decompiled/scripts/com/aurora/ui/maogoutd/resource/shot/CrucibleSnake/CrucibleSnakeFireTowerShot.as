package com.aurora.ui.maogoutd.resource.shot.CrucibleSnake
{
   import a_4718.b_182;
   import a_4718.b_183;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class CrucibleSnakeFireTowerShot extends a_4348
   {
      
      private var killRate:int;
      
      private var boundRate:int;
      
      public function CrucibleSnakeFireTowerShot()
      {
         super();
         a_1279 = -37;
         m_iYDisplayCenterPos = -8;
         a_1588 = true;
         a_1304 = b_183.enm_CrucibleSnakeFireTowerShot;
         a_1573 = 1;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CrucibleSnakeFireTowerShot,CrucibleSnakeFireTowerShotMovie) as CrucibleSnakeFireTowerShot;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotationY = m_numXSpeed < 0 ? -180 : 0;
         m_isShotHighSkySpace = Boolean(m_isSpecial > 1);
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.killRate = m_isSpecial == 3 ? 50 : 20;
         this.boundRate = m_isSpecial == 3 ? 15 : 5;
         return true;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013)
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(m_iCanHitGostMouse && BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
         {
            return true;
         }
         if(stMoveIntruder.isCannotSeeByFighter)
         {
            return false;
         }
         var space:int = stMoveIntruder.iSpaceState;
         if(space == 0)
         {
            return true;
         }
         if(space == 2 && a_1576)
         {
            return true;
         }
         return false;
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(this.checkCanHit(stMoveIntruder) && hitTestObject(stMoveIntruder))
         {
            if(Boolean(a_1583) && a_1583.isOwnBattleField)
            {
               BattleFieldView.a_1045.play();
            }
            if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               m_HitMouseArray.push(stMoveIntruder);
               this.hitMouse(stFieldGrid,stMoveIntruder);
               return true;
            }
            if(!m_isPenetrate)
            {
               HitMoveIntruder2(stMoveIntruder,[132]);
               m_bActive.Value = false;
               a_3940();
               return true;
            }
         }
         return false;
      }
      
      private function hitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         var randomKill:int = 0;
         var effect:CrucibleSnakeFireShotDeadEffect = null;
         var randomFreeze:int = 0;
         var hitDie:Boolean = false;
         if(!stMoveIntruder.IsElite && !stMoveIntruder.IsBossIntruder)
         {
            randomKill = m_iRandomArrOne.length > 0 ? int(m_iRandomArrOne.pop()) : 0;
            if(randomKill <= this.killRate)
            {
               hitDie = true;
            }
         }
         if(hitDie)
         {
            stMoveIntruder.ReduceLife2(stMoveIntruder.iLifeValue,[132]);
            if(stMoveIntruder.iLifeValue <= 0 && stMoveIntruder.visible && !stMoveIntruder.IsBossIntruder && !stMoveIntruder.IsWaterIntruder && Boolean(stMoveIntruder.parent))
            {
               stMoveIntruder.a_3432();
               effect = CrucibleSnakeFireShotDeadEffect.a_3926();
               effect.a_1797(false);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
               effect.x = stMoveIntruder.x;
               effect.y = stMoveIntruder.y;
            }
         }
         else
         {
            HitMoveIntruder2(stMoveIntruder,[132]);
            if(Boolean(stMoveIntruder && stMoveIntruder.visible) && Boolean(stMoveIntruder.iLifeValue > 0) && !stMoveIntruder.IsBossIntruder)
            {
               randomFreeze = m_iRandomArrTwo.length > 0 ? int(m_iRandomArrTwo.pop()) : 0;
               if(randomFreeze <= this.boundRate)
               {
                  stMoveIntruder.a_4208(b_182.a_435,15);
               }
            }
         }
         ExecuteTriggers(stMoveIntruder);
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

