package com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class GoldOsirisInvincibleBuff extends a_4108
   {
      
      public var m_BaseDefense:a_3962;
      
      private var m_iRemainTick:int = 0;
      
      private var m_pendingFangYuLayers:Array = [];
      
      public function GoldOsirisInvincibleBuff()
      {
         super();
         alpha = 0.8;
      }
      
      public static function a_3926(invincibleType:int = 1) : GoldOsirisInvincibleBuff
      {
         var bindMovie:Class = bindMovieForInvincibleType(invincibleType);
         return PoolManager.getInstance().CheckOutOne(GoldOsirisInvincibleBuff,bindMovie) as GoldOsirisInvincibleBuff;
      }
      
      private static function bindMovieForInvincibleType(invincibleType:int) : Class
      {
         if(invincibleType == 1)
         {
            return GoldOsirisBaseInvincibleBuffMovie;
         }
         throw new Error("GoldOsirisInvincibleBuff: unsupported invincibleType=" + invincibleType);
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         m_stMoveClip = a_3913() as GameMovieClip;
         a_1279 = m_stMoveClip.a_1279;
         m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         super.a_1797(isReversed);
         if(this.m_BaseDefense)
         {
            this.addShield(this.m_BaseDefense.stFieldGrid);
            this.m_BaseDefense.m_InvincibleBuff = this;
         }
         play();
         return true;
      }
      
      public function AddDuration(durationTick:int, needReset:Boolean, fangYuTick:int, hitCount:int) : void
      {
         if(needReset)
         {
            this.m_iRemainTick = durationTick;
         }
         else
         {
            this.m_iRemainTick += durationTick;
         }
         if(fangYuTick > 0 && hitCount > 0)
         {
            this.pushPendingFangYu(fangYuTick,hitCount);
         }
      }
      
      private function pushPendingFangYu(fangYuTick:int, hitCount:int) : void
      {
         this.m_pendingFangYuLayers.push({
            "fangYuTick":fangYuTick,
            "hitCount":hitCount
         });
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(--this.m_iRemainTick <= 0)
         {
            this.a_3940();
            return;
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         var layer:Object = null;
         if(this.m_BaseDefense)
         {
            this.ClearShield(this.m_BaseDefense.stFieldGrid);
            this.m_BaseDefense.m_InvincibleBuff = null;
            for each(layer in this.m_pendingFangYuLayers)
            {
               if(layer.hitCount > 0 && layer.fangYuTick > 0)
               {
                  this.m_BaseDefense.AddFangyuBuff(layer.hitCount,layer.fangYuTick);
               }
            }
            this.m_BaseDefense = null;
         }
         this.m_iRemainTick = 0;
         this.m_pendingFangYuLayers.length = 0;
         super.a_3940();
         return true;
      }
   }
}

