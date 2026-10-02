package a_4802
{
   import a_4793.DragTarget;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.SimpleButton;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class a_4707
   {
      
      private var _thumb:DragTarget;
      
      private var _thumbSkin:Dictionary;
      
      private var minValue:Number = 0;
      
      private var skinData:Dictionary;
      
      private var direction:String = "v";
      
      private var vw:int;
      
      private var vh:int;
      
      public function a_4707(skin:Dictionary)
      {
         super();
         this._thumbSkin = new Dictionary(true);
         this.skinData = skin;
         this.dataTransform();
         var dict:Dictionary = new Dictionary(true);
         dict.simpleButton = new SimpleButton(this._thumbSkin.upState,this._thumbSkin.overState,this._thumbSkin.downState,this._thumbSkin.upState);
         dict.disabledState = this._thumbSkin.disabledState;
         this.minValue = 0;
         this._thumb = new DragTarget(dict);
      }
      
      public function setSize(w:int, h:int, dire:String = "v") : void
      {
         this.direction = dire;
         this.vw = w;
         this.vh = h;
         if(dire == "v")
         {
            this.adjustVSkin(w,h);
         }
         else
         {
            this.adjustHSkin(w,h);
         }
         this._thumb.setSize(0,0);
      }
      
      public function get thumb() : DragTarget
      {
         return this._thumb;
      }
      
      public function set thumbSkin(skin:Dictionary) : void
      {
         this.skinData = skin;
         this.minValue = 0;
         this.dataTransform();
         var dict:Dictionary = this._thumb.getSkin();
         var btn:SimpleButton = dict.simpleButton;
         dict.disabledState = this._thumbSkin.disabledState;
         btn.upState = this._thumbSkin.upState;
         btn.overState = this._thumbSkin.overState;
         btn.downState = this._thumbSkin.downState;
         this.setSize(this.vw,this.vh,this.direction);
      }
      
      public function get thumbSkin() : Dictionary
      {
         return this._thumbSkin;
      }
      
      private function dataTransform() : void
      {
         this._thumbSkin.upState = new Bitmap();
         this._thumbSkin.overState = new Bitmap();
         this._thumbSkin.downState = new Bitmap();
         this._thumbSkin.disabledState = new Bitmap();
      }
      
      private function adjustVSkin(w:uint, h:uint) : void
      {
         var k:String = null;
         var bm:Bitmap = null;
         var data:Dictionary = null;
         var matrix:Matrix = null;
         var temp:int = 0;
         if(this.minValue > 0)
         {
            if(h < this.minValue)
            {
               h = this.minValue;
            }
         }
         w = 0;
         for(k in this.skinData)
         {
            bm = this._thumbSkin[k] as Bitmap;
            data = this.skinData[k];
            if(bm.bitmapData != null)
            {
               bm.bitmapData.dispose();
            }
            if(data.a.width != 0)
            {
               if(this.minValue == 0)
               {
                  this.minValue = data.a.height + data.c.height;
                  if(data.d.width > 0)
                  {
                     if(this.minValue < data.d.height)
                     {
                        this.minValue = data.d.height + 2 * 2;
                     }
                  }
                  if(h < this.minValue)
                  {
                     h = this.minValue;
                  }
               }
               if(w == 0)
               {
                  w = Math.max(data.a.width,data.b.width,data.c.width,data.d.width);
               }
               bm.bitmapData = new BitmapData(w,h);
               bm.bitmapData.draw(data.a);
               matrix = new Matrix();
               temp = h - (data.a.height + data.c.height);
               matrix.scale(1,temp / data.b.height);
               matrix.translate(0,data.a.height);
               bm.bitmapData.draw(data.b,matrix);
               matrix = new Matrix();
               matrix.translate(0,h - data.c.height);
               bm.bitmapData.draw(data.c,matrix);
               if(data.d.width > 0)
               {
                  matrix = new Matrix();
                  matrix.translate((w - data.d.width) / 2,(h - data.d.height) / 2);
                  bm.bitmapData.draw(data.d,matrix);
               }
            }
         }
      }
      
      private function adjustHSkin(w:uint, h:uint) : void
      {
         var k:String = null;
         var bm:Bitmap = null;
         var data:Dictionary = null;
         var matrix:Matrix = null;
         var temp:int = 0;
         if(this.minValue > 0)
         {
            if(w < this.minValue)
            {
               w = this.minValue;
            }
         }
         h = 0;
         for(k in this.skinData)
         {
            bm = this._thumbSkin[k] as Bitmap;
            data = this.skinData[k];
            if(bm.bitmapData != null)
            {
               bm.bitmapData.dispose();
            }
            if(data.a.height != 0)
            {
               if(this.minValue == 0)
               {
                  this.minValue = data.a.width + data.c.width;
                  if(data.d.height > 0)
                  {
                     if(this.minValue < data.d.width)
                     {
                        this.minValue = data.d.width + 2 * 2;
                     }
                  }
                  if(w < this.minValue)
                  {
                     w = this.minValue;
                  }
               }
               if(h == 0)
               {
                  w = Math.max(data.a.height,data.b.height,data.c.height,data.d.height);
               }
               bm.bitmapData = new BitmapData(w,h);
               bm.bitmapData.draw(data.a);
               matrix = new Matrix();
               temp = w - (data.a.width + data.c.width);
               matrix.scale(temp / data.b.width,1);
               matrix.translate(data.a.width,0);
               bm.bitmapData.draw(data.b,matrix);
               matrix = new Matrix();
               matrix.translate(w - data.c.width,0);
               bm.bitmapData.draw(data.c,matrix);
               if(data.d.height > 0)
               {
                  matrix = new Matrix();
                  matrix.translate((w - data.d.width) / 2,(h - data.d.height) / 2);
                  bm.bitmapData.draw(data.d,matrix);
               }
            }
         }
      }
   }
}

