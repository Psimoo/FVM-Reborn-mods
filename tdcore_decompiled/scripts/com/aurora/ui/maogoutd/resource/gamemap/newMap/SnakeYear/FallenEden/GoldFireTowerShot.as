package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import a_4718.b_182;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class GoldFireTowerShot extends a_4348
   {
      
      private static var a_1592:Array = new Array();
      
      public var damage:int = 20000;
      
      public function GoldFireTowerShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1588 = true;
         a_1304 = b_183.enm_FireGrailShot;
         a_1573 = 1;
      }
      
      public static function a_4344() : GoldFireTowerShot
      {
         var stFireTowerShot:GoldFireTowerShot = a_1592.pop();
         if(null == stFireTowerShot)
         {
            stFireTowerShot = new GoldFireTowerShot();
         }
         return stFireTowerShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFireTowerShotMovie;
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
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == a_1592.indexOf(this))
         {
            a_1592.push(this);
         }
         return true;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         var finalHurt:Number = this.damage;
         if(m_ShowAshEffectType > 0)
         {
            baseMoveIntruder.PowerfulBombReduceLifeRate(finalHurt / 900,m_ShowAshEffectType == 1);
         }
         else if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(finalHurt);
         }
         else
         {
            baseMoveIntruder.a_3969(finalHurt);
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
         if(m_isShowPoisonGas)
         {
            baseMoveIntruder.PoisonHurtPower = PoisonHurtPower;
            baseMoveIntruder.a_4208(b_182.enm_shotEffectPoisonGas,3);
         }
         return true;
      }
   }
}

