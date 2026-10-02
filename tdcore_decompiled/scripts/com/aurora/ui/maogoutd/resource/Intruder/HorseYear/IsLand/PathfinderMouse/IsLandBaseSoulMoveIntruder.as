package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse
{
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandBaseSoulMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_iLastFrameTick:int = -1;
      
      public function IsLandBaseSoulMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         tagCom.AddTag(401);
         AddTag(40012);
         AddTag(40011);
         this.m_iLastFrameTick = -1;
         a_1481 = false;
         BoomIsReduceLife = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            this.AddBuff();
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      private function CheckReduceBuff() : void
      {
         var effect:IsLandPathfinderMouseSoulGhostFireEffect = null;
         if(m_stCurrentFieldGrid == null || a_1339 <= 0)
         {
            return;
         }
         var buffData:BattleBuffData = buffCom.GetBuff(453);
         if(buffData != null && _damageParam.indexOf(50003) != -1)
         {
            effect = buffData.stEffect as IsLandPathfinderMouseSoulGhostFireEffect;
            if(effect.ReduceCount() == false)
            {
               buffCom.RemoveBuff(453);
            }
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.CheckReduceBuff();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         this.CheckReduceBuff();
         return true;
      }
      
      public function AddBuff() : void
      {
         var params:BattleBuffParams = new BattleBuffParams();
         params.offsetType = 0;
         params.gameMoveClipClass = IsLandPathfinderMouseSoulGhostFireEffectMovie;
         params.effectClass = IsLandPathfinderMouseSoulGhostFireEffect;
         params.startAnim = 0;
         params.loopAnim = 1;
         params.endAnim = 4;
         var buffData:BattleBuffData = buffCom.AddBuff(453,999999999,params);
         if(buffData != null && buffData.stEffect != null)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,m_stCurrentFieldGrid);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
      
      protected function OnAnimSkill() : void
      {
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(this.m_iLastFrameTick != a_1273)
         {
            this.OnAnimSkill();
            this.m_iLastFrameTick = a_1273;
         }
         super.a_4140(iCurrentTime);
      }
      
      override public function a_4213() : Boolean
      {
         if(tagCom.HasTag(453))
         {
            return false;
         }
         return super.a_4213();
      }
      
      override public function a_4210() : Boolean
      {
         if(tagCom.HasTag(453))
         {
            return false;
         }
         return super.a_4210();
      }
      
      override public function a_4212() : Boolean
      {
         if(tagCom.HasTag(453))
         {
            return false;
         }
         return super.a_4212();
      }
   }
}

