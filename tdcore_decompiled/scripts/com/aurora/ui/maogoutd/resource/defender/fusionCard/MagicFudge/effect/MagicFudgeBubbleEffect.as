package com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge.effect
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class MagicFudgeBubbleEffect extends a_4108
   {
      
      private static var ms_stMagicFudgeBubbleEffectVector:Array = new Array();
      
      private static var a_1300:Vector.<BitmapData> = new Vector.<BitmapData>(50);
      
      private static var a_1301:Vector.<Point> = new Vector.<Point>(50);
      
      private static var a_1302:MovieClip = new MagicFudgeBubbleEffectMovie();
      
      public var m_iWaitTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      private var m_BoundStopMouse:Array = new Array();
      
      public function MagicFudgeBubbleEffect()
      {
         super();
         a_1279 = -26;
         m_iYDisplayCenterPos = -3;
      }
      
      public static function a_3926() : MagicFudgeBubbleEffect
      {
         var stMagicFudgeBubbleEffect:MagicFudgeBubbleEffect = ms_stMagicFudgeBubbleEffectVector.pop();
         if(null == stMagicFudgeBubbleEffect)
         {
            stMagicFudgeBubbleEffect = new MagicFudgeBubbleEffect();
         }
         return stMagicFudgeBubbleEffect;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = 0;
         this.addShield(this.stOriginalFieldGrid);
         this.m_BoundStopMouse.length = 0;
         play();
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
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 20)
         {
            this.BoomSkill(this.stOriginalFieldGrid);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.m_iWaitTime > 0)
         {
            this.BoundStopSkill(this.stOriginalFieldGrid);
            --this.m_iWaitTime;
            if(this.m_iWaitTime == 0)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
         }
      }
      
      private function BoundStopSkill(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(!stFieldGrid)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.IntruderArray;
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if((0 == stMoveIntruder.iSpaceState || 1 == stMoveIntruder.iSpaceState) && this.m_BoundStopMouse.indexOf(stMoveIntruder) == -1)
            {
               this.m_BoundStopMouse.push(stMoveIntruder);
               setTimeout(this.showMouseEffect,3500,stMoveIntruder);
            }
         }
      }
      
      private function BoomSkill(stFieldGrid:a_3491) : void
      {
         if(!stFieldGrid)
         {
            return;
         }
         this.BoomMouse(stFieldGrid);
         var stStartFieldGrid:a_3491 = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + 1,stFieldGrid.m_iYGridNo);
         this.BoomMouse(stStartFieldGrid);
      }
      
      private function BoomMouse(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(!stFieldGrid)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.IntruderArray;
         for each(stMoveIntruder in arrMoveIntruder)
         {
            stMoveIntruder.a_4210();
         }
      }
      
      private function showMouseEffect(stMoveIntruder:a_4206) : void
      {
         stMoveIntruder.a_4208(b_182.a_435,this.m_iWaitTime);
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
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.ClearShield(this.stOriginalFieldGrid);
         this.m_BoundStopMouse.length = 0;
         this.stOriginalFieldGrid = null;
         if(-1 == ms_stMagicFudgeBubbleEffectVector.indexOf(this))
         {
            ms_stMagicFudgeBubbleEffectVector.push(this);
         }
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         return true;
      }
   }
}

