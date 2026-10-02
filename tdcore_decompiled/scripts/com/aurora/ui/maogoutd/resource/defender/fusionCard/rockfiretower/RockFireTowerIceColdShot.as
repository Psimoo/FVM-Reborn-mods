package com.aurora.ui.maogoutd.resource.defender.fusionCard.rockfiretower
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake.effect.FrostSnakeDeadEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RockFireTowerIceColdShot extends a_4348
   {
      
      private static var ms_stRockFireTowerIceColdShotVector:Array = new Array();
      
      public function RockFireTowerIceColdShot()
      {
         super();
         a_1279 = -25;
         m_iYDisplayCenterPos = -5;
         a_1588 = true;
         a_1304 = b_183.enm_RockFireTowerIceColdShot;
         a_1573 = 1;
         _damageParams = [132];
      }
      
      public static function a_4344() : a_4348
      {
         var stRockFireTowerIceColdShot:RockFireTowerIceColdShot = ms_stRockFireTowerIceColdShotVector.pop();
         if(null == stRockFireTowerIceColdShot)
         {
            stRockFireTowerIceColdShot = new RockFireTowerIceColdShot();
         }
         return stRockFireTowerIceColdShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RockFireTowerIceColdShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotationY = m_numXSpeed < 0 ? -180 : 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         var effect:FrostSnakeDeadEffect = null;
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         HitMoveIntruder2(stMoveIntruder,_damageParams.slice());
         ExecuteTriggers(stMoveIntruder);
         if(stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue <= 0 && !stMoveIntruder.IsBossIntruder)
         {
            effect = FrostSnakeDeadEffect.a_3926();
            effect.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x + (stMoveIntruder.width - 76) / 2;
            effect.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y + (stMoveIntruder.height - 102) / 2;
            effect.a_1797(false);
            stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stMoveIntruder.m_stCurrentFieldGrid);
            stMoveIntruder.a_3432();
         }
         m_isHited = true;
         if(m_isPenetrate)
         {
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
         }
         else
         {
            this.a_3940();
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stRockFireTowerIceColdShotVector.indexOf(this))
         {
            ms_stRockFireTowerIceColdShotVector.push(this);
         }
         return true;
      }
   }
}

