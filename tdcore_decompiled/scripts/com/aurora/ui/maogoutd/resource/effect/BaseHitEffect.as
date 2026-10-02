package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.events.Event;
   
   public class BaseHitEffect extends BaseGameEffect
   {
      
      private var stOriginalIntruder:a_4206;
      
      private var stTagKey:String;
      
      public function BaseHitEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         m_stMoveClip = a_3913() as GameMovieClip;
         if(m_stMoveClip)
         {
            a_1279 = m_stMoveClip.a_1279;
            m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
            scaleX = m_stMoveClip.m_iScaleX;
            scaleY = m_stMoveClip.m_iScaleY;
         }
         super.a_1797(isReversed);
         play();
         return true;
      }
      
      public function InitData(intruder:a_4206, key:String) : void
      {
         this.stOriginalIntruder = intruder;
         this.stTagKey = key;
         if(Boolean(this.stOriginalIntruder) && Boolean(this.stTagKey))
         {
            this.stOriginalIntruder.tagCom.AddSum(this.stTagKey);
         }
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(Boolean(this.stOriginalIntruder) && Boolean(this.stTagKey))
         {
            this.stOriginalIntruder.tagCom.RemoveSum(this.stTagKey);
            this.stOriginalIntruder = null;
         }
         this.stTagKey = null;
         super.a_3940();
         return true;
      }
   }
}

