package com.aurora.ui.maogoutd.resource.defender.HorseYear.menghaima
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake.effect.IntruderBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MengHaiMaBaseShot extends a_4348
   {
      
      private var m_stTargetMoveIntruder:a_4206;
      
      private var m_iTrans:int = 0;
      
      public function MengHaiMaBaseShot()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         m_isHited = false;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var shot:MengHaiMaBaseShot = null;
         BattleFieldView.a_1017.play();
         shot = PoolManager.getInstance().CheckOutOne(MengHaiMaBaseShot,MengHaiMaBaseShotMovie) as MengHaiMaBaseShot;
         shot.m_iTrans = 0;
         shot.m_iYDisplayCenterPos = -5;
         return shot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         var shot:MengHaiMaBaseShot = null;
         BattleFieldView.a_1017.play();
         shot = PoolManager.getInstance().CheckOutOne(MengHaiMaBaseShot,MengHaiMaFirstShotMovie) as MengHaiMaBaseShot;
         shot.m_iTrans = 1;
         shot.m_iYDisplayCenterPos = -5;
         return shot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         var shot:MengHaiMaBaseShot = PoolManager.getInstance().CheckOutOne(MengHaiMaBaseShot,MengHaiMaSecondShotMovie) as MengHaiMaBaseShot;
         shot.m_iTrans = 2;
         return shot;
      }
      
      public function get stTargetMoveIntruder() : a_4206
      {
         if(this.m_stTargetMoveIntruder == null || this.m_stTargetMoveIntruder.iLifeValue <= 0 || this.m_stTargetMoveIntruder.visible == false || this.m_stTargetMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return null;
         }
         return this.m_stTargetMoveIntruder;
      }
      
      public function set stTargetMoveIntruder(value:a_4206) : void
      {
         this.m_stTargetMoveIntruder = value;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stTargetMoveIntruder = null;
         return true;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotation = 0;
         m_isChangeYGridNo = true;
         a_1577 = false;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
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
         this.a_4351();
         if(a_1578)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = this.stTargetMoveIntruder;
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y + 0.5 * stMoveIntruder.height - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               this.a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         y += m_numYSpeed;
         return true;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         var stBaseMoveIntruder:a_4206 = this.stTargetMoveIntruder;
         if(Boolean(stBaseMoveIntruder) && hitTestObject(stBaseMoveIntruder))
         {
            this.a_4352(stBaseMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         var effect:a_4108 = null;
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         if(m_SplitBulletCount > 0)
         {
            SplitBullet(baseMoveIntruder.m_stCurrentFieldGrid,m_SplitBulletCount);
         }
         var finalHurt:Number = GetFinalDamage();
         if(this.m_iTrans >= 1 && baseMoveIntruder.IsBossIntruder)
         {
            finalHurt *= 1.5;
            BattleEffectUtil.AddHitEffect(baseMoveIntruder,MengHaiMaHitMovie);
         }
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
         if(m_iShowBloodHot > 0)
         {
            effect = IntruderBloodEffect.a_3926();
            baseMoveIntruder.addBleedingEffect(effect,21,GetFinalDamage() * m_iShowBloodHot);
         }
         return true;
      }
      
      override public function get width() : Number
      {
         return 4;
      }
      
      override public function get height() : Number
      {
         return 4;
      }
   }
}

