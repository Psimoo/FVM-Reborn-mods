package com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.intruder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDecorationEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.SoulPuppetTargetHelper;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.effect.SoulPuppetBaseBoomEffect;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.effect.SoulPuppetBaseHitEffect;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet.effect.SoulPuppetSecondLinkEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4110;
   import flash.display.FrameLabel;
   
   public class SoulPuppetBaseIntruderIntruder extends a_4206
   {
      
      private static const MAX_DAMAGE:Number = 100000000;
      
      private static const LINK_OFFSET_Y:int = -7;
      
      private static const LINK_OFFSET_X:int = 20;
      
      private const FULL_HP:int = 100000000;
      
      private var m_totalDamage:Number = 0;
      
      public var m_damageRate:Number = 0;
      
      public var m_durationTick:Number = 0;
      
      public var a_1094:int = 0;
      
      private var m_stBaseStarDegree:a_4110;
      
      private var m_linkTarget:a_4206;
      
      private var m_birthTime:int = 0;
      
      private var m_isDead:Boolean = false;
      
      private var m_isBoomKill:Boolean = false;
      
      private var m_isPlayHit:Boolean = false;
      
      private var m_LinkTopEffect:a_4108;
      
      public function SoulPuppetBaseIntruderIntruder()
      {
         super();
         a_1279 = -28.5;
         a_1467 = 0;
         m_iIntruderState = -10;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SoulPuppetBaseIntruderIntruder) as SoulPuppetBaseIntruderIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SoulPuppetBaseIntruderIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.resetState();
         return true;
      }
      
      private function resetState() : void
      {
         this.m_isDead = false;
         this.m_isBoomKill = false;
         this.m_isPlayHit = false;
         this.m_totalDamage = 0;
         a_1339 = this.FULL_HP;
         BoomIsReduceLife = true;
         a_1464 = true;
         a_1463 = true;
         m_m_isCannotHurtByInsurance = true;
         a_1481 = false;
         this.m_damageRate = 0;
         this.m_durationTick = 0;
         this.m_linkTarget = null;
         this.m_LinkTopEffect = null;
         this.m_birthTime = 0;
         a_1460 = false;
      }
      
      private function initBaseStarDegree() : void
      {
         this.m_stBaseStarDegree = BattleDecorationEffectUtil.GetStarDegreDecoration(this.a_1094);
         if(this.m_stBaseStarDegree)
         {
            this.m_stBaseStarDegree.a_1797(false);
            if(a_1283)
            {
               this.m_stBaseStarDegree.x = stDisplayBitmap.x - this.m_stBaseStarDegree.width - (width - this.m_stBaseStarDegree.width) * 0.5;
            }
            else
            {
               this.m_stBaseStarDegree.x = (width - this.m_stBaseStarDegree.width) * 0.5;
            }
            this.m_stBaseStarDegree.x += a_1279;
            this.m_stBaseStarDegree.y = height - this.m_stBaseStarDegree.height;
            addChild(this.m_stBaseStarDegree);
         }
      }
      
      private function RemoveStarDegree() : void
      {
         if(this.m_stBaseStarDegree)
         {
            if(contains(this.m_stBaseStarDegree))
            {
               removeChild(this.m_stBaseStarDegree);
            }
            this.m_stBaseStarDegree.a_3940();
            this.m_stBaseStarDegree = null;
         }
      }
      
      override public function a_3969(iReduce:int) : Boolean
      {
         if(this.m_isDead || iReduce <= 0)
         {
            return false;
         }
         super.a_3969(iReduce);
         this.m_totalDamage += iReduce;
         this.transferDamageToLink(iReduce);
         if(this.m_totalDamage >= MAX_DAMAGE)
         {
            this.ForceDisappear();
         }
         return true;
      }
      
      override public function ReduceAllLife(iReduce:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         if(this.m_isDead || iReduce <= 0)
         {
            return false;
         }
         super.ReduceAllLife(iReduce,ishowHuijing);
         this.m_totalDamage += iReduce;
         this.transferDamageToLink(iReduce);
         if(this.m_totalDamage >= MAX_DAMAGE)
         {
            this.ForceDisappear();
         }
         return true;
      }
      
      override public function a_4209(iReduce:int) : Boolean
      {
         if(this.m_isDead || iReduce <= 0)
         {
            return false;
         }
         super.a_4209(iReduce);
         this.m_totalDamage += iReduce;
         this.transferDamageToLink(iReduce);
         if(this.m_totalDamage >= MAX_DAMAGE)
         {
            this.ForceDisappear();
         }
         return true;
      }
      
      private function transferDamageToLink(hurt:Number) : void
      {
         if(!this.m_linkTarget || this.isLinkInvalid())
         {
            return;
         }
         var realDamage:Number = hurt * this.m_damageRate;
         if(realDamage <= 0)
         {
            return;
         }
         this.m_linkTarget.a_3969(realDamage);
         if(this.isLinkInvalid())
         {
            this.ForceDisappear();
         }
         else
         {
            this.addLinkHitEffect();
         }
      }
      
      private function isLinkInvalid() : Boolean
      {
         return !this.m_linkTarget || this.m_linkTarget.iLifeValue <= 0 || !this.m_linkTarget.m_stCurrentFieldGrid;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(this.m_isDead)
         {
            return false;
         }
         if(!a_1460)
         {
            this.onFirstAppear(iCurrentTime);
         }
         super.a_4216(iCurrentTime);
         if(this.isTrayDead())
         {
            this.ForceDisappear();
            return false;
         }
         if(!this.m_linkTarget)
         {
            this.bindLinkTarget();
            return false;
         }
         if(this.isLinkInvalid())
         {
            this.ForceDisappear();
            return false;
         }
         if(this.isDurationExpired(iCurrentTime))
         {
            this.ForceDisappear();
            return false;
         }
         this.m_LinkTopEffect.visible = this.m_linkTarget.visible;
         return true;
      }
      
      private function onFirstAppear(iCurrentTime:int) : void
      {
         this.updataXByTray();
         this.initBaseStarDegree();
         a_1460 = true;
         this.addShield(m_stCurrentFieldGrid);
         this.bindLinkTarget();
         this.m_birthTime = iCurrentTime;
      }
      
      private function updataXByTray() : void
      {
         var stBaseTray:a_3977 = null;
         var MaxHeight:int = 0;
         if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_isNeedTray) && Boolean(m_stCurrentFieldGrid.m_stTrayDefense))
         {
            stBaseTray = m_stCurrentFieldGrid.m_stTrayDefense;
            if(stBaseTray)
            {
               MaxHeight = stBaseTray.height > 55 ? 55 : int(stBaseTray.height);
               this.y = stBaseTray.y + MaxHeight - this.height - 20 + stBaseTray.m_iOffsetByY;
            }
         }
      }
      
      private function isTrayDead() : Boolean
      {
         return Boolean(m_stCurrentFieldGrid) && m_stCurrentFieldGrid.m_isNeedTray && !m_stCurrentFieldGrid.m_stTrayDefense;
      }
      
      private function isDurationExpired(iCurrentTime:int) : Boolean
      {
         return this.m_durationTick > 0 && iCurrentTime - this.m_birthTime >= this.m_durationTick;
      }
      
      private function bindLinkTarget() : void
      {
         this.m_linkTarget = SoulPuppetTargetHelper.FindTarget(m_stCurrentFieldGrid);
         if(this.m_linkTarget)
         {
            this.updateChainNodes();
            this.addLinkTopEffect();
         }
      }
      
      private function updateChainNodes() : void
      {
         SoulPuppetTargetHelper.UpdateChainNodes(m_stCurrentFieldGrid,this.m_linkTarget);
      }
      
      private function ForceDisappear() : void
      {
         if(this.m_isDead)
         {
            return;
         }
         this.m_isDead = true;
         a_1339 = 0;
         this.cleanupLinkTopEffect();
         SoulPuppetTargetHelper.ClearChainNodes();
         this.ResetMovieStatus();
      }
      
      private function cleanupLinkTopEffect() : void
      {
         if(this.m_LinkTopEffect)
         {
            this.m_LinkTopEffect.a_3940();
            this.m_LinkTopEffect = null;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         this.RemoveStarDegree();
         this.ClearShield(m_stCurrentFieldGrid);
         this.cleanupLinkTopEffect();
         SoulPuppetTargetHelper.ClearChainNodes();
         this.m_linkTarget = null;
         this.m_isBoomKill = false;
         super.a_3940();
         return true;
      }
      
      private function addShield(grid:a_3491) : void
      {
         if(!grid)
         {
            return;
         }
         grid.m_SoulPuppetIntruder = this;
         grid.m_dicCannotAddCard["SoulPuppetIntruder"] = true;
         if(grid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            grid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,grid.m_iXGridNo,grid.m_iYGridNo);
         }
      }
      
      private function ClearShield(grid:a_3491) : void
      {
         if(!grid)
         {
            return;
         }
         grid.m_SoulPuppetIntruder = null;
         grid.m_dicCannotAddCard["SoulPuppetIntruder"] = false;
         if(grid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            grid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
      }
      
      public function addLinkTopEffect() : void
      {
         if(!m_stCurrentFieldGrid || !this.m_linkTarget || Boolean(this.m_LinkTopEffect))
         {
            return;
         }
         this.m_LinkTopEffect = SoulPuppetSecondLinkEffect.a_3926();
         this.m_LinkTopEffect.a_1797(false);
         this.updateLinkEffectPosition();
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_LinkTopEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
      }
      
      private function updateLinkEffectPosition() : void
      {
         if(!this.m_linkTarget || !this.m_LinkTopEffect)
         {
            return;
         }
         var offsetX:int = this.m_linkTarget.IsReversed() ? LINK_OFFSET_X : int(-LINK_OFFSET_X);
         this.m_LinkTopEffect.x = this.m_linkTarget.x + this.m_linkTarget.stDisplayBitmap.x + this.m_linkTarget.width * 0.5 + offsetX;
         this.m_LinkTopEffect.y = this.m_linkTarget.y + this.m_linkTarget.stDisplayBitmap.y + LINK_OFFSET_Y;
      }
      
      public function addLinkHitEffect() : void
      {
         var buff:SoulPuppetBaseHitEffect = null;
         if(!m_stCurrentFieldGrid || !this.m_linkTarget || !this.m_linkTarget.visible)
         {
            return;
         }
         buff = SoulPuppetBaseHitEffect.a_3926();
         buff.a_1797(a_1283);
         buff.x = this.m_linkTarget.x + this.m_linkTarget.stDisplayBitmap.x + this.m_linkTarget.width * 0.5;
         buff.y = this.m_linkTarget.y + this.m_linkTarget.stDisplayBitmap.y + this.m_linkTarget.height * 0.5;
         this.m_linkTarget.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,this.m_linkTarget.m_stCurrentFieldGrid);
      }
      
      public function addBoomEffect() : void
      {
         var stBoomEffect:a_4108 = null;
         if(!m_stCurrentFieldGrid)
         {
            return;
         }
         stBoomEffect = SoulPuppetBaseBoomEffect.a_3926();
         (stBoomEffect as SoulPuppetBaseBoomEffect).stOriginalFieldGrid = m_stCurrentFieldGrid;
         stBoomEffect.a_1797(false);
         stBoomEffect.x = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         stBoomEffect.y = (m_stCurrentFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBoomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,m_stCurrentFieldGrid);
      }
      
      public function BoomDieSkill() : void
      {
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var k:* = 0;
         var stMoveIntruder:a_4206 = null;
         if(!m_stCurrentFieldGrid)
         {
            return;
         }
         var stBattleView:BattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         if(!stBattleView)
         {
            return;
         }
         var iXStart:int = Math.max(m_stCurrentFieldGrid.m_iXGridNo - 2,0);
         var iXEnd:int = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var iYStart:int = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 2,0);
         var iYEnd:int = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var i:int = iYStart; i <= iYEnd; i++)
         {
            for(j = iXStart; j <= iXEnd; j++)
            {
               stFieldGrid = stBattleView.a_3438(j,i);
               if(stFieldGrid)
               {
                  arrMoveIntruder = stFieldGrid.a_1511;
                  if(!(!arrMoveIntruder || arrMoveIntruder.length == 0))
                  {
                     for(k = int(arrMoveIntruder.length - 1); k >= 0; k--)
                     {
                        stMoveIntruder = arrMoveIntruder[k];
                        if(Boolean(stMoveIntruder) && stMoveIntruder != this)
                        {
                           stMoveIntruder.a_4210();
                        }
                     }
                  }
               }
            }
         }
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(iCurrentTime % 2 == 0)
         {
            if(this.m_stBaseStarDegree)
            {
               this.m_stBaseStarDegree.a_3957(iCurrentTime);
            }
         }
         if(a_1273 == 22 && this.m_isPlayHit)
         {
            this.m_isPlayHit = false;
         }
         else if(a_1273 == 29 && !this.m_isBoomKill)
         {
            this.m_isBoomKill = true;
         }
         if(this.m_isDead)
         {
            return;
         }
         this.updateLinkEffectPosition();
         this.updateChainNodes();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(!this.m_isPlayHit)
            {
               this.m_isPlayHit = true;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            if(!this.m_isDead)
            {
               this.m_isDead = true;
            }
         }
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args[0] == 1 || args[0] == 2)
         {
            this.ForceDisappear();
         }
      }
      
      override public function a_4210() : Boolean
      {
         return super.a_4210();
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
   }
}

