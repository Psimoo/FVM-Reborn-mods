package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.utils.Timer;
   
   public class a_4425 extends Sprite
   {
      
      private var a_1626:Timer;
      
      private var a_1267:Bitmap;
      
      private var a_1283:Boolean;
      
      private var m_iTimes:int;
      
      public function a_4425()
      {
         super();
         this.a_1267 = new Bitmap();
         addChild(this.a_1267);
         this.a_1626 = new Timer(100);
         this.a_1626.addEventListener(TimerEvent.TIMER,this.a_4426);
      }
      
      public static function a_3926() : a_4425
      {
         return PoolManager.getInstance().CheckOutOne(a_4425) as a_4425;
      }
      
      public function a_1797(stDisplayBitmapData:BitmapData, isReversed:Boolean) : Boolean
      {
         this.visible = true;
         this.a_1267.bitmapData = stDisplayBitmapData;
         this.a_1267.x = -0.5 * this.a_1267.width;
         this.a_1267.y = -0.5 * this.a_1267.height;
         this.a_1267.transform.matrix = new Matrix();
         this.a_1283 = isReversed;
         this.m_iTimes = 0;
         this.a_1626.start();
         return true;
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         this.a_1626.stop();
         if(this.a_1267.bitmapData)
         {
            this.a_1267.bitmapData.dispose();
            this.a_1267.bitmapData = null;
         }
         return true;
      }
      
      private function a_4426(a_4730:Event) : void
      {
         ++this.m_iTimes;
         var stMaxtrix:Matrix = this.a_1267.transform.matrix;
         if(this.a_1283)
         {
            stMaxtrix.rotate(Math.PI * 0.3 * this.m_iTimes);
            this.a_1267.transform.matrix = stMaxtrix;
            x -= 50;
         }
         else
         {
            stMaxtrix.rotate(-Math.PI * 0.4 * this.m_iTimes);
            this.a_1267.transform.matrix = stMaxtrix;
            x += 50;
         }
         y -= 25;
         if(x > BattleFieldView.a_1013 + 100 || x < -100 || y < -100)
         {
            this.a_3940();
         }
      }
   }
}

