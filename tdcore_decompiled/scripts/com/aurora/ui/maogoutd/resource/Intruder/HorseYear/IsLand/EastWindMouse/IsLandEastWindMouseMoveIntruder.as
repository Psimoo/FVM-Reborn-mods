package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.EastWindMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   
   public class IsLandEastWindMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      protected var m_iState:int = 0;
      
      private var m_bHasUseSkill:Boolean = false;
      
      protected var a_1496:int;
      
      public function IsLandEastWindMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandEastWindMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandEastWindMouseMoveIntruder,IsLandEastWindMouseMoveIntruderMovie) as IsLandEastWindMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 3600;
         INJURED_LIFE = 1800;
         ONE_GRID_SPEED = 4;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_iState = 0;
         this.a_1496 = 12;
         a_1465 = 3;
         a_1275 = -1;
         SetAnimation(0,0);
         AddTag(452);
         BoomIsReduceLife = true;
         this.m_bHasUseSkill = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_iState == 2)
            {
               if(a_1475)
               {
                  SetAnimation(5,7);
               }
               else
               {
                  SetAnimation(4,6);
               }
            }
         }
         else
         {
            SetDeadAnim(8);
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(a_1465 == 3)
         {
            this.a_3969(900);
         }
         else
         {
            super.a_4212();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(iRduceLifeValue > 0 && this.m_iState == 1 && _damageParam.indexOf(131) != -1)
         {
            this.m_iState = 2;
            SetAnimationOnce2Loop(3,4,3,4);
            return true;
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      private function addSpeed() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var intruder:a_4206 = null;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 6;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               for each(intruder in stTargetFieldGrid.a_1511)
               {
                  if(intruder.iLifeValue > 0 && intruder.iSpaceState == 3)
                  {
                     intruder.buffCom.AddBuff(451,20 * 7);
                  }
               }
            }
         }
      }
      
      override public function a_4214() : Boolean
      {
         var stBackBd:BitmapData = null;
         var stIntruderRemoteThrowEffect:a_4425 = null;
         if(this.m_bHasUseSkill == true && this.m_iState < 2)
         {
            a_1339 = 0;
            stBackBd = this.stDisplayBitmap.bitmapData.clone();
            if(stBackBd != null)
            {
               stIntruderRemoteThrowEffect = a_4425.a_3926();
               stIntruderRemoteThrowEffect.a_1797(stBackBd,a_1283);
               stIntruderRemoteThrowEffect.x = x;
               stIntruderRemoteThrowEffect.y = y;
               parent.addChild(stIntruderRemoteThrowEffect);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         if(!a_1460)
         {
            a_1460 = true;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6));
         }
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(iCurrentTime >= a_1472 + a_1471 && (this.m_iState < 2 || this.m_iState == 2 && this.a_1496 <= 0 && m_stCurrentFieldGrid.m_stProtector == null && m_stCurrentFieldGrid.m_stAttackFighter == null && m_stCurrentFieldGrid.m_stFlowerDefense == null && m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter == null && m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense == null && m_stCurrentFieldGrid.m_stOceanGoddessToolDefense == null && (m_stCurrentFieldGrid.m_stBoomDefense == null || !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten)))
         {
            if(a_1273 == 33 && this.m_iState == 0)
            {
               this.m_iState = 1;
               this.addSpeed();
            }
            if(a_1273 >= 11 && a_1273 <= 34 || a_1273 >= 45 && a_1273 <= 52)
            {
               return true;
            }
            a_1472 = iCurrentTime;
            play();
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               ChangeFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo));
            }
            if(this.m_iState == 0 && m_stCurrentFieldGrid.m_iXGridNo == 8 && x <= 8.25 * a_3491.a_1080)
            {
               SetAnimationOnce2Loop(1,2,1,2);
               this.m_bHasUseSkill = true;
            }
            else if(this.m_iState == 1 && (iXGridNo <= 0 || iXGridNo >= BattleFieldView.a_1011))
            {
               this.m_iState = 2;
               x -= a_1350 * a_1470;
               SetAnimationOnce2Loop(3,4,3,4);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.bitmapData = stDisplayBitmap.bitmapData;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.x = x + stDisplayBitmap.x + (a_1283 ? 50 : -50);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.y = y + stDisplayBitmap.y;
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               if(null != m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
               return true;
            }
         }
         if(this.a_1496 <= 0 && this.m_iState == 2 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
         {
            if(null != m_stCurrentFieldGrid.m_stProtector)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stProtector);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stAttackFighter)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stAttackFighter);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stBoomDefense && m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stFlowerDefense)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stFlowerDefense);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense && IsCanEat(m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stOceanGoddessToolDefense && IsCanEat(m_stCurrentFieldGrid.m_stOceanGoddessToolDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stOceanGoddessToolDefense);
               this.ResetMovieStatus();
            }
            else if(a_1475)
            {
               a_1475 = false;
               this.ResetMovieStatus();
            }
         }
         if(this.a_1496 > 0 && this.m_iState == 2)
         {
            --this.a_1496;
            if(this.a_1496 <= 0)
            {
               a_1465 = 0;
               SetSpeed(6);
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
   }
}

