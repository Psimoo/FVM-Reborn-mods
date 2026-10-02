package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypString;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class BaseBuffEffectMovieClip extends Sprite
   {
      
      private var a_1264:MovieClip;
      
      private var a_1265:Vector.<BitmapData>;
      
      private var m_iCurrentFrameEx:EncrypIntEx;
      
      protected var m_iTotalFramesEncrypIntEx:EncrypIntEx;
      
      private var m_iFrameLabelIndexEx:EncrypIntEx;
      
      private var m_isReversedEx:EncrypBooleanEx;
      
      protected var a_1276:Array;
      
      protected var a_1277:Array;
      
      private var m_szCurrentLableEx:EncrypString;
      
      private var m_iXDisplayCenterPosEx:EncrypIntEx;
      
      private var m_iYDisplayCenterPosEx:EncrypIntEx;
      
      public function BaseBuffEffectMovieClip()
      {
         super();
         this.a_3910();
      }
      
      protected function a_3910() : Boolean
      {
         var frameLabel:FrameLabel = null;
         this.a_1265 = this.a_3911();
         if(null == this.a_1265)
         {
            trace("null == m_arrFrameCache");
            return false;
         }
         this.a_1264 = this.a_3913();
         if(null == this.a_1264)
         {
            trace("null == m_arrFrameCache");
            return false;
         }
         this.a_1264.x = this.a_1279;
         this.a_1264.y = this.m_iYDisplayCenterPos;
         addChild(this.a_1264);
         this.a_1274 = this.a_1264.totalFrames;
         this.a_1276 = this.a_1264.currentLabels;
         this.a_1277 = new Array();
         for each(frameLabel in this.a_1276)
         {
            this.a_1277[frameLabel.frame] = frameLabel.name;
         }
         return true;
      }
      
      public function a_1797(isReversed:Boolean = false) : Boolean
      {
         this.a_1283 = isReversed;
         return true;
      }
      
      public function nextFrame() : void
      {
         ++this.a_1273;
         if(this.a_1273 > this.a_1274)
         {
            this.a_1273 = this.a_1274;
         }
         this.a_3917();
         this.a_3419();
      }
      
      private function a_3917() : void
      {
         this.a_1278 = this.a_1277[this.a_1273];
         this.a_1264.gotoAndStop(this.a_1273);
         if(this.a_1283)
         {
            this.a_1264.scaleX = -1;
         }
         else
         {
            this.a_1264.scaleX = 1;
         }
      }
      
      protected function a_3419() : void
      {
         if(this.a_1283)
         {
            this.a_1264.x = -this.a_1279;
         }
         else
         {
            this.a_1264.x = this.a_1279;
         }
         this.a_1264.y = this.m_iYDisplayCenterPos;
      }
      
      protected function get a_1273() : int
      {
         if(!this.m_iCurrentFrameEx)
         {
            this.m_iCurrentFrameEx = new EncrypIntEx(0);
         }
         return this.m_iCurrentFrameEx.Value;
      }
      
      protected function set a_1273(value:int) : void
      {
         if(!this.m_iCurrentFrameEx)
         {
            this.m_iCurrentFrameEx = new EncrypIntEx(0);
         }
         this.m_iCurrentFrameEx.Value = value;
      }
      
      protected function set a_1274(value:int) : void
      {
         if(!this.m_iTotalFramesEncrypIntEx)
         {
            this.m_iTotalFramesEncrypIntEx = new EncrypIntEx(0);
         }
         if(this.m_iTotalFramesEncrypIntEx.Value != 0 && value == 1)
         {
            value = int(this.a_1265.length);
         }
         this.m_iTotalFramesEncrypIntEx.Value = value;
      }
      
      protected function get a_1274() : int
      {
         if(!this.m_iTotalFramesEncrypIntEx)
         {
            this.m_iTotalFramesEncrypIntEx = new EncrypIntEx(0);
         }
         if(Boolean(this.a_1264) && this.a_1264.totalFrames != this.m_iTotalFramesEncrypIntEx.Value)
         {
            return int.MAX_VALUE;
         }
         return this.m_iTotalFramesEncrypIntEx.Value;
      }
      
      protected function get a_1275() : int
      {
         if(!this.m_iFrameLabelIndexEx)
         {
            this.m_iFrameLabelIndexEx = new EncrypIntEx();
         }
         return this.m_iFrameLabelIndexEx.Value;
      }
      
      protected function set a_1275(value:int) : void
      {
         if(!this.m_iFrameLabelIndexEx)
         {
            this.m_iFrameLabelIndexEx = new EncrypIntEx();
         }
         this.m_iFrameLabelIndexEx.Value = value;
      }
      
      protected function get a_1283() : Boolean
      {
         if(!this.m_isReversedEx)
         {
            this.m_isReversedEx = new EncrypBooleanEx(false);
         }
         return this.m_isReversedEx.Value;
      }
      
      protected function set a_1283(value:Boolean) : void
      {
         if(!this.m_isReversedEx)
         {
            this.m_isReversedEx = new EncrypBooleanEx(false);
         }
         this.m_isReversedEx.Value = value;
      }
      
      public function IsReversed() : Boolean
      {
         return this.a_1283;
      }
      
      public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         this.a_1273 = frame as int;
         this.a_3917();
      }
      
      protected function a_3911() : Vector.<BitmapData>
      {
         return null;
      }
      
      protected function a_3912() : Vector.<Point>
      {
         return null;
      }
      
      protected function get a_1278() : String
      {
         if(!this.m_szCurrentLableEx)
         {
            this.m_szCurrentLableEx = new EncrypString();
         }
         return this.m_szCurrentLableEx.Value;
      }
      
      protected function set a_1278(value:String) : void
      {
         if(!this.m_szCurrentLableEx)
         {
            this.m_szCurrentLableEx = new EncrypString();
         }
         this.m_szCurrentLableEx.Value = value;
      }
      
      protected function get a_1279() : int
      {
         if(!this.m_iXDisplayCenterPosEx)
         {
            this.m_iXDisplayCenterPosEx = new EncrypIntEx(0);
         }
         return this.m_iXDisplayCenterPosEx.Value;
      }
      
      protected function set a_1279(value:int) : void
      {
         if(!this.m_iXDisplayCenterPosEx)
         {
            this.m_iXDisplayCenterPosEx = new EncrypIntEx(0);
         }
         this.m_iXDisplayCenterPosEx.Value = value;
      }
      
      protected function get m_iYDisplayCenterPos() : int
      {
         if(!this.m_iYDisplayCenterPosEx)
         {
            this.m_iYDisplayCenterPosEx = new EncrypIntEx(0);
         }
         return this.m_iYDisplayCenterPosEx.Value;
      }
      
      protected function set m_iYDisplayCenterPos(value:int) : void
      {
         if(!this.m_iYDisplayCenterPosEx)
         {
            this.m_iYDisplayCenterPosEx = new EncrypIntEx(0);
         }
         this.m_iYDisplayCenterPosEx.Value = value;
      }
      
      protected function a_3913() : MovieClip
      {
         return null;
      }
   }
}

