package com.aurora.ui.maogoutd.resource.defender.fusionCard.GodFire
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir.IntruderBuff.GoldZBSHeirIntruderBaseEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class GodFireDeepBuff extends a_4108
   {
      
      private var m_iStartTime:int;
      
      private var m_iXGridNo:int;
      
      private var m_iYGridNo:int;
      
      private var stStartFieldGrid:a_3491;
      
      public var stTargetGrid:a_3491;
      
      public var m_iBoomDie:Boolean;
      
      public var m_BuffDurations:Array = [];
      
      public var m_BuffPowers:Array = [];
      
      public function GodFireDeepBuff()
      {
         super();
         a_1279 = -53;
         m_iYDisplayCenterPos = -43;
      }
      
      public static function a_3926() : GodFireDeepBuff
      {
         return PoolManager.getInstance().CheckOutOne(GodFireDeepBuff) as GodFireDeepBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodFireDeepBuffMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         a_1275 = 1;
         this.m_iStartTime = -1;
         play();
         if(this.stTargetGrid)
         {
            this.m_iXGridNo = this.stTargetGrid.m_iXGridNo;
            this.m_iYGridNo = this.stTargetGrid.m_iYGridNo;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         var key:String = null;
         var dic:Dictionary = null;
         super.a_3940();
         if(this.stTargetGrid != null)
         {
            key = this.m_iXGridNo + "-" + this.m_iYGridNo;
            dic = null;
            if(key in dic && dic[key] === this)
            {
               delete dic[key];
            }
            this.stTargetGrid = null;
         }
         this.m_BuffDurations = [];
         this.m_BuffPowers = [];
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var totalPower:Number = NaN;
         var time:int = 0;
         var power:Number = NaN;
         ++this.m_iStartTime;
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         if(this.m_iStartTime % 10 == 0)
         {
            if(this.stTargetGrid != null)
            {
               totalPower = 0;
               time = 0;
               for each(power in this.m_BuffPowers)
               {
                  totalPower += power;
                  time++;
               }
               this.a_4352(totalPower);
               if(a_2036.getInstance().isShowGrowTimes && this.m_iXGridNo == 8 && this.m_iYGridNo == 3)
               {
                  MessageTipHandler.Get().a_3146("第" + (this.m_iStartTime / 10 + 1).toString() + "伤害:" + totalPower + "叠加" + time + "次");
               }
            }
         }
         for(var i:* = int(this.m_BuffDurations.length - 1); i >= 0; i--)
         {
            --this.m_BuffDurations[i];
            if(this.m_BuffDurations[i] <= 0)
            {
               this.m_BuffDurations.splice(i,1);
               this.m_BuffPowers.splice(i,1);
            }
         }
         if(this.m_BuffDurations.length == 0)
         {
            this.a_3940();
         }
      }
      
      private function a_4352(totalPower:Number) : void
      {
         var i:int = 0;
         var stMoveIntruder:a_4206 = null;
         var canBeAttacked:Boolean = false;
         if(this.stTargetGrid == null)
         {
            return;
         }
         this.stStartFieldGrid = this.stTargetGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iXGridNo,this.m_iYGridNo);
         if(this.stStartFieldGrid != null)
         {
            for(i = 0; i < this.stStartFieldGrid.a_1511.length; i++)
            {
               stMoveIntruder = this.stStartFieldGrid.a_1511[i];
               if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0)
               {
                  canBeAttacked = true;
                  if(canBeAttacked)
                  {
                     stMoveIntruder.ReduceAllLife(totalPower,true,this.m_iBoomDie);
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        this.AddGoldZBSBurnEffect(stMoveIntruder);
                     }
                  }
               }
            }
         }
      }
      
      public function AddGoldZBSBurnEffect(stMoveIntruder:a_4206) : void
      {
         var m_stGoldZBSBaseBurnEffect:a_4108 = null;
         if(stMoveIntruder.m_stGoldZBSBaseBurnEffect == null && stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.IsBossIntruder)
         {
            m_stGoldZBSBaseBurnEffect = GoldZBSHeirIntruderBaseEffect.a_3926();
            GoldZBSHeirIntruderBaseEffect(m_stGoldZBSBaseBurnEffect).stTargetMouveIntruder = stMoveIntruder;
            stMoveIntruder.m_stGoldZBSBaseBurnEffect = m_stGoldZBSBaseBurnEffect;
            m_stGoldZBSBaseBurnEffect.a_1797(a_1283);
            m_stGoldZBSBaseBurnEffect.x = stMoveIntruder.x + 0.5 * stMoveIntruder.width + stMoveIntruder.stDisplayBitmap.x;
            m_stGoldZBSBaseBurnEffect.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_stGoldZBSBaseBurnEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
   }
}

