package a_4794
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class a_4667 extends Bitmap
   {
      
      private var _data:a_4668;
      
      private var _vw:int;
      
      private var _vh:int;
      
      private var alignType:int;
      
      public function a_4667(data:a_4668, alignType:int = 0)
      {
         super(null);
         this._data = data;
         if(alignType != 1 && alignType != 0)
         {
            alignType = 0;
         }
         this.alignType = alignType;
         this.setSize(1,1);
      }
      
      public function setSize(w:int, h:int) : void
      {
         this._vw = w;
         this._vh = h;
         var maxV:int = this.getMaxValue();
         if(this._data.direction == 0)
         {
            if(this._vh == 0 || this._vh < maxV)
            {
               this._vh = maxV;
            }
         }
         else if(this._vw == 0 || this._vw < maxV)
         {
            this._vw = maxV;
         }
         if(this.bitmapData != null)
         {
            this.bitmapData.dispose();
         }
         this.bitmapData = new BitmapData(this._vw,this._vh,true,16777215);
         if(this._data.direction == 0)
         {
            this.setWidth();
         }
         else
         {
            this.setHeight();
         }
      }
      
      public function get data() : a_4668
      {
         return this._data;
      }
      
      private function getMaxValue() : int
      {
         var pro:String = null;
         if(this._data.direction == 0)
         {
            pro = "height";
         }
         else
         {
            pro = "width";
         }
         return Math.max(this.data.part1[pro],this.data.part2[pro],this.data.part3[pro]);
      }
      
      private function setWidth() : void
      {
         var maxV:int = this.getMaxValue();
         var matrix:Matrix = new Matrix();
         var tempV:int = 0;
         if(this.alignType == 1)
         {
            tempV = maxV - this.data.part1.height;
         }
         matrix.translate(0,tempV);
         this.bitmapData.draw(this.data.part1,matrix);
         matrix = new Matrix();
         if(this.alignType == 1)
         {
            tempV = maxV - this.data.part2.height;
         }
         matrix.scale((this._vw - this.data.part1.width - this.data.part3.width) / this.data.part2.width,1);
         matrix.translate(this.data.part1.width,tempV);
         this.bitmapData.draw(this.data.part2,matrix);
         matrix = new Matrix();
         if(this.alignType == 1)
         {
            tempV = maxV - this.data.part3.height;
         }
         matrix.translate(this._vw - this.data.part3.width,tempV);
         this.bitmapData.draw(this.data.part3,matrix);
      }
      
      private function setHeight() : void
      {
         var maxV:int = this.getMaxValue();
         var matrix:Matrix = new Matrix();
         var tempV:int = 0;
         if(this.alignType == 1)
         {
            tempV = maxV - this.data.part1.width;
         }
         matrix.translate(tempV,0);
         this.bitmapData.draw(this.data.part1,matrix);
         matrix = new Matrix();
         if(this.alignType == 1)
         {
            tempV = maxV - this.data.part3.width;
         }
         matrix.translate(tempV,this._vh - this.data.part3.height);
         this.bitmapData.draw(this.data.part3,matrix);
         matrix = new Matrix();
         if(this.alignType == 1)
         {
            tempV = maxV - this.data.part2.width;
         }
         matrix.scale(1,(this._vh - this.data.part1.height - this.data.part3.height) / this.data.part2.height);
         matrix.translate(tempV,this.data.part1.height);
         this.bitmapData.draw(this.data.part2,matrix);
      }
   }
}

