package com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge.effect
{
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class MagicFudgeOutSideEffect extends a_3909
   {
      
      private static var ms_stMagicFudgeWaterTraySoulOutEffectVector:Array = new Array();
      
      private static var a_1300:Vector.<BitmapData> = new Vector.<BitmapData>(100);
      
      private static var a_1301:Vector.<Point> = new Vector.<Point>(100);
      
      private static var a_1302:MovieClip = new MagicFudgeOutSideEffectMovie();
      
      public function MagicFudgeOutSideEffect()
      {
         super();
      }
      
      public static function a_3926() : MagicFudgeOutSideEffect
      {
         var stMagicFudgeWaterTraySoulOutEffect:MagicFudgeOutSideEffect = ms_stMagicFudgeWaterTraySoulOutEffectVector.pop();
         if(null == stMagicFudgeWaterTraySoulOutEffect)
         {
            stMagicFudgeWaterTraySoulOutEffect = new MagicFudgeOutSideEffect();
         }
         return stMagicFudgeWaterTraySoulOutEffect;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         a_1275 = 1;
         return true;
      }
      
      override protected function a_3911() : Vector.<BitmapData>
      {
         return a_1300;
      }
      
      override protected function a_3912() : Vector.<Point>
      {
         return a_1301;
      }
      
      override protected function a_3913() : MovieClip
      {
         return a_1302;
      }
      
      public function a_3940() : Boolean
      {
         this.visible = false;
         gotoAndStop(1);
         if(-1 == ms_stMagicFudgeWaterTraySoulOutEffectVector.indexOf(this))
         {
            ms_stMagicFudgeWaterTraySoulOutEffectVector.push(this);
         }
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
   }
}

