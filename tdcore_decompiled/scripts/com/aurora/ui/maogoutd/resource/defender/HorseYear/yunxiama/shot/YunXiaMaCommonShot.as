package com.aurora.ui.maogoutd.resource.defender.HorseYear.yunxiama.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.yunxiama.YunXiaMaDefine;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.yunxiama.effect.YunXiaMaBlindBuffEffectMovie;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class YunXiaMaCommonShot extends a_4348
   {
      
      public function YunXiaMaCommonShot()
      {
         super();
         a_1573 = 1;
         a_1587 = 1;
         a_1275 = 0;
         m_isShotHighSkySpace = true;
         a_1588 = true;
      }
      
      public static function a_4344(transIndex:int = 0) : a_4348
      {
         var bindMovie:Class = shotBindMovieForTrans(transIndex);
         return PoolManager.getInstance().CheckOutOne(YunXiaMaCommonShot,bindMovie) as YunXiaMaCommonShot;
      }
      
      private static function shotBindMovieForTrans(transIndex:int) : Class
      {
         switch(transIndex)
         {
            case 1:
               return YunXiaMaFirstShotMovie;
            case 2:
               return YunXiaMaSecondShotMovie;
            case 0:
         }
         return YunXiaMaBaseShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         m_stMoveClip = a_3913() as GameMovieClip;
         if(m_stMoveClip)
         {
            a_1279 = m_stMoveClip.a_1279;
            m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         }
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         m_isPenetrate = true;
         a_1577 = false;
         tagCom.AddTag(30);
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
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder.iLifeValue <= 0 || !stMoveIntruder.m_stCurrentFieldGrid || !stMoveIntruder.parent)
         {
            return false;
         }
         if(stMoveIntruder.isCannotSeeByFighter || stMoveIntruder.iSpaceState == 1)
         {
            return false;
         }
         return true;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         m_isHited = true;
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
         var hurt:int = GetFinalDamage() * stMoveIntruder.m_stCurrentFieldGrid.getStraightShotMultiplier();
         stMoveIntruder.a_3969(hurt);
         if(stMoveIntruder.m_stCurrentFieldGrid == null || stMoveIntruder.iLifeValue <= 0 || stMoveIntruder.parent == null)
         {
            return;
         }
         if(a_1573 > 0)
         {
            stMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         this.AddblindBuff(stMoveIntruder,stFieldGrid);
      }
      
      private function AddblindBuff(baseMoveIntruder:a_4206, stFieldGrid:a_3491) : void
      {
         if(m_iSuperShotType != 1)
         {
            return;
         }
         if(!baseMoveIntruder || baseMoveIntruder.iLifeValue <= 0 || !stFieldGrid || baseMoveIntruder.IsBossIntruder || baseMoveIntruder.tagCom.HasTag(YunXiaMaDefine.BLIND_TAG))
         {
            return;
         }
         var params:BattleBuffParams = new BattleBuffParams();
         params.gameMoveClipClass = YunXiaMaBlindBuffEffectMovie;
         params.x = 10;
         params.y = -40;
         params.offsetType = 1;
         var buffData:BattleBuffData = baseMoveIntruder.buffCom.AddBuff(YunXiaMaDefine.BLIND_TAG,YunXiaMaDefine.BLIND_BUFF_DURATION,params);
         if(buffData != null && buffData.stEffect != null && Boolean(stFieldGrid.m_stCurrentBattbleFieldView))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
         }
      }
   }
}

