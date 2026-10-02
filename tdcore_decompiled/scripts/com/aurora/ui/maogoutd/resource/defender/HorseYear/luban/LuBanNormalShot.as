package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import a_4718.b_182;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.tricksterSnake.TricksterSnakeDeadEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake.effect.IntruderBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class LuBanNormalShot extends a_4348
   {
      
      private var m_iLastPosY:int = -1;
      
      private var m_iTrans:int = 0;
      
      private var m_iStep:int = 0;
      
      private var m_iRemainTick:int = 0;
      
      private var m_iSpeed:Number = 15;
      
      private var m_arrMovePath:Array = [1,2,3];
      
      public function LuBanNormalShot()
      {
         super();
         a_1573 = 1;
         scaleX = scaleY = 0.9;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = numSpeed < 0 ? -180 : 0;
         a_1587 = 0;
         a_1275 = 0;
         m_isPenetrate = true;
         a_1588 = true;
         a_1279 = -28;
         m_iYDisplayCenterPos = -20;
         this.m_iLastPosY = m_iYGridNo;
         this.SetMoveByStep(0);
         m_isCanBounceByAuxiliary = false;
         m_numXSpeed = 0;
         m_numYSpeed = 0;
         this.m_iRemainTick = 99999;
         return true;
      }
      
      public function InitData(arr:Array, trans:int) : void
      {
         this.m_iTrans = trans;
         if(a_1584.m_iXGridNo == BattleFieldView.a_1011 - 1)
         {
            this.m_arrMovePath = [arr[0],4];
         }
         else
         {
            this.m_arrMovePath = arr;
         }
         this.SetMoveByStep(0);
      }
      
      private function SetMoveByStep(iStep:int) : void
      {
         var m_iRate:Number = NaN;
         this.m_iStep = iStep;
         var iPath:int = int(this.m_arrMovePath[iStep]);
         var offsetX:Number = 0;
         var offsetY:Number = 0;
         if(iPath == 4)
         {
            if(a_1283)
            {
               offsetX = a_3491.a_1080 * 0.5 - this.x;
            }
            else
            {
               offsetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.5) - this.x;
            }
            offsetY = a_1586 - this.y;
         }
         else if(iPath == 0)
         {
            if(a_1283)
            {
               offsetX = a_3491.a_1080 * 0.5 - this.x;
            }
            else
            {
               offsetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.5) - this.x;
            }
            offsetY = a_3491.a_1081 * (BattleFieldView.a_1012 - 1 + 0.5) - this.y;
         }
         else if(iPath == 1)
         {
            if(a_1283)
            {
               offsetX = a_3491.a_1080 * 0.5 - this.x;
            }
            else
            {
               offsetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.5) - this.x;
            }
            offsetY = a_3491.a_1081 * 0.5 - this.y;
         }
         else if(iPath == 2)
         {
            if(a_1283)
            {
               offsetX = a_3491.a_1080 * 0.5 - this.x;
            }
            else
            {
               offsetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.5) - this.x;
            }
            offsetY = a_3491.a_1081 * (BattleFieldView.a_1012 - 1 + 0.5) / 2 - this.y;
         }
         else if(iPath == 3)
         {
            offsetX = a_1585 - this.x;
            offsetY = a_1586 - this.y;
         }
         else if(iPath == 5)
         {
            offsetX = a_3491.a_1080 * 0.5;
            if(a_1283)
            {
               offsetX = BattleFieldView.a_1013 - offsetX;
            }
            offsetX -= this.x;
            offsetY = BattleFieldView.a_1014 - 1 - this.y;
         }
         else if(iPath == 6)
         {
            offsetX = a_3491.a_1080 * 1.5;
            if(a_1283)
            {
               offsetX = BattleFieldView.a_1013 - offsetX;
            }
            offsetX -= this.x;
            offsetY = 0 - this.y;
         }
         m_iRate = Math.sqrt(offsetX * offsetX + offsetY * offsetY) / this.m_iSpeed;
         m_numXSpeed = offsetX / m_iRate;
         m_numYSpeed = offsetY / m_iRate;
         this.m_iRemainTick = Math.ceil(m_iRate);
         if(Math.abs(m_numXSpeed) < 2)
         {
            if(m_numYSpeed > 5)
            {
               rotation = 90;
               scaleX = 1;
               return;
            }
            if(m_numYSpeed < 5)
            {
               rotation = -90;
               scaleX = 1;
               return;
            }
         }
         else if(m_numXSpeed < 0)
         {
            rotation = 0;
            scaleX = -1;
            return;
         }
         rotation = 0;
         scaleX = 1;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         --this.m_iRemainTick;
         if(this.m_iRemainTick <= 0)
         {
            ++this.m_iStep;
            if(this.m_iStep == this.m_arrMovePath.length)
            {
               a_3940();
               return;
            }
            this.SetMoveByStep(this.m_iStep);
         }
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
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var iLast:int = 0;
         var i:int = 0;
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
         if(!stFieldGrid)
         {
            return;
         }
         if(iYGridNo != m_iYGridNo)
         {
            iLast = int(a_1583.m_stBaseShotVector[m_iYGridNo].indexOf(this));
            if(iLast != -1)
            {
               a_1583.m_stBaseShotVector[m_iYGridNo].splice(iLast,1);
            }
            a_1583.m_stBaseShotVector[iYGridNo].push(this);
            m_iYGridNo = iYGridNo;
         }
         if(Boolean(stFieldGrid) && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.IntruderArray;
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1045.play();
                  }
                  this.CaclueHitMouse(stFieldGrid,stMoveIntruder);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  return;
               }
            }
         }
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0 && hitTestObject(stMoveIntruder))
         {
            if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               m_HitMouseArray.push(stMoveIntruder);
               this.a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
         }
         return false;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         var count:int = 0;
         var effect:a_4108 = null;
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         var finalHurt:Number = GetFinalDamage();
         if(this.m_iTrans == 4)
         {
            count = a_2036.getInstance().tagCom.GetSum(LuBanDefence.LUABAN_FINAL_TAG);
            if(count > 8)
            {
               count = 8;
            }
            if(count < 1)
            {
               count = 1;
            }
            finalHurt *= 1 + (count - 1) * 0.65;
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
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var params:BattleBuffParams = null;
         var buffData:BattleBuffData = null;
         var effect:TricksterSnakeDeadEffect = null;
         if(stHitenMouseIntruder.iLifeValue > 0)
         {
            if(this.m_iTrans >= 2 && !stHitenMouseIntruder.IsBossIntruder && m_iRandomArrOne.length > 0)
            {
               if(m_iRandomArrOne.pop() < 20)
               {
                  stHitenMouseIntruder.a_4208(b_182.a_435,15);
                  if(stHitenMouseIntruder.iBoundStop)
                  {
                     params = new BattleBuffParams();
                     params.x = 0;
                     params.y = -120;
                     params.offsetType = 1;
                     params.gameMoveClipClass = LuBanBuffMovie;
                     buffData = stHitenMouseIntruder.buffCom.AddBuff(40001,1.5 * 20,params);
                     if(buffData != null && buffData.stEffect != null)
                     {
                        stHitenFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stHitenFieldGrid);
                     }
                  }
               }
            }
         }
         else if(!stHitenMouseIntruder.IsBossIntruder && !stHitenMouseIntruder.HasTag(5) && !stHitenMouseIntruder.HasTag(40012))
         {
            stHitenMouseIntruder.a_3432();
            effect = TricksterSnakeDeadEffect.a_3926();
            effect.a_1797(false);
            stHitenFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stHitenFieldGrid);
            effect.x = stHitenMouseIntruder.x;
            effect.y = stHitenMouseIntruder.y;
         }
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

