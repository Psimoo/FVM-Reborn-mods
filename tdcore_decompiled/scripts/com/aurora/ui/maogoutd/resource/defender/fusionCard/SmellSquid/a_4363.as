package com.aurora.ui.maogoutd.resource.defender.fusionCard.SmellSquid
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class a_4363 extends a_4348
   {
      
      public function a_4363()
      {
         super();
         _damageParams = [132];
         a_1279 = -width * 0.5;
         m_iYDisplayCenterPos = -14;
         a_1588 = true;
         a_1304 = b_183.enm_SquidFireTowerShot;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(a_4363,FireTowerShotMovie) as a_4363;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         return HitMoveIntruder2(baseMoveIntruder,_damageParams.slice());
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotationY = m_numXSpeed < 0 ? -180 : 0;
         return true;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

