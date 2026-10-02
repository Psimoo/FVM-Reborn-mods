package com.aurora.ui.maogoutd.resource.defender.HorseYear.stardome
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.effect.HurtBuff;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.termiThreeShotGun.CanAddBuffInfoManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class ImperialStrikeHurtBuff extends a_4108
   {
      
      private var m_iStartTime:int;
      
      private var m_txtBuffInfo:TextField;
      
      private var m_bBuffTextInited:Boolean;
      
      public var stOriginalFieldGrid:a_3491;
      
      public var m_BaseDefense:a_3962;
      
      private var m_Buffs:Vector.<HurtBuff> = new Vector.<HurtBuff>(0);
      
      public function ImperialStrikeHurtBuff()
      {
         super();
      }
      
      public static function a_3926() : ImperialStrikeHurtBuff
      {
         return PoolManager.getInstance().CheckOutOne(ImperialStrikeHurtBuff) as ImperialStrikeHurtBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return ImperialStrikeHurtBuffMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         if(a_2036.getInstance().isShowGrowTimes)
         {
            this.m_txtBuffInfo = CanAddBuffInfoManager.Get().createBuffText();
            this.initBuffTextPosition();
         }
         if(this.m_BaseDefense)
         {
            this.addShield(this.m_BaseDefense.stFieldGrid);
            this.m_BaseDefense.m_FangyuBuff = this;
         }
         play();
         return true;
      }
      
      public function AddBuff(duration:int, hitTime:int) : void
      {
         this.m_Buffs.push(new HurtBuff(duration,0,hitTime));
         this.updateBuffDisplay();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var buff:HurtBuff = null;
         ++this.m_iStartTime;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         for(var i:* = int(this.m_Buffs.length - 1); i >= 0; i--)
         {
            buff = this.m_Buffs[i];
            if(--buff.duration <= 0)
            {
               if(Boolean(this.m_BaseDefense) && buff.hitTime > 0)
               {
                  this.m_BaseDefense.m_iFangyuTime = Math.max(0,this.m_BaseDefense.m_iFangyuTime - buff.hitTime);
               }
               this.m_Buffs[i] = this.m_Buffs[this.m_Buffs.length - 1];
               this.m_Buffs.pop();
            }
         }
         this.updateBuffDisplay();
         if(this.m_Buffs.length == 0)
         {
            this.a_3940();
            return;
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         var buff:HurtBuff = null;
         for(var i:int = 0; i < this.m_Buffs.length; i++)
         {
            buff = this.m_Buffs[i];
            if(buff.hitTime > 0)
            {
               --buff.hitTime;
               break;
            }
         }
         this.updateBuffDisplay();
      }
      
      private function initBuffTextPosition() : void
      {
         if(this.m_bBuffTextInited || !this.m_txtBuffInfo)
         {
            return;
         }
         addChild(this.m_txtBuffInfo);
         this.m_txtBuffInfo.x = (width - this.m_txtBuffInfo.width) * 0.5;
         this.m_txtBuffInfo.y = -this.m_txtBuffInfo.height - 4;
         this.m_txtBuffInfo.visible = true;
         this.m_bBuffTextInited = true;
      }
      
      private function updateBuffDisplay() : void
      {
         var layer:HurtBuff = null;
         var hitCount:int = 0;
         if(!this.m_txtBuffInfo || !a_2036.getInstance().isShowGrowTimes)
         {
            return;
         }
         var count:int = int(this.m_Buffs.length);
         if(count == 0)
         {
            return;
         }
         var maxDuration:int = 0;
         for each(layer in this.m_Buffs)
         {
            if(layer.duration > maxDuration)
            {
               maxDuration = layer.duration;
            }
         }
         hitCount = this.m_BaseDefense ? this.m_BaseDefense.m_iFangyuTime : 0;
         CanAddBuffInfoManager.Get().updateBuffText(this.m_txtBuffInfo,count,maxDuration / 10,hitCount);
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_txtBuffInfo != null)
         {
            CanAddBuffInfoManager.Get().HideBuffText(this.m_txtBuffInfo);
            this.m_txtBuffInfo = null;
            this.m_bBuffTextInited = false;
         }
         if(this.m_BaseDefense)
         {
            this.ClearShield(this.m_BaseDefense.stFieldGrid);
            this.m_BaseDefense.m_FangyuBuff = null;
            this.m_BaseDefense.m_iFangyuTime = 0;
            this.m_BaseDefense = null;
         }
         this.m_Buffs.length = 0;
         super.a_3940();
         return true;
      }
   }
}

