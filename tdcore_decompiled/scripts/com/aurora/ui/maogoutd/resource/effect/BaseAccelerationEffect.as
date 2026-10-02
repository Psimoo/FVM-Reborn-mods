package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   
   public class BaseAccelerationEffect extends a_3909
   {
      
      protected static const KEY_FRAME_APPEAR:uint = 0;
      
      protected static const KEY_FRAME_LOOP:uint = 1;
      
      protected static const KEY_FRAME_DISAPPEAR:uint = 2;
      
      protected var m_iCurKeyFrameID:uint;
      
      protected var a_1334:a_3491;
      
      protected var m_iDelayTick:int;
      
      protected var m_iShowTick:int;
      
      protected var m_bIsEffective:Boolean;
      
      protected var m_bIsShow:Boolean;
      
      protected var m_bIsPlaying:Boolean;
      
      public function BaseAccelerationEffect()
      {
         super();
         a_1279 = -0.5 * width;
      }
      
      public function get iShowTick() : int
      {
         return this.m_iShowTick;
      }
      
      public function get iDelayTick() : int
      {
         return this.m_iDelayTick;
      }
      
      public function a_1797(stFieldGrid:a_3491, iShowTick:int = 1000, bIsReversed:Boolean = false, iDelayTick:int = 0) : Boolean
      {
         if(null == stFieldGrid)
         {
            throw Error("BaseAccelerationEffect->Initialize::stFieldGrid is null!");
         }
         this.a_1334 = stFieldGrid;
         this.m_iShowTick = iShowTick;
         a_1283 = bIsReversed;
         this.m_iDelayTick = iDelayTick;
         this.a_1334.AddAcceleration(this);
         this.m_bIsEffective = false;
         this.m_bIsShow = false;
         visible = false;
         this.a_4332();
         return true;
      }
      
      public function get IsEffective() : Boolean
      {
         return this.m_bIsShow && this.m_bIsEffective;
      }
      
      protected function AddToStage() : void
      {
         this.m_bIsShow = true;
         this.m_bIsEffective = true;
         this.setPosition();
         gotoAndStop(1);
         this.m_iCurKeyFrameID = KEY_FRAME_APPEAR;
         visible = true;
         this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,this.a_1334);
      }
      
      protected function setPosition(iOffsetX:int = 0, iOffsetY:int = 10) : void
      {
         this.x = 0.5 * a_3491.a_1080 + this.a_1334.m_iXGridNo * a_3491.a_1080 + iOffsetX;
         var fPosY:Number = a_3491.a_1081 - this.height - 5;
         if(fPosY < 0)
         {
            if(this.height > a_3491.a_1081)
            {
               fPosY = 0.5 * (a_3491.a_1081 - this.height);
            }
            else
            {
               fPosY = 0;
            }
         }
         this.y = fPosY + this.a_1334.m_iYGridNo * a_3491.a_1081 + iOffsetY;
      }
      
      protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = false) : void
      {
         if(!bIsNeed && this.m_iCurKeyFrameID == iFrame)
         {
            return;
         }
         this.m_iCurKeyFrameID = iFrame;
         var iCurFrameID:int = (a_1276[this.m_iCurKeyFrameID] as FrameLabel).frame;
         gotoAndStop(iCurFrameID);
         a_3419();
      }
      
      protected function a_4332() : void
      {
         this.m_bIsPlaying = true;
      }
      
      protected function a_2218() : void
      {
         this.m_bIsPlaying = false;
      }
      
      protected function IsPlaying() : Boolean
      {
         return this.m_bIsPlaying;
      }
      
      public function a_3940() : Boolean
      {
         visible = false;
         a_1283 = false;
         this.m_bIsShow = false;
         this.m_bIsEffective = false;
         this.m_iShowTick = this.m_iDelayTick = 0;
         this.a_2218();
         gotoAndStop(1);
         if(null != this.a_1334)
         {
            this.a_1334.RemoveAcceleration(this);
            this.a_1334 = null;
         }
         if(null != this.parent)
         {
            this.parent.removeChild(this);
         }
         return true;
      }
      
      protected function IsPlayRate(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      public function UpdateTick(iShowTick:int, iDelayTick:int) : void
      {
         if(iDelayTick < this.m_iDelayTick)
         {
            this.m_iDelayTick = iDelayTick;
         }
         if(iShowTick > this.m_iShowTick)
         {
            this.m_iShowTick = iShowTick;
         }
      }
      
      public function a_3957(iCurrentTime:int) : void
      {
         if(!this.m_bIsPlaying || !this.IsPlayRate(iCurrentTime))
         {
            return;
         }
         if(this.m_iDelayTick > 0)
         {
            --this.m_iDelayTick;
            return;
         }
         if(!this.m_bIsShow && this.m_iShowTick > 0)
         {
            this.AddToStage();
            return;
         }
         nextFrame();
         if(this.m_iShowTick > 0)
         {
            --this.m_iShowTick;
            if(0 == this.m_iShowTick)
            {
               this.m_bIsEffective = false;
               this.GotoAndStopFrame(KEY_FRAME_DISAPPEAR,false);
            }
            else if(null != a_1278)
            {
               this.GotoAndStopFrame(KEY_FRAME_LOOP,true);
            }
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
   }
}

