package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.utils.Timer;
   
   public class GhostBossEatenCardEffect extends Sprite
   {
      
      private var a_1626:Timer;
      
      private var a_1267:Bitmap;
      
      private var m_iTimes:int;
      
      private var m_numTargetXPos:Number;
      
      private var m_numTargetYPos:Number;
      
      private var a_1590:Number;
      
      private var m_numStartYPos:Number;
      
      private var m_numXSpeed:Number;
      
      private var m_numYSpeed:Number;
      
      public function GhostBossEatenCardEffect()
      {
         super();
         this.a_1267 = new Bitmap();
         addChild(this.a_1267);
         this.a_1626 = new Timer(50);
         this.a_1626.addEventListener(TimerEvent.TIMER,this.a_4426);
      }
      
      public static function a_3926() : GhostBossEatenCardEffect
      {
         return PoolManager.getInstance().CheckOutOne(GhostBossEatenCardEffect) as GhostBossEatenCardEffect;
      }
      
      public function a_1797(stDisplayBitmapData:BitmapData, numTargetXPos:Number, numTargetYPos:Number) : Boolean
      {
         this.visible = true;
         this.a_1267.bitmapData = stDisplayBitmapData;
         this.m_numTargetXPos = numTargetXPos;
         this.m_numTargetYPos = numTargetYPos;
         this.a_1267.x = -0.5 * this.a_1267.width;
         this.a_1267.y = -0.5 * this.a_1267.height;
         this.a_1267.transform.matrix = new Matrix();
         this.m_iTimes = 0;
         this.a_1626.start();
         return true;
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         this.a_1626.stop();
         this.a_1267.bitmapData = null;
         return true;
      }
      
      private function a_4426(a_4730:Event) : void
      {
         if(this.m_iTimes == 0)
         {
            this.m_numXSpeed = (this.m_numTargetXPos - x) / 20;
            this.m_numYSpeed = (this.m_numTargetYPos - y) / 20;
            this.a_1590 = x;
            this.m_numStartYPos = y;
         }
         ++this.m_iTimes;
         var stMaxtrix:Matrix = this.a_1267.transform.matrix;
         stMaxtrix.rotate(-Math.PI * 0.4 * this.m_iTimes);
         this.a_1267.transform.matrix = stMaxtrix;
         if(this.m_iTimes <= 20)
         {
            x = this.a_1590 + this.m_numXSpeed * this.m_iTimes;
            y = this.m_numStartYPos + this.m_numYSpeed * this.m_iTimes;
         }
         if(this.m_iTimes == 21)
         {
            this.a_3940();
         }
      }
   }
}

