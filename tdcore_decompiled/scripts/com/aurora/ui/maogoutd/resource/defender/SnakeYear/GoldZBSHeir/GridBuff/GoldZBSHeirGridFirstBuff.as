package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir.GridBuff
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir.IntruderBuff.GoldZBSHeirIntruderFirstEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class GoldZBSHeirGridFirstBuff extends a_4108
   {
      
      private var m_iStartTime:int;
      
      private var m_iXGridNo:int;
      
      private var m_iYGridNo:int;
      
      private var stStartFieldGrid:a_3491;
      
      public var stTargetGrid:a_3491;
      
      public var m_BuffDurations:Array = [];
      
      public var m_BuffPowers:Array = [];
      
      private var m_txtBuffInfo:TextField;
      
      public function GoldZBSHeirGridFirstBuff()
      {
         super();
         a_1279 = -64;
         m_iYDisplayCenterPos = -55;
         scaleX = scaleY = 0.8;
         alpha = 0.5;
      }
      
      public static function a_3926() : GoldZBSHeirGridFirstBuff
      {
         return PoolManager.getInstance().CheckOutOne(GoldZBSHeirGridFirstBuff) as GoldZBSHeirGridFirstBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldZBSHeirGridFirstBuffMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         var format:TextFormat = null;
         super.a_1797(isReseaved);
         if(!this.m_txtBuffInfo)
         {
            this.m_txtBuffInfo = new TextField();
            format = new TextFormat();
            format.size = 14;
            format.color = 16777113;
            format.bold = true;
            format.font = "Arial";
            this.m_txtBuffInfo.defaultTextFormat = format;
            this.m_txtBuffInfo.selectable = false;
            this.m_txtBuffInfo.mouseEnabled = false;
            this.m_txtBuffInfo.multiline = true;
            this.m_txtBuffInfo.wordWrap = true;
            this.m_txtBuffInfo.width = 120;
            this.m_txtBuffInfo.filters = [new GlowFilter(0,1,2,2,10)];
            this.m_txtBuffInfo.x = -50 + 23;
            this.m_txtBuffInfo.y = -80 + 69;
            this.m_txtBuffInfo.text = "";
            addChild(this.m_txtBuffInfo);
         }
         a_1275 = 1;
         this.m_iStartTime = -1;
         play();
         if(this.stTargetGrid)
         {
            this.m_iXGridNo = this.stTargetGrid.m_iXGridNo;
            this.m_iYGridNo = this.stTargetGrid.m_iYGridNo;
            this.stTargetGrid.m_stCurrentBattbleFieldView.m_GoldZBSHeirGridFirstBuffDic[this.m_iXGridNo + "-" + this.m_iYGridNo] = this;
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
            dic = this.stTargetGrid.m_stCurrentBattbleFieldView.m_GoldZBSHeirGridFirstBuffDic;
            if(key in dic && dic[key] === this)
            {
               delete dic[key];
            }
            this.stTargetGrid = null;
         }
         if(this.m_txtBuffInfo.parent == this)
         {
            removeChild(this.m_txtBuffInfo);
            this.m_txtBuffInfo = null;
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
               if(a_2036.getInstance().isShowGrowTimes)
               {
                  if(this.m_iXGridNo == 8 && this.m_iYGridNo == 3)
                  {
                     MessageTipHandler.Get().a_3146("第" + (this.m_iStartTime / 10 + 1).toString() + "伤害:" + totalPower + "叠加" + time + "次");
                  }
                  this.updateBuffText();
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
                     stMoveIntruder.ReduceAllLife(totalPower,true,true);
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
         var m_stGoldZBSFirstBurnEffect:a_4108 = null;
         if(stMoveIntruder.m_stGoldZBSFirstBurnEffect == null && stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.IsBossIntruder)
         {
            m_stGoldZBSFirstBurnEffect = GoldZBSHeirIntruderFirstEffect.a_3926();
            GoldZBSHeirIntruderFirstEffect(m_stGoldZBSFirstBurnEffect).stTargetMouveIntruder = stMoveIntruder;
            stMoveIntruder.m_stGoldZBSFirstBurnEffect = m_stGoldZBSFirstBurnEffect;
            m_stGoldZBSFirstBurnEffect.a_1797(a_1283);
            m_stGoldZBSFirstBurnEffect.x = stMoveIntruder.x + 0.5 * stMoveIntruder.width + stMoveIntruder.stDisplayBitmap.x;
            m_stGoldZBSFirstBurnEffect.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_stGoldZBSFirstBurnEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
      
      private function updateBuffText() : void
      {
         var duration:int = 0;
         var secondsLeft:int = 0;
         var totalFrames:int = 0;
         for each(duration in this.m_BuffDurations)
         {
            if(duration > totalFrames)
            {
               totalFrames = duration;
            }
         }
         secondsLeft = Math.ceil(totalFrames / 10);
         this.m_txtBuffInfo.text = "叠" + this.m_BuffDurations.length + "\n剩" + secondsLeft + "秒" + "\n(" + this.stTargetGrid.m_iXGridNo + "," + this.stTargetGrid.m_iYGridNo + ")秒";
      }
   }
}

