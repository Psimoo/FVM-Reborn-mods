package a_4794
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class a_4669 extends Sprite
   {
      
      private var children:Dictionary;
      
      private var direction:int;
      
      private var data:a_4670;
      
      private var gird3:a_4667;
      
      public function a_4669(dt:a_4670, dire:int = 1)
      {
         super();
         this.data = dt;
         this.direction = dire;
         this.init();
      }
      
      private function init() : void
      {
         this.children = new Dictionary(true);
         this.children.part1 = this.makeGrid3Image("t");
         this.children.part2 = this.makeGrid3Image("c");
         this.children.part3 = this.makeGrid3Image("b",1);
         this.gird3 = new a_4667(new a_4668(this.children.part1,this.children.part2,this.children.part3,this.direction));
         addChild(this.gird3);
      }
      
      private function makeGrid3Image(dir:String, align:int = 0) : a_4667
      {
         var d:a_4668 = new a_4668(this.makeGrid3ImageData(dir + "l"),this.makeGrid3ImageData(dir + "c"),this.makeGrid3ImageData(dir + "r"));
         return new a_4667(d,align);
      }
      
      private function makeGrid3ImageData(pro:String) : DisplayObject
      {
         var p:DisplayObject = null;
         var d:* = this.data[pro];
         if(d is BitmapData)
         {
            p = new Bitmap(d);
         }
         else
         {
            p = d;
         }
         return p;
      }
      
      public function setSize(w:int, h:int) : void
      {
         if(this.direction == 0)
         {
            this.children.part1.setSize(0,h);
            this.children.part2.setSize(0,h);
            this.children.part3.setSize(0,h);
         }
         else
         {
            this.children.part1.setSize(w,0);
            this.children.part2.setSize(w,0);
            this.children.part3.setSize(w,0);
         }
         this.gird3.setSize(w,h);
      }
   }
}

