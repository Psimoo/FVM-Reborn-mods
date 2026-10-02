package com.aurora.ui.maogoutd.resource.defender.HorseYear.vajra
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class VajraHorseBaseShot extends a_4348
   {
      
      private static const MIN_SPEED:Number = 15;
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stTargetMoveIntruder:a_4206;
      
      private var stTargetiXGridNo:int;
      
      private var stTargetiYGridNo:int;
      
      private var m_isHitTarget:Boolean;
      
      public function VajraHorseBaseShot()
      {
         super();
         a_1279 = -60;
         m_iYDisplayCenterPos = -80;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 1;
         a_1588 = true;
         a_1578 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(VajraHorseBaseShot) as VajraHorseBaseShot;
      }
      
      public function get stTargetMoveIntruder() : a_4206
      {
         return this.m_stTargetMoveIntruder;
      }
      
      public function set stTargetMoveIntruder(value:a_4206) : void
      {
         this.m_stTargetMoveIntruder = value;
         if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
         {
            this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stTargetMoveIntruder = null;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return VajraHorseBaseShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotation = 0;
         m_isPenetrate = true;
         m_isChangeYGridNo = true;
         m_iCanHitGostMouse = true;
         a_1577 = false;
         this.m_isHitTarget = false;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,m_iGlobalID);
         return true;
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
         var speedLen:Number = NaN;
         var scale:Number = NaN;
         var vx:Number = NaN;
         var vy:Number = NaN;
         if(!this.m_isHitTarget && !this.isLinkInvalid())
         {
            this.stTargetiXGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            this.stTargetiYGridNo = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo;
            numXDistance = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x - x;
            numYDistance = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height / 2 - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               this.a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / MIN_SPEED;
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
         else
         {
            speedLen = Math.sqrt(m_numXSpeed * m_numXSpeed + m_numYSpeed * m_numYSpeed);
            if(speedLen < MIN_SPEED && speedLen > 0)
            {
               scale = MIN_SPEED / speedLen;
               m_numXSpeed *= scale;
               m_numYSpeed *= scale;
            }
         }
         if(m_numXSpeed != 0 || m_numYSpeed != 0)
         {
            vx = m_numXSpeed;
            vy = m_numYSpeed;
            if(a_1283)
            {
               vx = -vx;
               vy = -vy;
            }
            rotation = Math.atan2(vy,vx) * 180 / Math.PI;
         }
         y += m_numYSpeed;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
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
      
      private function isLinkInvalid() : Boolean
      {
         return !this.m_stTargetMoveIntruder || this.m_stTargetMoveIntruder.iLifeValue <= 0 || !this.m_stTargetMoveIntruder.m_stCurrentFieldGrid || !this.m_stTargetMoveIntruder.visible;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x <= -20 || x >= BattleFieldView.a_1013 + 20)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function checkCanHit(intruder:a_4206) : Boolean
      {
         if(this.m_stTargetMoveIntruder == intruder)
         {
            return false;
         }
         if(m_HitMouseArray.indexOf(intruder) != -1)
         {
            return false;
         }
         if(intruder.iSpaceState == 1 || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent)
         {
            return false;
         }
         if(m_iCanHitGostMouse && BattleFieldView.m_GostMouse.indexOf(intruder.m_stMoveIntruderTypeID) != -1)
         {
            return true;
         }
         if(intruder.isCannotSeeByFighter)
         {
            return false;
         }
         return true;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         var finalHurt:Number = NaN;
         var randomNum:int = 0;
         if(this.m_stTargetMoveIntruder == stMoveIntruder)
         {
            return;
         }
         if(m_isSpecial == 2 && !stMoveIntruder.IsElite && BattleFieldView.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1)
         {
            this.miaoShaSkil(stMoveIntruder);
         }
         else
         {
            finalHurt = GetFinalDamage();
            if(stMoveIntruder.HasTag(40011))
            {
               stMoveIntruder.ReduceLife2(finalHurt * 1.5,[50002]);
            }
            else
            {
               stMoveIntruder.a_3969(finalHurt);
            }
         }
         if(stMoveIntruder.m_stCurrentFieldGrid == null || stMoveIntruder.iLifeValue <= 0 || stMoveIntruder.parent == null)
         {
            return;
         }
         if(a_1573 > 0)
         {
            stMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(stMoveIntruder.iLifeValue > 0)
         {
            this.addHitEffect(stMoveIntruder);
         }
         if(stMoveIntruder.iLifeValue > 0 && m_isSpecial > 0)
         {
            randomNum = this.m_stRandomSeed.nextInt(100) + 1;
            if(randomNum <= 15)
            {
               stMoveIntruder.a_4208(b_182.a_435,15);
            }
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var finalHurt:Number = NaN;
         var randomNum:int = 0;
         if(!m_bActive.Value)
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
         var iYGridNo:int = m_isChangeYGridNo ? int(y / a_3491.a_1081) : m_iYGridNo;
         if(this.CalculationBoundary())
         {
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         this.CollectHurt(stFieldGrid);
         if(this.m_isHitTarget)
         {
            return;
         }
         if(!this.isInHitRadius(iXGridNo,iYGridNo))
         {
            return;
         }
         if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.parent) && hitTestObject(this.m_stTargetMoveIntruder))
         {
            this.m_isHitTarget = true;
            if(m_isSpecial == 2 && !this.m_stTargetMoveIntruder.IsElite && BattleFieldView.m_UnPopularMouse.indexOf(this.m_stTargetMoveIntruder.m_stMoveIntruderTypeID) == -1)
            {
               this.miaoShaSkil(this.m_stTargetMoveIntruder);
            }
            else
            {
               finalHurt = GetFinalDamage();
               if(this.m_stTargetMoveIntruder.HasTag(40011))
               {
                  this.m_stTargetMoveIntruder.ReduceLife2(finalHurt * 1.5,[50002]);
               }
               else
               {
                  this.m_stTargetMoveIntruder.a_3969(finalHurt);
               }
            }
            if(a_1573 > 0)
            {
               this.m_stTargetMoveIntruder.a_4208(b_182.a_432,a_1573);
            }
            if(this.m_stTargetMoveIntruder.iLifeValue > 0)
            {
               this.addHitEffect(this.m_stTargetMoveIntruder);
            }
            if(this.m_stTargetMoveIntruder.iLifeValue > 0 && m_isSpecial > 0)
            {
               randomNum = this.m_stRandomSeed.nextInt(100) + 1;
               if(randomNum <= 15)
               {
                  this.m_stTargetMoveIntruder.a_4208(b_182.a_435,15);
               }
            }
         }
      }
      
      private function isInHitRadius(iXGridNo:int, iYGridNo:int) : Boolean
      {
         if(!this.m_stTargetMoveIntruder)
         {
            return false;
         }
         if(this.stTargetiXGridNo == iXGridNo && this.stTargetiYGridNo == iYGridNo)
         {
            return true;
         }
         var dx:Number = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x - x;
         var dy:Number = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height * 0.5 - y;
         return dx * dx + dy * dy <= 400;
      }
      
      private function CollectHurt(gride:a_3491) : void
      {
         var adjGrid:a_3491 = null;
         if(!gride)
         {
            return;
         }
         this.collectHurtOnGrid(gride);
         var adjX:int = gride.m_iXGridNo + (a_1283 ? 1 : -1);
         for(var offsetY:int = -1; offsetY <= 1; offsetY++)
         {
            adjGrid = a_1583.a_3438(adjX,gride.m_iYGridNo + offsetY);
            if(adjGrid != null)
            {
               this.collectHurtOnGrid(adjGrid);
            }
         }
      }
      
      private function collectHurtOnGrid(gride:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(!gride)
         {
            return;
         }
         var arr:Array = gride.IntruderArray;
         for(var i:int = 0; i < arr.length; i++)
         {
            stMoveIntruder = arr[i];
            if(this.checkCanHit(stMoveIntruder))
            {
               if(hitTestObject(stMoveIntruder))
               {
                  m_HitMouseArray.push(stMoveIntruder);
                  this.onHitHandler(gride,stMoveIntruder);
               }
            }
         }
      }
      
      private function miaoShaSkil(baseMoveIntruder:a_4206) : void
      {
         if(baseMoveIntruder.iSpaceState == 2)
         {
            baseMoveIntruder.a_4212();
         }
         else
         {
            baseMoveIntruder.a_3969(baseMoveIntruder.iLifeValue);
         }
         this.addDeathEffectt(baseMoveIntruder);
      }
      
      private function addDeathEffectt(baseMoveIntruder:a_4206) : void
      {
         var buff:VajraHorseDeathEffect = null;
         if(baseMoveIntruder.iLifeValue <= 0 && !baseMoveIntruder.IsBossIntruder && !baseMoveIntruder.IsWaterIntruder && Boolean(baseMoveIntruder.parent))
         {
            buff = VajraHorseDeathEffect.a_3926();
            buff.a_1797(baseMoveIntruder.IsReversed());
            buff.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x;
            buff.y = baseMoveIntruder.y + 0.5 * baseMoveIntruder.height + baseMoveIntruder.stDisplayBitmap.y;
            baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,baseMoveIntruder.m_stCurrentFieldGrid);
            baseMoveIntruder.a_3432();
         }
      }
      
      private function addHitEffect(baseMoveIntruder:a_4206) : void
      {
         var buff:VajraHorseHitEffect = null;
         if(!baseMoveIntruder || baseMoveIntruder.HasTag(40007))
         {
            return;
         }
         buff = VajraHorseHitEffect.a_3926();
         buff.stOriginalIntruder = baseMoveIntruder;
         buff.a_1797(a_1283);
         buff.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x;
         buff.y = baseMoveIntruder.y + 0.5 * baseMoveIntruder.height + baseMoveIntruder.stDisplayBitmap.y;
         baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,baseMoveIntruder.m_stCurrentFieldGrid);
      }
   }
}

