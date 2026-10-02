package com.aurora.ui.maogoutd.resource.defender.DragonYear.BaobaoLong
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BaoBaoLongFireEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      private var count:int = 0;
      
      private var hurtCount:Number = 0;
      
      private var iCount:int = 0;
      
      public function BaoBaoLongFireEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : BaoBaoLongFireEffect
      {
         return PoolManager.getInstance().CheckOutOne(BaoBaoLongFireEffect) as BaoBaoLongFireEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaoBaoLongFireEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         this.SetFrameIndex2(0,1);
         this.count = 0;
         play();
         this.iCount = 0;
         return true;
      }
      
      public function InitData(fieldGrid:a_3491, hurt:Number) : void
      {
         this.stOriginalFieldGrid = fieldGrid;
         this.hurtCount = hurt;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            a_3940();
            return;
         }
         ++this.count;
         if(this.count % 2 == 0 && this.count >= 8 && this.count <= 26)
         {
            arrMouveIntruder = this.stOriginalFieldGrid.a_1511.slice();
            for each(stMoveIntruder in arrMouveIntruder)
            {
               if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
               {
                  stMoveIntruder.a_3969(Math.ceil(this.hurtCount * 0.1));
                  ++this.iCount;
                  trace("damage count:" + this.iCount + "   " + this.count + "   " + this.hurtCount + "   " + this.hurtCount * 0.1);
                  if(stMoveIntruder.iLifeValue <= 0 && Boolean(stMoveIntruder.m_stCurrentFieldGrid))
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
         if(this.count == 26)
         {
            trace("end count:" + this.iCount + "   " + this.count + "   " + this.hurtCount + "   " + this.hurtCount * 0.1);
            this.SetFrameIndex(2);
         }
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetFrameIndex2(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
   }
}

